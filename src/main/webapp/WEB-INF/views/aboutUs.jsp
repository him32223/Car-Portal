<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->



<!-- Access the Static Resources  using spring Url  -->
<!--
<spring:url value="/css/style.css" var="myCss" />
<spring:url value="/js/custom.js" var="myJS" />

<link href="${myCss}" rel="stylesheet" />
<script src="${myJS}"></script>
-->

<!--  Access the Static Resources without using spring URL -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />


</head>

<body>

	<!-- Test My JS -->
	<!-- <input type="button" class="button" onclick="sayHello();" value="Click me!">  -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
		  
		  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		  </button>
		  <div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav me-auto">
			  <li class="nav-item">
				<a class="nav-link active" href="login">login
				  <span class="visually-hidden">(current)</span>
				</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="new">Register</a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="contact">Contact </a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="about">About</a>
			  </li>
			  
			</ul>
			<form class="d-flex">
			  <input class="form-control me-sm-2" type="search" placeholder="Search">
			  <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
			</form>
		  </div>
		</div>
	  </nav>


	<!-- First Container -->
	<div class="container-fluid aboutus">
		<div class="jumbotron">
			<h3>WE HELP YOU GET A GREAT DEAL ON A CAR !</h3>



			<p class="lead">CarsDeals helps you get a great deal on a used
				car by giving you up-to-the-minute car pricing information so that
				you're fully armed with the knowledge you need as you shop for a
				car.</p>

			<hr class="my-4">
			<p>We also help buyers with less-than-perfect credit find special
				financing options through our network of trusted lending partners.</p>
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="new" role="button">Join Us Now!</a>
			</p>
		</div>
	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
