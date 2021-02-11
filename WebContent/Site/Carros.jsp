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
						<li><a id="minhaConta" href="MinhaConta.jsp">Minha Conta</a></li>
						<li><a id="meusCarros" href="CarrosAlugados.jsp">Meus Carros Alugados</a></li>
						<li><a id="cadastro" href="Cadastro.jsp">Cadastro</a></li>
						<li class="active"><a id="carros1" href="Carros.jsp">Carros</a></li>
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
						%>
					  <div class="alert">
						<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
						<strong>Faça o login para alugar</strong>
					  </div>
					  <%
			  }
			  %>
				  }
				  %>
				  				  			  				<%
		String alugado = (String) session.getAttribute("alugado");
		if(alugado == "true") {
			%>
		  <div class="alert success">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Carro alugado com sucesso!</strong>
		  </div>
		  <%
		  session.setAttribute("alugado", null);
		  } else if (alugado == "false"){
				%>
				  <div class="alert">
					<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
					<strong>Falha ao Alugar! Tente Novamente</strong>
				  </div>
				  <%
				  session.setAttribute("alugado", null);
		  }
		  %>
		<!-- Banner -->
		<div id="banner">
			<div class="container">


			</div>
		</div>
		<!-- /Banner -->
		<!-- Main -->
		<div id="main">
			<div id="portfolio" class="container">
				<div class="row">
								<%
		boolean status = false;
		ConexaoBD conecta = new ConexaoBD();
		int i = 0;
		try (
			Connection connection = conecta.getConexaoMySQL();
			PreparedStatement pst = connection.prepareStatement("select carroAno, idCar, linkImg, descricao from carros")){
				System.out.println(pst);
				ResultSet rs = pst.executeQuery();
				while(rs.next()){%>
									<%i++; 
					if(i == 5) {
						%><div class="row">
						<br>
						<br><% 
					}%>
					<section class="3u">
						<form name="carro1" action = 'Controller/alugar.jsp'>
						<header>
							<h2><%=rs.getString(1)%></h2>
						</header>
						<input type="text" class="hide" name="idCarro" value="<%=rs.getInt(2) %>">
						<input type="text" class="hide" name="carroAno" value="<%=rs.getString(1) %>">
						<input type="text" class="hide" name="linkImg" value="<%=rs.getString(3) %>">
						
						<a href="" class="image full"><img src="<%=rs.getString(3)%>" alt=""></a>
						<p><%=rs.getString(4)%></p>
						<input type="submit" class="hide2" value="Alugar" onclick="alugar()" >
						</form>
					</section>

									<%}
				} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}		
		%>			
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
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