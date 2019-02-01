<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profilo</title>
<jsp:include page="frammenti/stili.frammento"></jsp:include>

<style type="text/css">
input[type=number] {
width: 150px;}
input[type=time] {
width: 150px;}
</style>


</head>
<body>
<jsp:include page="frammenti/navbar.html"></jsp:include>


<br>
<h1><span id="lblNome"></span> <span id="lblCognome"></span></h1>
	<br>
	la mia specialit� ${ chef.ricette[0].nome_ricetta }
	<br>
	<br>
	l'Area dove mi trovo � ${ chef.luogo_lavoro }
	<br>
 	<br>
 	<a href = "addRicetta.jsp">aggiungi ricetta</a>


 	
 		<script
	  src="https://code.jquery.com/jquery-3.3.1.min.js"
	  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	  crossorigin="anonymous"></script>
 	
	<jsp:include page="frammenti/scripts.jsp"></jsp:include>
	<script>
		sessionStorage.setItem('chef', '${ chef.email }');
	</script>
	<script src="js/profiloChef.js"></script>
	
			 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	
</body>
</html>