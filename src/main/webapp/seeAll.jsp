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
					<div class="col-md-6 col-md-offset-2">
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
	
	<div class=see-all-posts>
		<div class=container>
			<div class=row>
				<div class="col-md-6 col-md-offset-3">
	
	
	
	<br>
<%
							ObjectifyService.register(Greeting.class);
							List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
							//List<Greeting> welcomeGreetings = greetings.subList(greetings.size()-4, greetings.size()-1);
							Collections.sort(greetings);
							//Collections.sort(welcomeGreetings);

// 								for (Greeting greeting : greetings) {
// 										pageContext.setAttribute("greeting_content", greeting.getContent());
// 										if (greeting.getUser() == null) {
											
		for (Greeting greeting : greetings) {
			pageContext.setAttribute("greeting_content", greeting.getContent());
			pageContext.setAttribute("greeting_user", greeting.getUser());
			pageContext.setAttribute("greeting_title", greeting.getTitle());
			pageContext.setAttribute("greeting_date", greeting.getDate());
								
%>
					<br><br>
					<div class=llama>
					<p>
						${fn:escapeXml(greeting_user.nickname)} wrote:				
					</p>
					
					<p>
						<strong>${fn:escapeXml(greeting_title)}</strong>
					</p>

						<p>
							<blockquote>${fn:escapeXml(greeting_content)}</blockquote>
						</p>
						
					<p>
						<em>${fn:escapeXml(greeting_date)}</em>
					</p>
					
					</div>
<% 
		}
%>

				            <div class="buttons" align= "center" >
                                <a href="#HOME" id="scroll-to-top" class= "btn btn-info" id="button-scroll"> Scroll UP </a>
                     
                            	<a href="/welcome1.jsp" class="btn btn-info" id="button-homepage" role="button">Go to homepage</a>
							</div>
						<br><br>
					</div>
				</div>
			</div>
		</div>
	    <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div id="authors">
                            <p><b>Authors:</b> Tarang Khandpur and Karime Saad   |   EE 461L   |   February, 2017</p>
                        </div>
                    </div>
                </div>       
            </div>
        </footer>

	</body>
</html>