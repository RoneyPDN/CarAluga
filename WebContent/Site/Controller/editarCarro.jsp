<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<% 
	EditarCarro editarCarro = new EditarCarro();
	
	String CarroAno = request.getParameter("carroAno");
	String Descricao = request.getParameter("descricao");
	String linkImg = request.getParameter("linkImg");
	int id2 = Integer.parseInt(request.getParameter("idcar"));
	
	if(editarCarro.EditarCarro(id2, CarroAno, Descricao, linkImg)){		  
		session.setAttribute("editar", "true");
		response.sendRedirect("../Carros2.jsp");
	}else{
		session.setAttribute("editar", "false");
		response.sendRedirect("../Carros2.jsp");
	}
	%>