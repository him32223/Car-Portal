<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<div class="container-fluid bg-1">
	
		<div class="row">
		<h3 class="margin text-center">Detail Car Information !</h3>

			<div class="col-md-8">

				<form:form class="form-horizontal">

					<div class="form-group">
						<label for="id" class="control-label col-sm-4">ID: </label>
						<div class="col-sm-8">${car.id}</div>
					</div>


					<div class="form-group">
						<label for="make" class="control-label col-sm-4">Car Make:
						</label>
						<div class="col-sm-8">${car.make}</div>
					</div>

					<div class="form-group">
						<label for="model" class="control-label col-sm-4">Car
							Model: </label>
						<div class="col-sm-8">${car.model}</div>
					</div>

					<div class="form-group">
						<label for="reg" class="control-label col-sm-4">Reg No: </label>
						<div class="col-sm-8">${car.registeration}</div>
					</div>

					<div class="form-group">
						<label for="price" class="control-label col-sm-4">Price: </label>
						<div class="col-sm-8">${car.price}</div>
					</div>

					<hr />

					<div class="form-group">
						<label for="price" class="control-label col-sm-4"> <img
							src="/images/avator.png" width="60px" alt="..."></label>
						<div class="col-sm-8" style="padding: 20px;">

							<form action="car_detail?id=${car.id}" method="post">
								<input type="hidden" name="id" value="${car.id}" /> <input
									type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" /> <input type="number"
									placeholder="Enter Bid Price" name="bitprice" />

								<div class="form-group" style="padding: 20px;">
									<input type="submit" value="Bid Car" class="btn btn-success">
									<a href="cars" class="btn btn-danger">Go Back</a>
								</div>

							</form>
						</div>

					</div>

					<script>
						function goBack() {
							window.history.back();
						}
					</script>

				</form:form>


			</div>
			<label>Auction time created: ${item.endTime}</br>
		
			

			<div class="col-md-3 bg-3">
				<h4> Current Bidding Price!</h4><br/>
			<c:forEach var="car_bidding" items="${bidinfo}">
				
				<div class="card mb-3 card bg-info" style="padding:10px;">
				
					<div class="row" >
						<div class="col-md-6">
							<img class="card-img-top"
							src="/images/lol.png" width="30px" class="rounded-circle"
							class="mr-3" alt="...">
							<p>${car_bidding.bidderName}</p>
						</div>
						<div class="col-md-6">
							<div class="card-body">
								<p class="card-head"><small class="text-muted">${car_bidding.bid_date_time}</small></p>
								<p class="card-text">Bidded Price: ${car_bidding.bidderPrice}</p>
						
							</div>
						</div>
					</div>
				</div>
				
				<hr/>
			</c:forEach>

			</div>


		</div>




	</div>




	<%@ include file="footer.jsp"%>

</body>
</html>
