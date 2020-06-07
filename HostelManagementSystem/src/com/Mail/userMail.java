package com.Mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class userMail {
	public static void latePassIdMail(String recipient, int latePassId)throws Exception {
		System.out.println("Preparing to send the message");
		Properties properties = new Properties();
		 properties.put("mail.smtp.auth","true");
		 properties.put("mail.smtp.starttls.enable","true");
		 properties.put("mail.smtp.host","smtp.gmail.com");
		 properties.put("mail.smtp.port","587");
		 
		 String myAccount ="abc@gmail.com";
		 String password ="abc";
		
		 Session session = Session.getInstance(properties,new Authenticator() {
			 @Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// TODO Auto-generated method stub
				return new PasswordAuthentication(myAccount, password);
			}
		});
		 
		Message message = prepareMessage (session,myAccount,recipient,latePassId);
		Transport.send(message);
		System.out.println("Message Send Successfully");
	}
	
	private static Message prepareMessage(Session session,String myAccount,String recipient,int latePassId) {
		// TODO Auto-generated method stub
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(myAccount));
			message.setRecipient(Message.RecipientType.TO ,new InternetAddress(recipient));
			message.setSubject("Your LatePass Has been Approved");
			String htmlCode = "<h2>Dear User !! </h2><br/>";
			message.setContent(htmlCode,"text/html");
			message.setText("Dear User \n Your request for latePass has been approved \nyour late pass id is  "+latePassId+"\n\nDo not share it with others  and reach to the Hostel before 12 PM");
			return message;
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
}