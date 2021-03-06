<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html style="height:100%;">
<head>
<link rel="shortcut icon" type="image/png" href="immagini/M.png"/>
<meta charset="ISO-8859-1">
<jsp:include page="frammenti/stili.frammento"></jsp:include>

<title>Signup MyChef</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
	
<style type="text/css">
.navbar {
	min-height: 100px
}

.nav_img:hover {
  opacity: 0.5;
  filter: alpha(opacity=50);
}



#submit {
  background-color: #FF6A00; /* colore di sfondo    */
  border: 2px solid #FF6A00; /* bordo dell'elemento */
  color: white;               /* colore del testo    */
  font-weight: bold;         /* testo in grassetto  */
  -moz-border-radius: 20px;
 -webkit-border-radius:20px;
 border-radius:20px;
 
}
#submit:active {
  position: relative;
  top: 1px;
}

body::after{ content:''; display:block; height:100px; }

</style>
<link rel="stylesheet" href="css/stile.css">

	

</head>
<body class="sfondo" style="min-height:100%; padding:0; margin:0; position:relative;">
<jsp:include page="frammenti/navbar.html"></jsp:include>
	<br>
	
		<p style="
    text-align: center;
    font-size: xx-large;
    font-weight: bold;
    color: #ff6a00;">SIGNUP
    </p>
	
	<div class="w-50 p-3 card " style="background-color: #eee; text-align:center; position: relative; left: 25%;min-width:250px;">
		<form id="f" name="signup" method="post"
		action="SignUpChefController">
		<div style="color: #FF0000;">${errorMessage}</div>
		<input class="form-control form-control-lg" type="text" placeholder="Nome" padding="orange" name="nome" autocomplete="on" required/>
		<input class="form-control form-control-lg" type="text" placeholder="Cognome" name="cognome" autocomplete="on" required/>
		<input class="form-control form-control-lg" type="text" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Inserire un indirizzo email valido!' : '');"  placeholder="Email"name="email" autocomplete="on" required/>
		<input class="form-control form-control-lg" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'La password deve essere di almeno 6 caratteri!' : ''); if(this.checkValidity()) form.confpassword.pattern = this.value;"  placeholder="Password" name="password" required/>
		<input class="form-control form-control-lg" type="password" pattern="^\S{6,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Le password non coincidono!' : '');"placeholder="Conferma Password" name="confpassword" required/>
	
	<div style="padding-top:16px;">
	<nav class="nav justify-content-center">
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" onclick="asChef()" id="nav-home-tab" data-toggle="tab" href="#nav-chef" role="tab" aria-controls="nav-chef" aria-selected="true">Chef</a>
    <a class="nav-item nav-link" onclick="asCliente()" id="nav-profile-tab" data-toggle="tab" href="#nav-cliente" role="tab" aria-controls="nav-cliente" aria-selected="false">Cliente</a>
  </div>
</nav>
</div>
<div class="tab-content" id="nav-tabContent" align="center">
  <div class="tab-pane fade show active" id="nav-chef" role="tabpanel" aria-labelledby="nav-chef-tab">
  	  <input class="form-control form-control-lg" id="luogo_lavoro" type="text"  placeholder="Luogo di lavoro" name="luogo_lavoro" autocomplete="on" required/>
  </div>
  <div class="tab-pane fade" id="nav-cliente" role="tabpanel" aria-labelledby="nav-cliente-tab">
  <input class="form-control form-control-lg" id="ind" type="text" placeholder="Indirizzo" name="indirizzo" autocomplete="on"/>
  <input class="form-control form-control-lg" id="prov" type="text"  placeholder="Provincia" name="provincia" autocomplete="on"/>
	<input class="form-control form-control-lg" id="cit" type="text" placeholder="Comune" name="comune" autocomplete="on"/>
	
  </div>
  
</div>	
		<div style="padding-top:16px;">
		<input id ="submit" type="submit" class="btn btn btn-outline-success" value="Clicca per Registrarti">
		</div>
		</form>
	
	<br>
	
<p style="text-align: center; margin-bottom: 0px"><b>Hai gi� un account?<a href="login.jsp" style="color: #FF6A00">&nbspAccedi</a></b></p>
	</div>
	
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<script>
	function asChef() {
		document.getElementById("f").setAttribute("action", "SignUpChefController");
		document.getElementById("ind").removeAttribute("required");
		document.getElementById("prov").removeAttribute("required");
		document.getElementById("cit").removeAttribute("required");
		document.getElementById("luogo_lavoro").setAttribute("required","");
	}
	function asCliente() {
		document.getElementById("f").setAttribute("action", "SignUpClienteController");
		document.getElementById("luogo_lavoro").removeAttribute("required");
		document.getElementById("ind").setAttribute("required","");
		document.getElementById("prov").setAttribute("required","");
		document.getElementById("cit").setAttribute("required","");
	}
</script>

	<script src="js/global_scripts.js"></script>


</body>

		<jsp:include page="frammenti/footer.html"></jsp:include>
</html>
