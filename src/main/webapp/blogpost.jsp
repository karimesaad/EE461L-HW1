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
<%@ page import="java.util.Calendar" %>
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<html>

	<head>
	
		<title>Blog Entry Page</title>
	
		<!-- Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Raleway:500italic,600italic,600,700,700italic,300italic,300,400,400italic,800,900' rel='stylesheet' type='text/css'>
	
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="stylesheets/bootstrap.min.css">
		<link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
	
	</head>
	
	<header class="header" >
	
	  	<div class="header-overlay">
			<div class="container header-containeru8">
				<div class="row">
					<div class="col-md-6 col-md-offset-2">
						<div class="header-text">
							<h1><strong> Create your Blog Entry! </strong></h1>
							<h2> Write something on here that nobody will ever see. </h2>
						</div>
					</div>	
				</div>
			</div>
		</div>
	</header>

<!--  <title>Insert title here</title>  -->

<body>
		<div class= submit-post>
			<div class=container>
				<div class=row>
					<div class="col-md-5 col-md-offset-3">
					
						<form action="/ofysign"  method="post">
							<div>
								<br><br>
								<p> Title:   <textarea name="title" rows="2" cols="60"></textarea> </p>
								<br>
								<p> Content: <textarea name="content" rows="3" cols="60"></textarea> </p>
								<br>
							</div>
							<div align="center">
								<input type="submit" class="btn btn-info" value="Post Greeting" />
							</div>
	
						</form>
						
						<div align="center">
						<a href="/welcome1.jsp" class="btn btn-info" role="button">Cancel</a>
						</div>
						<br><br><br>
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