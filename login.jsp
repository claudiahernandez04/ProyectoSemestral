<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
		<link rel="stylesheet" href="StyleLoggin.css">
	</head>
	<body>
		<%@ page import="java.sql.*" %>
		<!-- <h1>Usuario logeado</h1> -->
		<script>
			function myFunction() {
			  alert("Usuario o contraseña incorrecto");
			}
			</script>
		<%
		String Usuario = request.getParameter("Usuario");
		String Password = request.getParameter("Password");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
	  	Statement dbstatement = dbconect.createStatement();
		
		try
	    {
	        PreparedStatement consultaP = dbconect.prepareStatement("SELECT * FROM registro WHERE Usuario=? AND Contraseña=?");
	        consultaP.setString(1, Usuario);
	        consultaP.setString(2, Password);

	        ResultSet resultado = consultaP.executeQuery();
	        if(resultado.next()){
				String Redireccion = "Home.html";
				response.sendRedirect(Redireccion);
	    		}
	        else{
				String Redireccion = "Notificacion1.html";
				response.sendRedirect(Redireccion);
			}
	    }
	            catch (Exception e)
	    {
	            out.println( "ERROR--Ora_2313--<br>");
	            out.println("--Usuario no registrado-");
	    }
		%>
		<!-- out.print("USUARIO CORRECTO"); -->
		<!-- String notificacion = "Redireccion" -->
		<!-- out.print("Error de login - USUARIO INCORRECTO"); -->
	</body>
</html>