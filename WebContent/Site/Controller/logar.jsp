<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
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
	</head>
	<body>
<%
	String usuario = request.getParameter("usuario");
	String senha = request.getParameter("senha");
	
	Logar login = new Logar();

	
	if(login.validaLogin(usuario, senha)){
		%>
		  <div class="alert">
			<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
			<strong>Login efetuado com sucesso!</strong>
		  </div>
		  <%		  
		  request.setAttribute("usuario", usuario);
		session.setAttribute("usuario", usuario);
		response.sendRedirect("../index.jsp");
	}else{
		session.setAttribute("usuario", "null");
		session.setAttribute("login", "false");
		response.sendRedirect("../Login.jsp");
	}
	%>
	</body>	
</html>