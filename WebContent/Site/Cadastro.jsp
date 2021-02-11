<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>CarAluga</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<script src="js/html5shiv.js"></script>

		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
			<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		</noscript>
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
		<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
		<div id="header">
			<div class="container">
				
				<!-- Logo -->
				<div id="logo">
					<h1><a href="#">CarAluga</a></h1>
				</div>
				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="index.jsp">Homepage</a></li>
						<li><a id="minhaConta" href="MinhaConta.jsp">Minha Conta</a></li>
						<li><a id="meusCarros" href="CarrosAlugados.jsp">Meus Carros Alugados</a></li>
						<li class="active"><a id="cadastro" href="Cadastro.jsp">Cadastro</a></li>
						<li><a id="carros1" href="Carros.jsp">Carros</a></li>
						<li><a id="carros2" href="Carros2.jsp">Carros</a></li>
						<li><a href="Empresa.jsp">Empresa</a></li>
						<li><a id="login" href="Login.jsp">Login</a></li>
						<li><a id="sair" href="deslogar.jsp">Sair</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- Header -->
<%
				String usuario = String.valueOf(session.getAttribute("usuario"));
				if(usuario != "null" && !usuario.equals("admin")) {
					out.println(usuario != "null" && usuario != "admin" );
					%>
				  	<script type="text/javascript">
				  	document.getElementById("cadastro").style.display = "none";
				  	document.getElementById("minhaConta").style.display = "block";
				  	document.getElementById("meusCarros").style.display = "block";
				  	document.getElementById("sair").style.display = "block";
				  	document.getElementById("login").style.display = "none";
				  	document.getElementById("carros2").style.display = "none";
					</script>
				  <%
				  }else if (usuario.equals("admin")) {
					  %>
					  <script>
					  	document.getElementById("sair").style.display = "block";
					  	document.getElementById("login").style.display = "none";
					  	document.getElementById("minhaConta").style.display = "none";
					  	document.getElementById("meusCarros").style.display = "none";
					  	document.getElementById("carros1").style.display = "none";
					  	
					  	</script>
					  <%
				  }else {
					  %>
					  <script>
					  	document.getElementById("minhaConta").style.display = "none";
					  	document.getElementById("meusCarros").style.display = "none";
					  	document.getElementById("sair").style.display = "none";
					  	document.getElementById("login").style.display = "block";
					  	document.getElementById("carros2").style.display = "none";

					  	
					  </script>
					  <%
				  }
				  %>
				<%
		String cadastro = (String) session.getAttribute("sucesso");
		if(cadastro == "true") {
			%>
		  <div class="alert success">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Cadastro efetuado com sucesso!</strong>
		  </div>
		  <%
		  session.setAttribute("sucesso", null);
		  } else if (cadastro == "false"){
				%>
				  <div class="alert">
					<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
					<strong>Falha ao Cadastrar! Tente novamente</strong>
				  </div>
				  <%
				  session.setAttribute("sucesso", null);
		  }
		  %>
		<!-- Banner -->
		<div id="banner">
			<div class="container">


			</div>
		</div>
		<div id="main">
			<div id="welcome" class="container">
				<div class="row ">
					<form class="3u" method="post" action="Controller/cadastrar.jsp" name="form">
						<header>
							<h2>Cadastro</h2>
						</header>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Usuário</span>
							</div>
							<input type="text" class="form-control" name="usuario" aria-describedby="basic-addon1">
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Nome</span>
							</div>
							<input type="text" class="form-control"  name="nome" aria-describedby="basic-addon1">
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">E-mail</span>
							</div>
							<input type="text" class="form-control" name="e-mail" aria-describedby="basic-addon1">
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">CPF</span>
							</div>
							<input type="text" class="form-control" name="cpf" aria-describedby="basic-addon1">
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">RG</span>
							</div>
							<input type="text" class="form-control" name="rg" aria-describedby="basic-addon1">
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Senha</span>
							</div>
							<input type="password" class="form-control" name="senha" aria-describedby="basic-addon1">
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Repita Senha</span>
							</div>
							<input type="password" class="form-control" name="senha2" aria-describedby="basic-addon1">
						  </div>
						  <input type="submit" class="button" value="Cadastrar"></input>
					</form>
				</div>
			</div>
			<!-- /Welcome -->
			
		</div>
		<!-- /Main -->		
		
		<!-- Footer -->
		<div id="footer">
			<div class="container">
				<section>
					<header>
						<h2>Procure Carros Na Sua Região</h2>
					</header>
					<div class="row">
						<section class="4u">
							<h1>Norte</h1>
							<a href="#" class="image full"><img src="images/Norte.jpg" alt=""></a>
						</section>
						<section class="4u">
							<h1>Sudeste</h1>
							<a href="#" class="image full"><img src="images/Suldeste.jpg" alt=""></a>
						</section>
						<section class="4u">
							<h1>Sul</h1>
							<a href="#" class="image full"><img src="images/Sul.jpg" alt=""></a>
						</section>
					</div>
					<a href="#" class="button">Início</a>
				</section>
			</div>
		</div>
	</body>
</html>