package guestbook;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;
//
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.labs.repackaged.org.json.JSONException;
//
import com.googlecode.objectify.ObjectifyService;
import com.sendgrid.SendGrid;
////
//
import sendGridGoogle.Sendgrid;
//@SuppressWarnings("serial")
//public class CronServlet extends HttpServlet {
//	private static final Logger _logger = Logger.getLogger(CronServlet.class.getName());
//
//	static {
//		ObjectifyService.register(Subscriber.class);
//		ObjectifyService.register(Greeting.class);
//	}
//
//	@SuppressWarnings("deprecation")
//	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//		try {
//
//			ObjectifyService.register(Subscriber.class);
//			List<Subscriber> subscribers = ObjectifyService.ofy().load().type(Subscriber.class).list();
//			Collections.sort(subscribers);
//
//			ObjectifyService.register(Greeting.class);
//			List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
//			Collections.sort(greetings);
//
//			_logger.info("Cron Job has been executed");
//			Properties props = new Properties();
//			Session session = Session.getDefaultInstance(props, null);
//
//			try {
//				Message msg = new MimeMessage(session);
//			msg.setFrom(new InternetAddress("tarang.khandpur@utexas.edu"));
//				msg.setSubject("461L_HW1_Cron: Here's what has happened on the Blog Yesterday Since 5:00pm");
//				String str = new String();
//				Date yesterday = new Date();
//				yesterday.setHours(-24);
//
//				for (Greeting a : greetings) {
//					if (a.getDate().after(yesterday)) {
//						str = str + a.getTitle() + "\n" + a.getDate().toString() + "\n" + a.getContent() + "\n" + "by: "
//								+ a.getUser() + "\n"
//								+ "______________________________________________________________________________________"
//								+ "\n";
//					}
//				}
//
//				//msg.setText(str);
//				msg.setText("hi");
//				for (Subscriber b : subscribers) {
//
//					msg.addRecipient(Message.RecipientType.TO,
//							//new InternetAddress(b.getUser().getEmail(), b.getUser().getNickname()));
//							new InternetAddress("karimesm94@gmail.com", "Karime"));
//					Transport.send(msg);
//				}
//		
//
//			} catch (AddressException e) {
//				// ...
//			} catch (MessagingException e) {
//				// ...
//			} catch (UnsupportedEncodingException e) {
//				// ...
//			}
////			// Put your logic here
////			// BEGIN
////			// END
//		} catch (Exception ex) {
//			_logger.info("we have an error, its karime's fault");
//			// Log any exceptions in your Cron Job
//		}
//	}
//
//	@Override
//	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		doGet(req, resp);
//	}
//}
//





//-------------------------------------------SendGrid Below ------------------




//
//@SuppressWarnings("serial")
//@WebServlet(name = "sendemail", value = "/send/email")
//public class CronServlet extends HttpServlet {
//
//  @Override
//  public void service(HttpServletRequest req, HttpServletResponse resp) throws IOException,
//      ServletException {
//    final String sendgridApiKey = System.getenv("SENDGRID_API_KEY");
//    final String sendgridSender = System.getenv("SENDGRID_SENDER");
//    final String toEmail = req.getParameter("to");
//    if (toEmail == null) {
//      resp.getWriter()
//          .print("Please provide an email address in the \"to\" query string parameter.");
//      return;
//    }
//
//    SendGrid sendgrid = new SendGrid(sendgridApiKey);
//    SendGrid.Email email = new SendGrid.Email();
//    email.addTo(toEmail);
//    email.setFrom(sendgridSender);
//    email.setSubject("This is a test email");
//    email.setText("Example text body.");
//
//    try {
//      SendGrid.Response response = sendgrid.send(email);
//      if (response.getCode() != 200) {
//        resp.getWriter().print(String.format("An error occured: %s", response.getMessage()));
//        return;
//      }
//      resp.getWriter().print("Email sent.");
//    } catch (SendGridException e) {
//      throw new ServletException("SendGrid error", e);
//    }
//  }
//}





//-------------------------Sendgrid test 2 ------------

//import sendGridGoogle.Sendgrid;
////set credentials
//Sendgrid mail = new Sendgrid("","");
////set email data
//mail.setTo(“foo@bar.com”)
//.setFrom(“me@bar.com”)
//.setSubject(“Subject goes here”)
//.setText(“Hello World!”)
//.setHtml(“Hello World!”);
////send your message
//mail.send();
//


//-----------------------Sendgrid test 3 -----------------


//Sendgrid mail = new Sendgrid("TKarime","khandpur104");
//
//
//mail.setTo("TKnologic104@gmail.com").setFrom("tarang.khandpur@utexas.edu").setSubject("Subject goes here").setText("Hello World!").setHtml("<strong>Hello World!</strong>");
//
//String str = new String("helloCron");
//mail.send();
//}
	





//-----------------------Sendgri test 4 --------------------
//public class CronServlet {
//	  public static void main(String[] args) {
//		  								//API KEY
//	    SendGrid sendgrid = new SendGrid("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");
//
//	    SendGrid.Email email = new SendGrid.Email();
//
//	    email.addTo("test@sendgrid.com");
//	    email.setFrom("you@youremail.com");
//	    email.setSubject("Sending with SendGrid is Fun");
//	    email.setHtml("and easy to do anywhere, even with Java");
//
//	    SendGrid.Response response = sendgrid.send(email);
//	  }
//}



//---------------------SendGrid test 5 ----------------

/*
 * 
//using SendGrid's Java Library
//https://github.com/sendgrid/sendgrid-java
import com.sendgrid.*;
import java.io.IOException;

import javax.servlet.http.HttpServlet;

//@SuppressWarnings("serial")
public class CronServlet{
public static void main(String[] args) throws IOException {
 Email from = new Email("tarang.khandpur@utexas.edu");
 String subject = "Sending with SendGrid is Fun";
 Email to = new Email("tknologic104@gmail.com");
 Content content = new Content("text/plain", "and easy to do anywhere, even with Java");
 Mail mail = new Mail(from, subject, to, content);

 SendGrid sg = new SendGrid(System.getenv("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"));
 Request request = new Request();
 
 try {
   request.method = Method.POST;
   request.endpoint = "mail/send";
   request.body = mail.build();
   Response response = sg.api(request);
   System.out.println(response.statusCode);
   System.out.println(response.body);
   System.out.println(response.headers);
 } catch (IOException ex) {
   throw ex;
 }
}
}

*/


//-------------------SendGrid 6 ---------------------Error: Misplaced tokens on sendgrid

/*
import com.github.sendgrid.SendGrid;

@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

SendGrid sendgrid = new SendGrid("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");

sendgrid.addTo("tknologic104@gmail.com");
sendgrid.addToName("Example Guy");
sendgrid.setFrom("other@example.com");
sendgrid.setSubject("Hello World");
sendgrid.setText("My first email through SendGrid");


sendgrid.send();

}
*/

//----------------SendGrid 7 -----------------------Error: not a javax.servlet


////import Sendgrid class in order to send emails 
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.http.*;
//import com.google.appengine.api.users.UserService;
//import com.google.appengine.api.users.UserServiceFactory;
//import com.google.appengine.labs.repackaged.org.json.JSONException;
//
//@SuppressWarnings("serial")
//public class CronServlet extends HttpServlet {
// private static final long serialVersionUID = 1L;
//
// //public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//   public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//		 
//	 resp.setContentType("text/html");
//
//     UserService userService = UserServiceFactory.getUserService();
//     // if the user is not logged in display login form
//     if (!userService.isUserLoggedIn()) {
//         // redirect to index after login 
//         resp.sendRedirect(userService.createLoginURL("/"));
//     } else {
//         try {
//             // initialize Sendgrid class
//             // please replace "<sendgrid_username>" and "<sendgrid_password>" with your SendGrid credentials
//             Sendgrid mail = new Sendgrid("TKnologic104","khandpur104");
//             // set to address, from address, subject, the html/text content and send the email 
//             mail.setTo(req.getParameter("tknologic104@gmail.com"))
//                 // update the <from_address> with your email address
//                 .setFrom("tarang.khandpur@utexas.edu")
//                 .setSubject(req.getParameter("subject"))
//                 .setText(req.getParameter("content"))
//                 .setHtml("")
//                 .send();
//
//             // check the response and display proper message
//             if (mail.getServerResponse() == "success") {
//                 req.setAttribute("message", "Your request was successfully processed.");
//                 req.setAttribute("myclass", "success");
//             } else {
//                 req.setAttribute("message", "Request failed  - " + mail.getServerResponse());
//                 req.setAttribute("myclass", "error");
//             }
////             req.getRequestDispatcher("success.jsp").forward(req, resp);
////         } catch (IOException e) {
////             e.printStackTrace();
//         } catch (JSONException e) {
//             e.printStackTrace();
//         }
//     }
// }
// 
// public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//     // redirect to index if the user is trying to access directly this page
//     resp.sendRedirect("/");
// }
//}





// ----------------SendGrid 8 ---------------------------




/*
 * 
 * 
 * 
 * 
////import Sendgrid class in order to send emails 
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.appengine.labs.repackaged.org.json.JSONException;

@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
	
	private static final Logger _logger = Logger.getLogger(CronServlet.class.getName());

	static {
		ObjectifyService.register(Subscriber.class);
		ObjectifyService.register(Greeting.class);
	}

	@SuppressWarnings("deprecation")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//		try {

			ObjectifyService.register(Subscriber.class);
			List<Subscriber> subscribers = ObjectifyService.ofy().load().type(Subscriber.class).list();
			Collections.sort(subscribers);

			ObjectifyService.register(Greeting.class);
			List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
			Collections.sort(greetings);

			_logger.info("Cron Job has been executed");
			Properties props = new Properties();
			Session session = Session.getDefaultInstance(props, null);

//			try {
				Sendgrid mail = new Sendgrid("TKnologic104","khandpur104");
				
				mail.setTo("karimesm94@gmail.com");
				mail.setFrom("tarang.khandpur@utexas.edu");
				mail.setSubject(req.getParameter("461L_HW1_Cron: Here's what has happened on the Blog Yesterday Since 5:00pm"));
				mail.setText(req.getParameter("hi"));
				mail.setHtml("<p>hi</p>");
				
				String str = new String();
				Date yesterday = new Date();
				yesterday.setHours(-24);

				for (Greeting a : greetings) {
					if (a.getDate().after(yesterday)) {
						str = str + a.getTitle() + "\n" + a.getDate().toString() + "\n" + a.getContent() + "\n" + "by: "
								+ a.getUser() + "\n"
								+ "______________________________________________________________________________________"
								+ "\n";
					}
				}

				
				//Change 378 to 380 if cron works
				//mail.setText(req.getParameter("str"));
				
//				for (Subscriber b : subscribers) {
//					mail.setTo(req.getParameter("b.getUser().getEmail()"));
//				}
//				
				 try {
						mail.send();
					} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		
	             // check the response and display proper message
	             if (mail.getServerResponse() == "success") {
	                 req.setAttribute("message", "Your request was successfully processed.");
	                 req.setAttribute("myclass", "success");
	             } else {
	                 req.setAttribute("message", "Request failed  - " + mail.getServerResponse());
	                 req.setAttribute("myclass", "error");
	             }
	           
			
//			} catch (IOException e) {
//				e.printStackTrace();
//			} catch (JSONException e) {
//				e.printStackTrace();
//			}
//			catch (AddressException e) {
//				// ...
//			} catch (MessagingException e) {
//				// ...
//			}

//		}
//			} catch (Exception ex) {
//			_logger.info("we have an error, its karime's fault");
//			// Log any exceptions in your Cron Job
//		}
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

*/


//---------------------------------------------------------------------------------


@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		Sendgrid mail = new Sendgrid("TKnologic104","khandpur104");
		// set credentials

		// set email data
		mail.setTo("karimesm94@gmail.com").setFrom("tarang.khandpur@gmail.com").setSubject("Subject goes here").setText("Hello World!").setHtml("<strong>Hello World!</strong>");

		// send your message
		try {
			mail.send();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}