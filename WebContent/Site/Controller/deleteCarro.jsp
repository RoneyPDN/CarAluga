<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dao.*" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="javax.servlet.annotation.MultipartConfig"%>
<% 
	DeleteCar carDelete = new DeleteCar();
	
	int id2 = Integer.parseInt(request.getParameter("idCarro"));
	
	if(carDelete.DeletarCarro(id2)){		  
		session.setAttribute("remover", "true");
		response.sendRedirect("../Carros2.jsp");
	}else{
		session.setAttribute("remover", "false");
		response.sendRedirect("../Carros2.jsp");
	}
	%>