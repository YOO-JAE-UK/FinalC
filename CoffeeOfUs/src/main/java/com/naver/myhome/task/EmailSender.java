package com.naver.myhome.task;
  

import javax.mail.internet.MimeMessage; 
import org.slf4j.Logger; 
import org.slf4j.LoggerFactory; 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import com.naver.myhome.domain.MailVO2;
  


@Component
public class EmailSender {
	
	private static final Logger logger = LoggerFactory.getLogger(SendMail.class);
	
	@Autowired
    protected JavaMailSender  mailSender;
	
	public void emailSender(MailVO2 vo) {
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

