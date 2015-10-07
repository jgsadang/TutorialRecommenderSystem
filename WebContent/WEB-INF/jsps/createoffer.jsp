<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 	
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring Training</title>
<style type="text/css">
	body {
		font-family: "sans-serif";
		font-size: 12pt;
	}
	label {
		float: left;
		width: 7em;
		font-weight: bold;
		color: yellow;
	}
	fieldset {
		background-color: olive;
		border-width: 2px;
		border-color: blue outset gray;
	}
	legend {
		background-color: white;
		border: 2px outset gray;
		padding: 0.2em;
	}
	.error {
		font-size: 10pt;
		color: orange;
		margin-left: 9em;		
	}
</style>
</head>
<body>
	<sf:form method="post" action="${pageContext.request.contextPath}/doCreate" commandName="offer">
		<fieldset>
			<legend>Create Offer</legend>
			<label>Name:</label><sf:input name="name" path="name" type="text" size="20" maxlength="20"/><br/><sf:errors path="name" cssClass="error"></sf:errors><br/>
			<label>E-mail:</label><sf:input name="email" path="email" type="text" size="20" maxlength="20"/><br/><sf:errors path="email" cssClass="error"></sf:errors><br/>
			<label>Your Offer:</label><sf:textarea name="text" path="text" rows="5" cols="20"></sf:textarea><br/><sf:errors path="text" cssClass="error"></sf:errors><br/><br/>
			<input value="Create advert" type="submit"/>
		</fieldset>
	</sf:form>
</body>
</html>