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
			<h2 class="text-center">User List</h2>

			<div class="row">

				<div class="col-md-12">
				
					<c:if test="${not empty userlists}">
					
					<table class="table table-striped table-bordered">

						<thead>
							<tr>
								<th>No.</th>
								<th>User ID </th>
								<th>Full Name</th>
								<th>User Name </th>
								<th>Password</th>
								<th>Actions</th>
							</tr>
						</thead>
						
						<tbody>
						
						<% int i=1; %>
						<c:forEach var="user" items="${userlists}">
						
							<tr>
								<td><%=i %></td>
								<td>${user.id}</td>
								<td>${user.name}</td>
								<td>${user.userName}</td>
								<td>${user.password}</td>

								<td>
									<sec:authorize access="hasRole('Administrator')">
									<button class="btn btn-info">View </button>
									<a href="delete?name=${car_user.name}">
										<button class="btn btn-danger">Delete</button>
									</a>
								</sec:authorize>
								</td>
							</tr>
							<% i++; %>
						</c:forEach>

						</tbody>
					</table>
					
					</c:if>
					
				</div>
			</div>
			
			<!--  End User Lists  -->

		</div>
	</div>


	<%@ include file="footer.jsp"%>
	</body>
	</html>