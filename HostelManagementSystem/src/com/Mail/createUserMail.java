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
//import com.sun.xml.internal.stream.buffer.sax.Properties;

public class createUserMail{
	public static void varifyEmail(String recipient, int otp) throws Exception {
		
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
		 
		Message message = prepareMessage (session,myAccount,recipient,otp);
		Transport.send(message);
		System.out.println("Message Send Successfully");
	}
	
	private static Message prepareMessage(Session session,String myAccount,String recipient,int otp) {
		// TODO Auto-generated method stub
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(myAccount));
			message.setRecipient(Message.RecipientType.TO ,new InternetAddress(recipient));
			message.setSubject("Varify Your Email");
			String htmlCode = "<h2>Dear User !! </h2><br/>";
			message.setContent(htmlCode,"text/html");
			message.setText("Dear User \n To varify your Email while creating account at SPPU hostel \nuse one time password \nyour one time password is "+otp+"\n\nDo not share it with others.");
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
	public static void sendCreateUserMail(String recipient,String userPassword) throws Exception {
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
		 
		Message message = prepareMessage1 (session,myAccount,recipient,userPassword);
		Transport.send(message);
		System.out.println("Message Send Successfully");
	}
	
	private static Message prepareMessage1(Session session,String myAccount,String recipient,String userPassword ) {
		// TODO Auto-generated method stub
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(myAccount));
			message.setRecipient(Message.RecipientType.TO ,new InternetAddress(recipient));
			message.setSubject("You Have Successfully Created The Account");
			String htmlCode = "<h2>Dear User !! </h2><br/>";
			message.setContent(htmlCode,"text/html");
			message.setText("Dear User \n you have Successfully created the account\nyour credentials are: \nUserName: "+recipient+"\nPassword: "+userPassword+"\nplease remember your credentials and Do not share it with others.");
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