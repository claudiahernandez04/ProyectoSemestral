<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matricula Programacion</title>
</head>
<body>
<%@ page import="java.sql.*"%>
			<h1>Curso matriculado exitosamente</h1>
			<br><br>
			<%
			String Nombre = request.getParameter("nombre");
			String Apellido = request.getParameter("apellido");
			String Fecha = request.getParameter("Fechas");
			String Curso = request.getParameter("curso");
			
		  	Class.forName("com.mysql.jdbc.Driver");
			Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
		  	Statement dbstatement = dbconect.createStatement();
		  	String InsertSQL = "Insert Into Cursos (Nombre,Apellido,Fecha,Curso) Values('"+Nombre+"','"+Apellido+"','"+Fecha+"','"+Curso+"')";
			dbstatement.executeUpdate(InsertSQL);
			
			%>
</body>
</html>