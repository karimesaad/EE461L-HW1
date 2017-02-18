package guestbook;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.google.appengine.api.users.User;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Greeting implements Comparable<Greeting> {
	@Id
	Long id;
	User user;
	String title;
	String content;
	//Calendar cal;
	Date date;
	
/*
	public static Calendar toCalendar(Date date){ 
		  Calendar cal = Calendar.getInstance();
		  cal.setTime(date);
		  return cal;
		}
*/
	
	
	private Greeting() {
	}

	public Greeting(User user, String content) {
		this.user = user;
		this.content = content;
		date = new Date();
	//	toCalendar(date = new Date());
	//	cal = Calendar.getInstance();
		
	}

	public Greeting(User user, String title, String content) {
		this.user = user;
		this.title = title;
		this.content = content;
		date = new Date();
		//toCalendar(date = new Date());
		//cal = Calendar.getInstance();
	}

	public User getUser() {
		return user;
	}

	public String getContent() {
		return content;
	}

	public String getTitle() {
		return title;
	}

	public Date getDate() {
		return date;
		//toCalendar(date = new Date());
		//cal = Calendar.getInstance();
		//return cal;
	}

	@Override
	public int compareTo(Greeting other) {
		if (date.after(other.date)) {
			return -1;
		} else if (date.before(other.date)) {
			return 1;
		}
		return 0;
	}
}
