<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="controleur.*" %>
 <%@ page import="java.util.ArrayList"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
 <title>Accueil WeMakeDonation</title>
</head>
<body>
<center>
	
	<%
	if(session.getAttribute("email") == null){
	
	%> 
	 <h1> Gestion de WeMakeDonation </h1>
	 <img src='images/logo.png' height='150' width='300'>
	<%@ include file="vue/vue_form.jsp" %>  
	
	<%
			
			
	}
	
	String email, mdp_utilisateur ;
	if (request.getParameter("SeConnecter")!= null){
		
		email = request.getParameter("email");
		mdp_utilisateur = request.getParameter("mdp_utilisateur");
		Utilisateur unUtilisateur = Controleur.selectWhereUtilisateur(email, mdp_utilisateur);
		// demarrage de la session en cas de connexion.
		if (unUtilisateur != null){
			out.print("<br> Bienvenue" +unUtilisateur.getNom());
			//$_SESSION ['email'] = $email
			session.setAttribute("email", unUtilisateur.getEmail());
			session.setAttribute("nom", unUtilisateur.getNom());
			session.setAttribute("prenom", unUtilisateur.getPrenom());
			response.sendRedirect("index.jsp?page=1");
		}else {
			out.print("<br> Veuillez vérifier vos identifiants");
		}
	}
	
	 if (session.getAttribute("email") != null) { %>
     <div id='menu-container'>
         <a class='menu-link' href ='index.jsp?page=1'><img src ='images/donation.png' height='100' width='100'>Donnation </a>
         <a class='menu-link' href ='index.jsp?page=2'><img src ='images/projet.png' height='100' width='100'> Projet</a>
         <a class='menu-link' href ='index.jsp?page=3'><img src ='images/deconnexion.png' height='100' width='100'> Deconnexion </a>
     </div>	
     
	<%!
	int unePage ;
	%>
	<%
	if (request.getParameter("page")!=null){
		unePage = Integer.parseInt(request.getParameter("page"));
			}else{
		unePage = 1;
			}
			switch(unePage){
			case 1 : %> <%@ include file="donation.jsp" %> <% break;
			case 2 : %> <%@ include file="projet.jsp" %> <% break;
			case 3 : session.invalidate();
				response.sendRedirect("index.jsp");	
			}
	  } 
	//fin du if session
	
	%>

</center>

</body>
<footer>

</footer>
</html>