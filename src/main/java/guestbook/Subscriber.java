package guestbook;

import java.util.Date;

import com.google.appengine.api.users.User;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

@Entity
public class Subscriber implements Comparable<Subscriber> {
	@Id
	Long id;
	User user;
	// String title;
	// String content;
	Date date;

	private Subscriber() {
	}

	public Subscriber(User user) {
		this.user = user;
		this.date = new Date();
	}

	public User getUser() {
		return user;
	}

	public Date getDate() {
		return date;
	}

	@Override
	public int compareTo(Subscriber other) {
		if (date.after(other.date)) {
			return -1;
		} else if (date.before(other.date)) {
			return 1;
		}
		return 0;
	}

}
