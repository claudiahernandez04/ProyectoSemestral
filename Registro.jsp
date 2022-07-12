<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Registro</title>
	</head>
	<body>
		<%@ page import="java.sql.*"%>
			<h1>Usuarios Registrados Exitosamente</h1>
			<h3>Redirigiendo a la pagina de login</h3>
			<br><br>
			<%
			String Nombre = request.getParameter("nombre");
			String Apellido = request.getParameter("apellido");
			String Usuario = request.getParameter("usuario");
			String Edad = request.getParameter("edad");
			String Contraseña = request.getParameter("password");
			
		  	Class.forName("com.mysql.jdbc.Driver");
			Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/solociencia","root","");
		  	Statement dbstatement = dbconect.createStatement();

			
			  try
			  {
				  PreparedStatement consultaP = dbconect.prepareStatement("SELECT * FROM registro WHERE Usuario=?");
				  consultaP.setString(1, Usuario);
	  
				  ResultSet resultado = consultaP.executeQuery();
				  if(resultado.next()){
						String Redireccion = "Notificacion2.html";
						response.sendRedirect(Redireccion);
					  }
				  else{
						String InsertSQL = "Insert Into registro (Nombre,Apellido,Usuario,Edad,Contraseña) Values('"+Nombre+"','"+Apellido+"','"+Usuario+"','"+Edad+"','"+Contraseña+"')";
						dbstatement.executeUpdate(InsertSQL);
						
						String Redireccion = "Loggin.html";
						response.sendRedirect(Redireccion);
				  }
			  }
	            catch (Exception e)
	    		{
	            out.println( "ERROR--Ora_2313--<br>");
	            out.println("--Error-");
	    		}
			%>
			<!-- out.print("USUARIO CORRECTO"); -->
			
			<!-- String Redireccion = "Notificacion1.html"; -->
						<!-- String notificacion = "Redireccion" -->
						<!-- out.print("Error de login - USUARIO INCORRECTO"); -->
						<!-- response.sendRedirect(Redireccion); -->
			
			<!-- String InsertSQL = "Insert Into registro (Nombre,Apellido,Usuario,Edad,Contraseña) Values('"+Nombre+"','"+Apellido+"','"+Usuario+"','"+Edad+"','"+Contraseña+"')";
			dbstatement.executeUpdate(InsertSQL);
			
			String Redireccion = "Loggin.html";
	       	response.sendRedirect(Redireccion); -->
			
	</body>
</html>