<%@ page
	import="java.util.List,com.auth10.federation.Claim,com.auth10.federation.FederatedPrincipal"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SEGES Java WSFed Web Application</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SEGES Java WSFed Web Application</h1>

			</div>
			<div class="col-md-4">
				<div>
					<h3>Status</h3>
					Logged on as
					<%=request.getRemoteUser()%>. <br /> 
					Page rendered at <%=new java.util.Date().toString()%>
				</div>
			</div>
			<div class="col-md-8">
				<h3>Claims</h3>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Claim type</th>
							<th>Claim value</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Claim> claims = ((FederatedPrincipal) request.getUserPrincipal()).getClaims();
							for (Claim c : claims) {
								out.println("<tr>");
								out.println("<td>" + c.getClaimType() + "</td>");
								out.println("<td>" + c.getClaimValue() + "</td>");
								out.println("</tr>");
							}
						%>


					</tbody>
				</table>

			</div>
			<div class="col-md-12">
				<div>
					<h3>Bootstrap token</h3>
					<%= org.apache.commons.lang.StringEscapeUtils.escapeHtml(((FederatedPrincipal) request.getUserPrincipal()).getBootstrapToken()) %>
				</div>
			</div>

		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>