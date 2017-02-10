package guestbook;

/*import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;*/
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory; 
import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;


 
public class SubscriberServlet extends HttpServlet {

	static {
        ObjectifyService.register(Subscriber.class);
    }
	
	
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
       // UserService userService = UserServiceFactory.getUserService();
        //User user = userService.getCurrentUser();
 
        // We have one entity group per Guestbook with all Greetings residing
        // in the same entity group as the Guestbook to which they belong.
        // This lets us run a transactional ancestor query to retrieve all
        // Greetings for a given Guestbook.  However, the write rate to each
        // Guestbook should be limited to ~1/second.
        //String guestbookName = req.getParameter("guestbookName");
        //Key guestbookKey = KeyFactory.createKey("Guestbook", guestbookName);
        //String content = req.getParameter("content");
        //Date date = new Date();
        //Entity greeting = new Entity("Greeting", guestbookKey);
        //greeting.setProperty("user", user);
        //greeting.setProperty("date", date);
        //greeting.setProperty("content", content);
 
        //DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        //datastore.put(greeting);
        //resp.sendRedirect("/guestbook.jsp?guestbookName=" + guestbookName);

    	UserService userService = UserServiceFactory.getUserService();
    	User user = userService.getCurrentUser(); //who is the user

    	Subscriber a = new Subscriber(user);
    	
    	ObjectifyService.register(Subscriber.class);
		List<Subscriber> subscribers = ObjectifyService.ofy().load().type(Subscriber.class).list();
		Collections.sort(subscribers);
    	
    	
		
    	String sub = req.getParameter("Sub");
    	if(sub.equals("Unsubscribe")){
    		
    		for (Subscriber b : subscribers){
    			if (b.getUser().getEmail().equals(user.getEmail()) ){
    				ObjectifyService.ofy().delete().entity(b).now();
    				break;
    			}
    		}
    	} 
    	
    	if(sub.equals("Subscribe")) {
      		ObjectifyService.ofy().save().entity(a).now();
    	}
    	
    	resp.sendRedirect("/welcome1.jsp");
    	
    	}
    	
    }
