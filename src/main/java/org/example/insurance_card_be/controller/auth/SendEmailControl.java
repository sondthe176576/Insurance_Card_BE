package org.example.insurance_card_be.controller.auth;

import org.example.insurance_card_be.model.UserVerify;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class SendEmailControl {
    public String getRandom()
    {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d", number);
    }

    public boolean sendEmail(UserVerify user)
    {
        boolean test = false;
        String toUserName = user.getEmail();
        String fromEmail = "insurancecard0@gmail.com";
        String password = "cdht rjrp vdpp qlyi";

        try{
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toUserName));
            message.setSubject("Verification Code");
            message.setText("Your verification code is: " + user.getCode());

            Transport.send(message);
            test = true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}