package com.naver.myhome.task;
  
import java.io.File; 
import javax.mail.internet.MimeMessage; 
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.beans.factory.annotation.Value; 
import org.springframework.core.io.FileSystemResource; 
import org.springframework.mail.javamail.JavaMailSenderImpl; 
import org.springframework.mail.javamail.MimeMessageHelper; 
import org.springframework.mail.javamail.MimeMessagePreparator; 
import org.springframework.stereotype.Component; 
import com.naver.myhome.domain.MailVO;  
  


@Component
public class SendMail {
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	
	//savefolder.properties의 sendfile의 속성 값을 String sendfile에 주입합니다.
	@Value("${sendfile}")  //보낼 이미지 경로 >savefolder.properties의 sendfile 
	private String sendfile;
	
	private static final Logger logger = LoggerFactory.getLogger(SendMail.class);

	public void sendMail(MailVO vo) {
		//인터페이스 MimeMessagePreparator
		MimeMessagePreparator mp = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				//두 번째 인자 true는 멀티 파트 메시지를 사용하겠다는 의미입니다.
				MimeMessageHelper helper
				   = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(vo.getFrom());
				helper.setTo(vo.getTo());
				helper.setSubject(vo.getSubject());
				String content =  vo.getContent();
				helper.setText(content, true);
				
				
			}
		};
		mailSender.send(mp);  //메일 전송합니다.
		logger.info("메일 전송했습니다.");
		
	}
}	

