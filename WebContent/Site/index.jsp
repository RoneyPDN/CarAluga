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
			<%@ page contentType="text/html; charset=UTF-8" %>
	</head>
	<body class="homepage">
		
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
						<li class="active"><a href="index.jsp">Homepage</a></li>
						<li><a id="minhaConta" href="MinhaConta.jsp">Minha Conta</a></li>
						<li><a id="meusCarros" href="CarrosAlugados.jsp">Meus Carros Alugados</a></li>
						<li><a id="cadastro" href="Cadastro.jsp">Cadastro</a></li>
						<li><a id="carros1" href="Carros.jsp">Carros</a></li>
						<li><a id="carros2" href="Carros2.jsp">Carros</a></li>
						<li><a href="Empresa.jsp">Empresa</a></li>
						<li><a id="login" href="Login.jsp">Login</a></li>
						<li><a id="sair" href="deslogar.jsp">Sair</a></li>
					</ul>
				</nav>
						  
						  <!-- Use any element to open the sidenav -->
				
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
		<!-- /Banner -->
		
		<!-- Main -->
		<div id="main">
			<div id="portfolio" class="container">
				<div class="row">
					<section class="3u">
						<header>
							<h2>Corsa 2020</h2>
						</header>
						<a href="#" class="image full"><img src="images/Corsa2020.jpg" alt=""></a>
						<p>A nova geração do Opel Corsa 2020 teve seu preço revelado na Europa. Custando 29.900 euros, cerca de R$ 130 mil, a nova geração do hatch compacto assusta pelo preço elevado.</p>
					</section>
					<section class="3u">
						<header>
							<h2>Vectra 2015</h2>
						</header>
						<a href="#" class="image full"><img src="images/vectra.jpg" alt=""></a>
						<p>O Chevrolet Vectra foi um dos sedâns de maior sucesso no Brasil. Entre as décadas de 1990 e 2000, ele se tornou um dos principais objetos de desejo no mundo automotivo.</p>
					</section>
					<section class="3u">
						<header>
							<h2>Astra 2020</h2>
						</header>
						<a href="#" class="image full"><img src="https://i.ibb.co/Yc0zzbw/Astra2020.jpg" alt=""></a>
						<p>O Astra agora é equipado com o moderno motor 1.2 PureTech três cilindros, o mesmo usado por Citroen C3 e Peugoet 208 no Brasil. O Astra 2020 é turbo!</p>
					</section>
					<section class="3u">
						<header>
							<h2>Uno 2020</h2>
						</header>
						<a href="#" class="image full"><img src="images/Uno2020.jpg" alt=""></a>
						<p>Quem quiser o Fiat Uno 2020 agora irá encontrá-lo no CarAluga, Preço acessível para alocação sendo com um valor de R$ 300 a menos sobre o valor cobrado anteriormente.</p>
					</section>
				</div>
			</div>
			
			<!-- Welcome -->		
			<div id="welcome" class="container">
				<div class="divider"></div>
				<div class="row">
					<section>
						<header>
							<h2>Sobre os Carros</h2>
						</header>
						<p>Todos os carros desta empresa para alocação são averiguados e fiscalizados antes da alocação e depois da alocação, além disto, são realizadas averiguações semanalmente</p>
						<p>Para que durante o período de alocação tudo ocorra conforme planejado. A empresa CarAluga utiliza-se de tecnologia de ponta para segurar a vida do cliente. O sistema implantado nos carros alerta se o cliente está dirigindo dentro do limite de velocidade, se estão usando cinto de segurança e seguindo de acordo com a leis da constituição Brasileira. De outra forma, a CarAluga também utiliza de disposivos com gps em seus carros. Sendo assim, o cliente não precisa se preocupar em caso de possível roubo de carro, acompanhar carros via gps isenta o cliente de assaltos e permite localizar o cliente em caso de possíveis sequestros. </p>
						<p>A Empresa CarAluga trabalha com carros em diferentes regiões do Brasil, não perca a oportunidade, alugue já o seu!</p>
					</section>
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