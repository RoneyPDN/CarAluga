<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<% 
	AlugaCarro alugaCarro = new AlugaCarro();
	
	String CarroAno = request.getParameter("carroAno");
	String usuario = String.valueOf(session.getAttribute("usuario"));
	String linkImg = request.getParameter("linkImg");
	if(usuario != "null"){
		if(alugaCarro.AlugarCarro(usuario, CarroAno, linkImg)){		  
			session.setAttribute("alugado", "true");
			response.sendRedirect("../Carros.jsp");
		}else{
			session.setAttribute("alugado", "false");
			response.sendRedirect("../Carros.jsp");
		}		
	}else{
		session.setAttribute("alugado", "false");
		response.sendRedirect("../Carros.jsp");
	}

	%>