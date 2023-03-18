<%@ page contentType="text/html; charset=US-ASCII"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<!--  Enable Bootstrap -->



<!--  Access the Static Resources without using spring URL -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />


</head>

<body>

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
		<div>
			<h2 class="text-center">Search Car Results</h2>

			<!--  Search Car Lists  -->
			
			<div class="row">
				<div class="col-md-12">
				<c:url var="get_search_url" value="search"/>
				<form action="${get_search_url}" id="myform" method="get" class="form-inline text-right" style="padding:20px;">
					<input class="form-control mr-sm-2" type="search" placeholder="Search" value="${keyword}" name="keyword" />
						<input type="submit" value="Search" class="btn btn-info"/>

				</form>

				</div>
			</div>

			<div class="row">

				<div class="col-md-12">
				
					<c:if test="${empty search_cars}">
						<div>
							<h4 class="text-danger text-center"> No Matching Item Found. </h4>	
							<h5 class="text-danger text-center"> Please try with another keyword.</h5>	
						</div>	
					</c:if>
					
					<c:if test="${not empty search_cars}">
					
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								<th>Car ID</th>
								<th>Car Make</th>
								<th>Model</th>
								<th>Reg No.</th>
								<th>Price</th>
								<th>Actions</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="car" items="${search_cars}">
						
							<tr>
								<td><%=i %></td>
								<td>${car.id}</td>
								<td>${car.make}</td>
								<td>${car.model}</td>
								<td>${car.registeration}</td>
								<td>${car.price} </td>

								<td>
									<a href="car_detail?id=${car.id}">
									<button class="btn btn-info">View </button>
									</a>
								</td>
							</tr>
							<% i++; %>
						</c:forEach>

						</tbody>
					</table>
					
					</c:if>
					
				</div>
			</div>
			
			<!--  End Car Lists  -->

		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>