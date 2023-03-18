<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->



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
			<sec:authorize access="!isAuthenticated()">
			  <li class="nav-item">
				<a class="nav-link" href="login">Login</a>

			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="about">About Us</a></li>
			  </li>
			  
			</sec:authorize>
			<sec:authorize access="hasRole('Administrator')">
			  <li class="nav-item">
				<a class="nav-link" href="cars">Car Management </a>
			  </li>
			  <li class="nav-item">
				<a class="nav-link" href="users">User Management</a>
			  </li>
			 
			</sec:authorize>

			<sec:authorize access="hasRole('Users')">
					 <li class="nav-item" >
						<a class="nav-link" href="cars">Used Cars</a></li>
					 <li class="nav-item">
						<a class="nav-link" href="new_car">Sell Your Car</a></li>
				</sec:authorize>
			  
				<li class="nav-item">
					<form action="logout" method="post" style="padding:7px;">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
							<input class="nav-link"	 type="submit"
							name="Logout" value="Logout" class="btn btn-primary"></input>
					</form>
					</li>
			</ul>
		  </div>
		</div>
	  </nav>




	<!-- First Container -->
	<div class="container-fluid bg-1 text-center">
		<h3 class="margin">Post A Car For Sale !</h3>

		<div class="row">

			<div class="col-md-4"></div>

			<div class="col-md-4">


				<!--
            It is standard practice to have all action & href urls wrapped with c:url tag.
            This tag adds jsessionid to the action/href url, in case cookies are disabled by the user.
       			 -->

				
				<form:form method="POST" action="/cars" modelAttribute="car">

					<input type="hidden" value="${_csrf.token}"/>
						
					<form:hidden path="id" />
					
					<div class="form-group">
					<form:label path="make">Car Make:</form:label>
					<form:input path="make" />
					</div>


					<div class="form-group">
						<label for="model">Car Model:</label> 
						<form:input path="model"/>
					</div>

					<div class="form-group">
						<label for="registeration"> registeration:</label>
						<form:input path="registeration"/>
						 
					</div>

					<div class="form-group">
						<label for="price">Car Price:</label> 
						<form:input path="price"/>
					</div>

					<input type="submit" name="Add" value="Save" /> <input
						type="button" value="Cancel" onclick="cancel()" />

					<script>
						function cancel() {
							window.location.href = "cars"
						}
					</script>
				</form:form>

			</div>


			<div class="col-md-4"></div>

		</div>

	</div>


	<%@ include file="footer.jsp"%>

</body>
</html>
