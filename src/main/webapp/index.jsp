<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="controleur.*" %>
 <%@ page import="java.util.ArrayList"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Accueil WeMakeDonation</title>
</head>
<body>
<center>
	<h1> Gestion de WeMakeDonation </h1>
	<%
	if(session.getAttribute("email") == null){
	
	%> <%@ include file="vues/vue_form.jsp" %>  <%
	}
	
	String email, mdp_utilisateur ;
	if (request.getParameter("SeConnecter")!=null){
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
	String menu = "<a href ='index.jsp?page=1'><img src =\'images/donation.jpg' height='100' width='200'> </a>";
	menu +="<a href ='index.jsp?page=2'><img src ='images/projet.png' height='100'width='100'> </a>";
	menu +="<a href ='index.jsp?page=3'>DECONNEXION </a>";
	if (session.getAttribute("email") !=null){
		out.print(menu);
	
	%>	
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
			case 1 :
			%> <%@ include file="donation.jsp" %> <% break;
			case 2 : session.invalidate();
				response.sendRedirect("index.jsp");
			break;
			}
	
	} //fin du if session
	
	%>

</center>

</body>
</html>