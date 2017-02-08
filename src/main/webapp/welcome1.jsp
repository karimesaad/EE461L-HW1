<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page
	import="com.google.appengine.api.datastore.DatastoreServiceFactory"%>
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
	
		<title>Welcome Page!</title>
	
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
							<h1><b> Welcome to Our Blog! </b></h1>
							<h2> Feel free to write anything here! </h2>
						</div>
					</div>	
				</div>
			</div>
		</div>
		
	</header>
	
	<body>
	
		<div class= usersignin >
			<div class= container>
				<div class= row>
					<div class="col-md-4 col-md-offset-3">
					
						<% 
							UserService userService = UserServiceFactory.getUserService();
							User user = userService.getCurrentUser();
							if (user != null) {
								pageContext.setAttribute("user", user);
						%>
							<h2>
							Hello, ${fn:escapeXml(user.nickname)}! (You can <a href="<%=userService.createLogoutURL(request.getRequestURI())%>">sign out</a>.)
							<br></h2>
							<h3>If you would like to add a post, click <a href="/blogpost.jsp">HERE!</a></h3>
							
						<%
								} else {
							%>
							<h2 class= "hello">
								Hello! <a href="<%=userService.createLoginURL(request.getRequestURI())%>">Sign in</a> to include your name with greetings you post.
							</h2>
							<br><br>
						<%
							}
						%>

					</div>
				</div>
			</div>
		</div>
	
		<div class=blog-responses>
			<div class=container>
				<div class=row>
					<div class=col-md-7 col-md-offset-1>
						
						<%

							ObjectifyService.register(Greeting.class);
							List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
							Collections.sort(greetings);

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
							
							%>
							
					</div>
				</div>
			</div>
		</div>
	
	</body>
</html>