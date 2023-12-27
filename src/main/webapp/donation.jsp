 <%@ page import="controleur.*" %>
 <%@ page import="java.util.ArrayList"  %>
 <!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<h2>Gestion des Donations</h2>

<%
    String action = "";
    int id_donnation = 0;
    Donation unDonation = null;

    if (request.getParameter("action") != null && request.getParameter("id_donnation") != null) {
        action = request.getParameter("action");
        id_donnation = Integer.parseInt(request.getParameter("id_donnation"));

        switch (action) {
            case "sup": Controleur.deleteDonation(id_donnation); break;
            case "edit": unDonation = Controleur.selectWhereDonation(id_donnation); break;
        }
    }
%>

<%@ include file="vue/vue_insert_donation.jsp" %>

<%
    if (request.getParameter("Valider") != null) {
    	out.print("insertion");
        int id_utilisateur = Integer.parseInt(request.getParameter("id_utilisateur"));
        int id_projetcar = Integer.parseInt(request.getParameter("id_projetcar"));
        int id_catedon = Integer.parseInt(request.getParameter("id_catedon"));
        int id_imagep = Integer.parseInt(request.getParameter("id_imagep"));
        String montant_don = request.getParameter("montant_don");
        String date_don = request.getParameter("date_don");
        

        // instanciation de la classe Donation
         unDonation = new Donation(id_utilisateur, id_projetcar, id_catedon, id_imagep, montant_don, date_don);
        // insertion dans la base de données
        Controleur.insertDonation(unDonation);
        out.print("<br> Insertion réussie dans la base ");
    }

    if (request.getParameter("Modifier") != null) {
        int id_utilisateur = Integer.parseInt(request.getParameter("id_utilisateur"));
        int id_projetcar = Integer.parseInt(request.getParameter("id_projetcar"));
        int id_catedon = Integer.parseInt(request.getParameter("id_catedon"));
        int id_imagep = Integer.parseInt(request.getParameter("id_imagep"));
        id_donnation = Integer.parseInt(request.getParameter("id_donnation"));
        String montant_don = request.getParameter("montant_don");
        String date_don = request.getParameter("date_don");
  

        // instanciation de la classe Donation
        unDonation = new Donation(id_donnation, id_utilisateur, id_projetcar, id_catedon, id_imagep, montant_don, date_don);
        // mise à jour dans la base de données
        Controleur.updateDonation(unDonation);
        out.print("<br> Mise à jour réussie dans la base ");
        response.sendRedirect("index.jsp?page=1");	
    }

    ArrayList<Donation> lesDonations = Controleur.selectAllDonations();
%>

<%@ include file="vue/vue_select_donation.jsp" %>

