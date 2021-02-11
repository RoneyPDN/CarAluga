<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="conexaoBd.*" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.*" %>
    
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
						<li class="active"><a id="minhaConta" href="MinhaConta.jsp">Minha Conta</a></li>
						<li><a id="meusCarros" href="CarrosAlugados.jsp">Meus Carros Alugados</a></li>
						<li><a id="cadastro" href="Cadastro.jsp">Cadastro</a></li>
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
		<!-- Banner -->
		<div id="banner">
			<div class="container">


			</div>
		</div>
		<%
		boolean status = false;
		ConexaoBD conecta = new ConexaoBD();
		try (
			Connection connection = conecta.getConexaoMySQL();
			PreparedStatement pst = connection.prepareStatement("select * from usuarios where usuario = ?")){
				pst.setString(1, usuario);
				System.out.println(pst);
				ResultSet rs = pst.executeQuery();
				while(rs.next()){%>

		<div id="main">
			<div id="welcome" class="container">
				<div class="row ">
					<form  method="post" action="DAO/cadastrar.jsp" name="form">
						<header>
							<h2>Meus Dados</h2>
						</header>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Usuário</span>
							</div>
							<input 
							type="text"
							class="form-control"
							name="usuario"
							aria-describedby="basic-addon1"
							value="<%=rs.getString(2)%>"
							disabled>
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Nome</span>
							</div>
							<input 
							type="text" 
							class="form-control"  
							name="nome" 
							aria-describedby="basic-addon1"
							value="<%=rs.getString(3)%>"
							disabled>
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">E-mail</span>
							</div>
							<input 
							type="text" 
							class="form-control" 
							name="e-mail" 
							aria-describedby="basic-addon1"
							value="<%=rs.getString(4)%>"
							disabled>
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">CPF</span>
							</div>
							<input 
							type="text" 
							class="form-control" 
							name="cpf" 
							aria-describedby="basic-addon1"
							value="<%=rs.getString(5)%>"
							disabled>
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">RG</span>
							</div>
							<input 
							type="text" 
							class="form-control" 
							name="rg" 
							aria-describedby="basic-addon1"
							value="<%=rs.getString(6)%>"
							disabled>
						  </div>
					</form>
				</div>
			</div>
			<!-- /Welcome -->
			<%	}
				rs.close();
				} catch (SQLException e) {
			System.out.println("Erro");
			e.printStackTrace();
		}		
		%>			
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