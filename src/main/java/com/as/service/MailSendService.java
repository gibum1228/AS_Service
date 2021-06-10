package com.as.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.as.dto.Member;

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
    public String sendAuthMail(Member m) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        MimeMessage mail = mailSender.createMimeMessage();
//        String mailContent = "<h1>[이메일 인증]</h1><br><p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
//                            + "<a href='http://localhost:8088/front/mail/show_Session?email="
//                            + email + "&authKey=" + authKey + "' target='_blank'>이메일 인증 확인</a>";
        StringBuffer emailcontent = new StringBuffer();
		emailcontent.append("<!DOCTYPE html>");
		emailcontent.append("<html>");
		emailcontent.append("<head>");
		emailcontent.append("</head>");
		emailcontent.append("<body>");
		emailcontent.append(
				" <div" 																																																	+
				"	style=\"font-family: 'Apple SD Gothic Neo', 'sans-serif' !important; width: 400px; height: 400px; border-top: 4px solid #02b875; margin: 100px auto; padding: 30px 0; box-sizing: border-box;\">"		+
				"	<h1 style=\"margin: 0; padding: 0 5px; font-size: 28px; font-weight: 400;\">"																															+
				"		<span style=\"font-size: 15px; margin: 0 0 10px 3px;\">성공회대학교 A/S실 서비스</span><br />"																													+
				"		<span style=\"color: #02b875\">메일인증</span> 안내입니다."																																				+
				"	</h1>\n"																																																+
				"	<p style=\"font-size: 16px; line-height: 26px; margin-top: 50px; padding: 0 5px;\">"																													+
				m.getName()																																																+
				"		님 안녕하세요.<br />"																																													+
				"		성공회대학교 A/S실 서비스를 이용해 주셔서 진심으로 감사드립니다.<br />"																																						+
				"		아래 <b style=\"color: #02b875\">'메일 인증'</b> 버튼을 클릭하여 회원가입을 완료해 주세요.<br />"																													+
				"		감사합니다."																																															+
				"	</p>"																																																	+
				"	<a style=\"color: #FFF; text-decoration: none; text-align: center;\""																																	+
				"	href=\"http://localhost:8088/user/mail/verifying?email=" + m.getEmail() + "&authKey=" + authKey + "\" target=\"_blank\">"														+
				"		<p"																																																	+
				"			style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #02b875; line-height: 45px; vertical-align: middle; font-size: 16px;\">"							+
				"			메일 인증</p>"																																														+
				"	</a>"																																																	+
				"	<div style=\"border-top: 1px solid #DDD; padding: 5px;\"></div>"																																		+
				" </div>"
		);
		emailcontent.append("</body>");
		emailcontent.append("</html>");

        //인증메일 보내기
        try {
            mail.setSubject("회원가입 이메일 인증", "utf-8");
            mail.setText(emailcontent.toString(), "utf-8", "html");
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(m.getEmail()));
            mailSender.send(mail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return authKey;
    }
}
