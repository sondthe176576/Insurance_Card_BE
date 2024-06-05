package org.example.insurance_card_be.controller.auth;

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
        String fromEmail = "son465331@gmail.com";
        String password = "flxmagxcvgahnnce";

        try{
            Properties props = new Properties();
            props.setProperty("mail.smtp.host", "smtp.gmail.com");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(toUserName));
            message.setSubject("User Verification");
            message.setText("Register succesfully, please fill code in this blank in your email:" + user.getCode());
            Transport.send(message);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}