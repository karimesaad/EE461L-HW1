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
<%@ page import="java.util.Calendar" %>

<html>

<head>

<title>Funny Jokes</title>

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
							<b> Funny Jokes </b>
						</h1>
						<h2> If you don't think these are funny. THEN LEAVE! IM LOOKING AT YOU Farhan Ali</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>


<body>

	<div class=about-us id="HOME">
		<div class=container>
			<div class=row>
				<div class="col-md-6 col-md-offset-3">
				
				<br>
				
				<h3>
					
					<br>
					Why  	was the stadium so cold?
					<br>
					Because there were a lot of fans.

					<br>
					<br>				
					What do you call a sad cup of coffee?<br>
					Depresso.
<br>
<br>
					Where do animals go when their tails fall off?
<br>					The retail store.
<br>
<br>
					What do you call a fake noodle?
<br>					An impasta!
<br>
<br>
					What did Barack Obama say to Michelle when he proposed?
<br>					I don't wanna be Obama self.
<br><br>
					Why can't a bike stand up on it's own?
<br>					Because it's two tired.
<br>
<br>
					Why did the scientist install a knocker on his door?
<br>					He wanted to win the No-bell Prize!
<br><br>				
					What did the vegetables say at the party?
<br>					Lettuce turnip the beet!
<br>
<br>			
					Why can't you trust atoms?
<br>					Because they make up everything!
<br>
<br>		
					Why can't pirates finish the alphabet?
<br>					because they got lost at C!
<br>
<br>	
					Why doesn't Pac-Man use Twitter?
<br>					He doesn't like being followed.
<br>
<br>
					What's the best thing about living in Switzerland?
<br>					I don't know, but the flag is a big plus!
<br>
<br>				
					Why did the hipster fall in the lake?
<br>					He went ice skating before it was cool.
<br>
<br>			
					Why do shoemakers go to heaven?
<br>				Because they have good soles.
<br>
<br>		
					Why do people carry umbrellas?
<br>				Because umbrellas can't walk.
<br>
<br>	
					What did one plate say to the other?
<br>				Lunch is on me.
<br>
<br>
					Why do seagulls live by the sea?
<br>				Because if they lived by the bay they'd be bagels!
<br>
<br>
					Did you hear about the two guys that tried to steal a calendar?
<br>				They each got six months.
<br>
<br>
					What do you call an alligator that reads maps?
<br>				A navigator.
<br>
<br>
					What did the buffalo say to his son when he left for college?
<br>				Bison.
<br>
<br>
					What did the hat say to the tie?
<br>				You hang here, I'll go on a head!
<br>
<br>
					I used to be addicted to the Hokey Pokey, but I turned myself around.
<br><br>
					Did you hear about the kidnapping at school!?
<br>				It's okay. He woke up.
<br><br>
					Why did the baker stop making doughnuts?
<br>				He got tired of the hole thing!
<br>
<br>
					What do you call birds that stick together?
<br>				Velcrows!
<br>
<br>
					What do you call a lost wolf?
<br>				A where-wolf!
<br>
<br>
					I tried to catch some Fog. I mist.
<br>
<br>
					Donald Trump
<br>
<br>
					What do you call it when a banana eats another banana?
<br>				Canabananalism
<br>
<br>
					Need an ark? I Noah guy.
<br><br>
					What happens if you eat yeast and shoe polish?
<br>				Every morning you rise and shine.
<br>
<br>
					I had a fear of speed bumps, but I'm slowly getting over it.
<br>
<br>
					What do a base ball team and a pancake have in common?
<br>				They both need a good batter.
<br>
<br>
					My physics teacher told me that I have potential.
<br>				Then he threw me off the roof.
<br>
<br>
					Did you hear about the guy whose whole left side was cut off? He's all right now.
<br>
<br>
					What do you call a car that everyone can buy?
<br>				Afford
<br>
<br>
					Why didn't the skeleton cross the road?
<br>				He didn't have the guts.
<br>				<br>
					My boss told me to have a good day.
<br>					So I went home.
<br>					<br>
					Which country does bacteria like the most?
<br>					Germany.
<br>					<br>
					What do you call a dinosaur with an extensive vocabulary?
<br>					A thesaurus.
<br>					<br>
					I wasn't originally going to get a brain transplant, but then I changed my mind!
<br>					<br>
					What path do crazy people take in the forest?
<br>					The psychopath.
<br>					<br>
					Why was Cinderella kicked off the softball team
	<br>				Because she kept running from the ball.
		<br>
		<br>
					What is the slipperiest country in the world?
<br>					Greece!
					<br><br>
					What time was it when the elephant sat on the fence?
<br>					Time to get a new fence.
<br>					<br>
					Why was the ant so confused?
<br>					Because all of his uncles were ants.
<br>					<br>
					What does a clock do when it's hungry?
<br>					It goes back four seconds.
<br>					<br>
					What do you call a bear with no teeth?
	<br>				A gummy bear.
		<br>			<br>
					Why does a chicken coop have 2 doors?
			<br>		Because if it had 4 doors it would be a chicken sedan.
				</h3>
		</div>
	
	</div>
	
					<br>
					<br>
					<center>
						<div class="buttons">
							<a href="#HOME" id="scroll-to-top" class="btn btn-info"
								id="button-scroll"> Scroll UP </a> <a href="/welcome1.jsp"
								class="btn btn-info" id="button-homepage" role="button">Go
								to homepage</a>
						</div>
					</center>
					<br>
					<br>
	
	
	
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div id="authors">
						<p>
							<b>Authors:</b> Tarang Khandpur and Karime Saad | EE 461L |
							February, 2017
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>