<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
<%
	String usuario = request.getParameter("usuario");
	String nome = request.getParameter("nome");
	String email = request.getParameter("e-mail");
	String rg = request.getParameter("rg");
	String cpf = request.getParameter("cpf");
	String senha = request.getParameter("senha");
	
	Cadastro cadastro = new Cadastro();

	if(usuario != ""){
	if(cadastro.realizaCadastro(usuario, nome, email, cpf, rg, senha)){		  
		session.setAttribute("sucesso", "true");
		response.sendRedirect("../Cadastro.jsp");
	}else{
		session.setAttribute("sucesso", "false");
		response.sendRedirect("../Cadastro.jsp");
	}
	}else {
		session.setAttribute("sucesso", "false");
		response.sendRedirect("../Cadastro.jsp");
	}
	%>