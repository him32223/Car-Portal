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
	<div class="container-fluid bg-1 text-center">
		<h3 class="margin">Sell your car in a Fleet!</h3>

		<div class="row">

			<div class="col-md-4"></div>

			<div class="col-md-4">


				<c:if test="${error_string != null}">

					<div class="alert alert-danger">
						${error_string}
					</div>

				</c:if>

				<c:url var="post_url" value="/login" />
				<form action="${post_url}" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<div class="form-group">

						<label for="username">User Name:</label> <input type="text"
							name="username" id="username" value="" class="form-control"></input>
					</div>

					<div class="form-group">
						<label for="password">Password:</label> <input type="password"
							name="password" id="password" value="" class="form-control"></input>
					</div>
					<br>
					<br>
					<input type="submit" name="Login" value="Sign In"
						class="btn btn-primary"></input>
				</form>
			</div>


			<div class="col-md-4"></div>

		</div>

	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
