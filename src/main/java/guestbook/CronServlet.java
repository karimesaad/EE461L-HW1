package guestbook;
//
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
//
import com.googlecode.objectify.ObjectifyService;
import com.sendgrid.SendGrid;
//
@SuppressWarnings("serial")
public class CronServlet extends HttpServlet {
	private static final Logger _logger = Logger.getLogger(CronServlet.class.getName());

	static {
		ObjectifyService.register(Subscriber.class);
		ObjectifyService.register(Greeting.class);
	}

	@SuppressWarnings("deprecation")
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {

			ObjectifyService.register(Subscriber.class);
			List<Subscriber> subscribers = ObjectifyService.ofy().load().type(Subscriber.class).list();
			Collections.sort(subscribers);

			ObjectifyService.register(Greeting.class);
			List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
			Collections.sort(greetings);

			_logger.info("Cron Job has been executed");
			Properties props = new Properties();
			Session session = Session.getDefaultInstance(props, null);

			try {
				Message msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress("Tarang.Khandpur@ee461l-hw1-tk-karime.appspotmail.com"));
				msg.setSubject("461L_HW1_Cron: Here's what has happened on the Blog Yesterday Since 5:00pm");
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

				//msg.setText(str);
				msg.setText("hi");
				for (Subscriber b : subscribers) {

					msg.addRecipient(Message.RecipientType.TO,
							//new InternetAddress(b.getUser().getEmail(), b.getUser().getNickname()));
							new InternetAddress("karimesm94@gmail.com", "Karime"));
					Transport.send(msg);
				}
		

			} catch (AddressException e) {
				// ...
			} catch (MessagingException e) {
				// ...
			} catch (UnsupportedEncodingException e) {
				// ...
			}
//			// Put your logic here
//			// BEGIN
//			// END
		} catch (Exception ex) {
			_logger.info("we have an error, its karime's fault");
			// Log any exceptions in your Cron Job
		}
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}






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
