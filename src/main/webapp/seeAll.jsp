<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.DatastoreService"%>
<%@ page import="com.google.appengine.api.datastore.Query"%>
<%@ page import="com.google.appengine.api.datastore.Entity"%>
<%@ page import="com.google.appengine.api.datastore.FetchOptions"%>
<%@ page import="com.google.appengine.api.datastore.Key"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="com.googlecode.objectify.*"%>
<%@ page import="java.util.Collections"%>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="guestbook.Greeting"%>

<html>

	<head>
	
		<title>See All Page!</title>
	
		<!-- Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Raleway:500italic,600italic,600,700,700italic,300italic,300,400,400italic,800,900' rel='stylesheet' type='text/css'>
	
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="stylesheets/bootstrap.min.css">
		<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	
	</head>
	
	<header class="header" id="HOME">
	
	  	<div class="header-overlay">
			<div class="container header-containeru8">
				<div class="row">
					<div class="col-md-6">
						<div class="header-text">
							<h1><b> DANG! LOOK AT THESE POSTS! </b></h1>
							<h2> i got soo many posts, they call me the Postman... </h2>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</header>
	
	
	<body>
	
						   <%
							ObjectifyService.register(Greeting.class);
							List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
							//List<Greeting> welcomeGreetings = greetings.subList(greetings.size()-4, greetings.size()-1);
							Collections.sort(greetings);
							//Collections.sort(welcomeGreetings);

								for (Greeting greeting : greetings) {
										pageContext.setAttribute("greeting_content", greeting.getContent());
										if (greeting.getUser() == null) {
							%>
							<p>An anonymous person wrote:</p>
							<%
								} else {
											pageContext.setAttribute("greeting_user", greeting.getUser());
							%>
							<p>
								<b>${fn:escapeXml(greeting_user.nickname)}</b> wrote:
							</p>
							<%
								}
							%>
							<blockquote>${fn:escapeXml(greeting_content)}</blockquote>
							<%
								}
							//hi
							%>
	</body>
</html>