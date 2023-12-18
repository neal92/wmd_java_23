<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="controleur.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Accueil WeMakeDonation</title>
    <link rel="stylesheet" type="text/css" href="public/css/style.css"> 
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 
</head>
<body>
    <center>
        <%
        if (session.getAttribute("email") == null) {
        %>
            <h1> Gestion de</h1>
            <img src='public/images/logo-black.png' height='150' width='300'>
            <%@ include file="vues/vue_form.jsp" %>
        <%
        }

        String email, mdp_utilisateur;
        if (request.getParameter("SeConnecter") != null) {
            email = request.getParameter("email");
            mdp_utilisateur = request.getParameter("mdp_utilisateur");
            Utilisateur unUtilisateur = Controleur.selectWhereUtilisateur(email, mdp_utilisateur);
            if (unUtilisateur != null) {
                out.print("<br> Bienvenue" + unUtilisateur.getNom());
                session.setAttribute("id_utilisateur", unUtilisateur.getIdutilisateur());
                session.setAttribute("email", unUtilisateur.getEmail());
                session.setAttribute("nom", unUtilisateur.getNom());
                session.setAttribute("prenom", unUtilisateur.getPrenom());
                response.sendRedirect("index.jsp?page=1");
            } else {
                out.print("<br> Veuillez vérifier vos identifiants");
            }
        }
        if (session.getAttribute("email") != null) {
            // Affiche la barre de navigation si l'utilisateur est connecté
        %>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	    <% 
	    
	        String menu = "<a class='navbar-brand' href ='index.jsp?page=1'>Donations</a>";
	        menu += "<a class='navbar-brand' href ='index.jsp?page=2'>Projets</a>";
	        menu += "<a class='navbar-brand' href ='index.jsp?page=3' style='color: red;'>DECONNEXION</a>";
	
	        // Récupérer l'e-mail de l'utilisateur depuis la session
	        String userEmail = (String) session.getAttribute("email");
	
	        // Afficher l'e-mail de l'utilisateur à droite
	        if (userEmail != null) {
	            menu += "<span class='navbar-text ml-auto'>" + userEmail + "</span>";
	        }
	
	        out.print(menu);
	    %>
	</nav>



            <%
            int unePage;
            if (request.getParameter("page") != null) {
                unePage = Integer.parseInt(request.getParameter("page"));
            } else {
                unePage = 1;
            }
            switch (unePage) {
                case 1:
      			  %>
                    <%@ include file="donation.jsp" %>
      			  <%
                    break;
                case 3:
                    session.invalidate();
                    response.sendRedirect("index.jsp");
                    break;
            }
        } // fin du if session
        %>
    </center>

    <!-- Pied de page -->
    <footer class="bg-light text-center text-lg-start fixed-bottom">
        <div class="text-center p-3" id="footer-background">
            <a class="text-dark text-center" href="https://wemakedonation.com/">wemakedonation.com</a>
        </div>
    </footer>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
