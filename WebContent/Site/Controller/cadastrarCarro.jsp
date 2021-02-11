<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<% 
	CadastroCarro cadastroCarro = new CadastroCarro();
	String CarroAno = request.getParameter("carroAno");
	String Descricao = request.getParameter("descricao");
	String linkImg = request.getParameter("linkImg");
	
	if(cadastroCarro.CadastrarCarro(CarroAno, Descricao, linkImg)){		  
		session.setAttribute("carroCadastrado", "true");
		response.sendRedirect("../adicionar.jsp");
	}else{
		session.setAttribute("carroCadastrado", "false");
		response.sendRedirect("../adicionar.jsp");
	}
	%>