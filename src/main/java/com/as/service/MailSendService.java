package com.as.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("mms")
public class MailSendService {
	@Autowired
	private JavaMailSender mailSender;

	int size; // 난수 사이즈

	// 인증키 생성
	private String getKey(int size) {
		this.size = size;
		return getAuthCode();
	}

	//인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }

    //인증메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        MimeMessage mail = mailSender.createMimeMessage();
        String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
                            + "<a href='http://localhost:8088/front/mail/show_Session?email="
                            + email + "&authKey=" + authKey + "' target='_blank'>이메일 인증 확인</a>";

        //인증메일 보내기
        try {
            mail.setSubject("회원가입 이메일 인증", "utf-8");
            mail.setText(mailContent, "utf-8", "html");
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            mailSender.send(mail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return authKey;
    }
}
