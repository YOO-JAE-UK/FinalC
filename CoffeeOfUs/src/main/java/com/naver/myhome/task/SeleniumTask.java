package com.naver.myhome.task;


import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.naver.myhome.domain.CRAWLER;
import com.naver.myhome.service.Main_Service;

@Service
public class SeleniumTask {
	private static final Logger logger = LoggerFactory.getLogger(SeleniumTask.class);
	
	@Autowired
	private Main_Service Main_Service;
	
	 //WebDriver
    private WebDriver driver;
    
    //private WebElement webElement;
    
    //Properties
    public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
    public static final String WEB_DRIVER_PATH = "C:\\chromedriver_win32/chromedriver.exe";
    
    //크롤링 할 URL
    private String base_url;
	
	//@Autowired
	//private BoardService boardService;
	
	//스케줄러를 이용해서 주기적으로
	//매일, 매주, 매월 프로그램 실행을 위한 작업을 실시합니다.
	//@Scheduled(fixedDelay=1000)
	//밀리세컨드 단위입니다.
	public void test() throws Exception{
		logger.info("test");
	}
	
	//cron 사용법
	//second(초 : 0~59) minutes(분:0~59) hours(시:0~23) day(일:1~31)
	//months(달:1~12) day of week(요일:0~6) year(optional)
	//초 분 시 일 달 요일
	//@Scheduled(cron = "0 14 * * * *")
	public void getSelenim() throws Exception {
		logger.info("getSelenium");
		System.out.println("hiSelenium");
		
		/*
		 	SeleniumTest03_상영중영화보기 selTest = new SeleniumTest03_상영중영화보기();
		        selTest.crawl();
		 * */
		
		        //System Property SetUp 드라이버설정
		        System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
		        
		                
		        //Driver SetUp
		         ChromeOptions options = new ChromeOptions();
		//       options.addArguments("--window-size=1366,768");	//
		//       options.addArguments("--headless");				//
		//         options.setProxy(null);							//
		         options.setCapability("ignoreProtectedModeSettings", true);
		         options.addArguments("headless");
		         driver = new ChromeDriver(options);
		        
		         base_url="https://bwissue.com/coffeestory";
		        
		 
		        try {
		            //get page (= 브라우저에서 url을 주소창에 넣은 후 request 한 것과 같다)
		            driver.get(base_url);
		            
		            
		          //브라우저 이동시 생기는 로드시간을 기다린다.
		    		//HTTP응답속도보다 자바의 컴파일 속도가 더 빠르기 때문에 임의적으로 1초를 대기한다.
		    		try {Thread.sleep(1000);} catch (InterruptedException e) {}
		    		CRAWLER bean = new CRAWLER();
		    		String str="";
		    		for(int i=0; i<7;i++) {
		    			
		    			str = driver.findElements(By.cssSelector("div > div.col-xs-12.col-sm-4.pd-0 > a")).get(i).getAttribute("style");
		    			int intstart = str.indexOf("url("); 
			    		int intend = str.indexOf(");");
			    		String result=str.substring(intstart+5, intend-1); 
			    		System.out.println(result);
			    		bean.setCRAWLER_IMAGE(result);
			    		
			    		String test = driver.findElements(By.className("commentCW")).get(i).getText();
			    		
			    		str = driver.findElements(By.className("cover-subject")).get(i).getText();
			    		if(test!=null) {
			    			int strnum = test.length();
			    			str =str.substring(0,str.length()-strnum);
			    		}
			    			//str 저장	  
			    		System.out.println(str);
			    		bean.setCRAWLER_COVER_SUBJECT(str);
			    		
			    		str = driver.findElements(By.className("summary")).get(i).getText();
			    		System.out.println(str);
			    		bean.setCRAWLER_SUMMARY(str);
			    		
			    		str = driver.findElements(By.className("date")).get(i).getText();
			    		str=str.substring(5);
			    		System.out.println(str);
			    		bean.setCRAWLER_DATE(str);
			    		
			    		str = driver.findElements(By.cssSelector("p.cover-subject > a")).get(i).getAttribute("href");
			    		System.out.println(str);
			    		bean.setCRAWLER_LINK(str);
			    		
			    		bean.setCRAWLER_NUM(7-i);
			    		//저장 메서드 호출해야함
			    		int result1 = Main_Service.update(bean);
			    		if (result1 == 1) {
			    			System.out.println("update성공");
			    		}else {
			    			System.out.println("update실패");
			    		}
		    		}
		    		
		    		
		    		
		        } catch (Exception e) {
		            
		            e.printStackTrace();
		        
		        } finally {
		 
		            driver.close();
		        }

		 
		
		
		
		
		
		
		
		
		
		
	}//getselenium end
	
}
