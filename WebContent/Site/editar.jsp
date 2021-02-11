<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<%@ page contentType="text/html; charset=UTF-8" %>
	

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
						<li><a href="Carros.jsp">Carros</a></li>
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
		String editar = (String) session.getAttribute("editar");
		if(editar == "true") {
			%>
		  <div class="alert success">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Carro atualizado com sucesso!</strong>
		  </div>
		  <%
		  session.setAttribute("editar", null);
		  } else if (editar == "false"){
				%>
				  <div class="alert">
					<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
					<strong>Falha ao Atualizar! Tente Novamente</strong>
				  </div>
				  <%
				  session.setAttribute("editar", null);
		  }
		  %>
		<!-- Banner -->
		<div id="banner">
			<div class="container">
		<%
		int id1;
		if(request.getParameter("idCarro") != null){
			id1 = Integer.parseInt(request.getParameter("idCarro"));
			String id2 = String.valueOf(request.getParameter("idCarro"));
				%><p><%= id2 %></p><%
			session.setAttribute("idCarro", id2);
		}
		else{
			String Sid = String.valueOf(session.getAttribute("idCarro"));
			%><p><%= Sid %></p><%
		    id1 = Integer.parseInt(Sid);
		}
		
		boolean status = false;
		ConexaoBD conecta = new ConexaoBD();
		try (
			Connection connection = conecta.getConexaoMySQL();
			PreparedStatement pst = connection.prepareStatement("select carroAno, idCar, linkImg, descricao from carros where idCar = ?")){
				pst.setInt(1, id1);
				System.out.println(pst);
				ResultSet rs = pst.executeQuery();
				while(rs.next()){%>

			</div>
		</div>
		<div id="main">
			<div id="welcome" class="container">
				<div class="row ">
					<form action="Controller/editarCarro.jsp"  >
						<header>
							<h2>Editar Carro</h2>
						</header>
						<div class="input-group mb-3">
							<input type="text" class="hide" name="idcar" value="<%=rs.getInt(2) %>">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Link da imagem</span>
							</div>
							<input class="form-control" name="linkImg" aria-describedby="basic-addon1" value="<%=rs.getString(3)%>">
						  </div>
						  <div class="input-group mb-3">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Nome do Carro e Ano</span>
							</div>
							<input type="text" class="form-control" name="carroAno" aria-describedby="basic-addon1" value="<%=rs.getString(1)%>">
						  </div>
						  <div class="input-group">
							<div class="input-group-prepend">
							  <span class="input-group-text" id="basic-addon1">Descrição</span>
							</div>
							<textarea 
								type="text" 
								class="form-control"  
								name="descricao" 
								aria-describedby="basic-addon1" 
								style="width:200px; height:100px;" 
								maxlength="180"
								><%=rs.getString(4)%></textarea>
						  </div>
						  <input type="submit" class="button" value="Atualizar">
					</form>
														<%}
				rs.close();
				} catch (SQLException e) {
			System.out.println("Erro");
			e.printStackTrace();
		}		
		%>			
				</div>
			</div>
			<!-- /Welcome -->
			
		</div>
		<!-- /Main -->		
		
		<!-- Footer -->
		<div id="footer">
			<div class="container">
			</div>
		</div>
	</body>
</html>