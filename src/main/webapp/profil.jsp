<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profil Utilisateur</title>
</head>
<body>
<h1> Votre Profil</h1>

		<% 
		    String userEmail = (String) session.getAttribute("email");
		    String userNom = (String) session.getAttribute("nom");
		    String userPrenom = (String) session.getAttribute("prenom");
		
		    // Ajoutez d'autres attributs d'utilisateur au besoin
		
		    // Affichez les informations de l'utilisateur
		%>
<h1>Profil de <%= userPrenom %> <%= userNom %></h1>
<p>Email : <%= userEmail %></p>
<!-- Ajoutez d'autres champs d'information de l'utilisateur au besoin -->


</body>
</html>