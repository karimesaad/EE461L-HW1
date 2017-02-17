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
<%@ page import="guestbook.Subscriber"%>
<%@ page import="java.util.ArrayList"%>

<html>

<head>

<title>Welcome Page!</title>

<!-- Fonts -->
<link
	href='https://fonts.googleapis.com/css?family=Raleway:500italic,600italic,600,700,700italic,300italic,300,400,400italic,800,900'
	rel='stylesheet' type='text/css'>

<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="stylesheets/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />

</head>

<header class="header" id="HOME">

	<div class="header-overlay">
		<div class="container header-containeru8">
			<div class="row">
				<div class="col-md-6 col-md-offset-2">
					<div class="header-text">
						<h1>
							<b> Welcome to Our Blog! </b>
						</h1>
						<h2>Feel free to write anything here!</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>


<body>

	<div class=usersignin>
		<div class=container>
			<div class=row>
				<div class="col-md-6 col-md-offset-3">

					<% 
							UserService userService = UserServiceFactory.getUserService();
							User user = userService.getCurrentUser();
							if (user != null) {
								pageContext.setAttribute("user", user);
						%>
					<h4><br><center>
						Hello,<b> ${fn:escapeXml(user.nickname)}!</b></h4></center><center><h2>(You can <a
							href="<%=userService.createLogoutURL(request.getRequestURI())%>">sign
							out</a>.) <br></center>
					</h2> 

					<div class="btn-group" role="group" aria-label="Basic example">
					<form action="/SubscriberServlet" method="post">
						<a href="/blogpost.jsp" class="btn btn-info" role="button">Add Post</a>
					
<%			
					ObjectifyService.register(Subscriber.class);
					List<Subscriber> subscribers = ObjectifyService.ofy().load().type(Subscriber.class).list();
					Collections.sort(subscribers);			
					
					List<String> emails = new ArrayList<String>();
					for (Subscriber a: subscribers){
						emails.add(a.getUser().getEmail());
					}
					
						if (emails.contains(user.getEmail())){
%>							
							<!--  This form creates the unSubscribe Button -->
			<!--  	<div class="col-md-4 col-md-offset-5"> -->
			<br>
						<form action="/SubscriberServlet" method="post">
						<!--  <div>-->
							<input class = "btn btn-info" name="Sub" type="submit" value="Unsubscribe" />
						<!--  </div>-->
					  	</form>
					<br><br>
			<!-- 	</div> -->

						
<%
						} else {
%>								

			<!--	<div class="col-md-4 col-md-offset-5">-->
			<br>
			  		<form action="/SubscriberServlet" method="post">
						<!--  <div>-->
								<input class = "btn btn-info" name="Sub" type="submit" value="Subscribe" />
						<!--  </div>-->
			 	</form> 
					<br>
					<br>
			<!--	</div> -->

						</form>

					<%
						}
						
							} else {
											
							%>

					<h4 class="hello">
						Hello! <a
							href="<%=userService.createLoginURL(request.getRequestURI())%>">Sign
							in</a> to include your name with greetings you post.
					</h4>
					<br>
					<br>
					<%
							}
						%>

					</div>
				</div>
			</div>
		</div>
	</div>

	<div class=blog-responses>
		<div class=container>
			<div class=row>
				<div class="col-md-6 col-md-offset-3">

<%
		ObjectifyService.register(Greeting.class);
		List<Greeting> greetings = ObjectifyService.ofy().load().type(Greeting.class).list();
		Collections.sort(greetings);
		List<Greeting> welcomeGreetings = greetings;//.subList(0, 4);
		//Collections.sort(greetings, new Greeting(user, "content"));
		Collections.sort(welcomeGreetings);

		for (int i = 0; i < 4 && i<welcomeGreetings.size(); i++) {
			pageContext.setAttribute("greeting_content", welcomeGreetings.get(i).getContent());
			pageContext.setAttribute("greeting_user", welcomeGreetings.get(i).getUser());
			pageContext.setAttribute("greeting_title", welcomeGreetings.get(i).getTitle());
			pageContext.setAttribute("greeting_date", welcomeGreetings.get(i).getDate());
								
%>
<!-- test 1-->
				<div class=llama >
					
					<p class= nickname>
						<b>${fn:escapeXml(greeting_user.nickname)}</b> wrote:				
					</p>
					
					<p class= date>
						<em>${fn:escapeXml(greeting_date)}</em>
					</p>
					
					<p class=title>
						<strong>${fn:escapeXml(greeting_title)}</strong>
					</p>
					
					<p class=content >
						<blockquote>${fn:escapeXml(greeting_content)}</blockquote>
					</p>
					<br><br>

					
				</div>
<%					
		}	
%>		
				</div>
				<% if (!greetings.isEmpty()) { 
				%>
				<div class="col-md-12">
					
					<!--This "form" creates the "See All Blogs Button" -->
					<form action="/seeAll" method="post">
						<div>
							<center><input class= "btn btn-info" type="submit" value="See All Blogs" /></center>
						</div>
					</form>

				</div>	
				<%} %>
				
			</div>
		</div>
	</div>
	
	
	
	    <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div id="authors">
                            <p><b>Authors:</b> Tarang Khandpur and Karime Saad</p>
                        </div>
                    </div>
                </div>       
            </div>
        </footer>
	
</body>
</html>