<%@ page import="javax.servlet.http.HttpSession" %>

<h2>Gestion des Donations</h2>

<%
    String action = "";
    int id_donnation = 0;
    Donation leDonation = null;

    if (request.getParameter("action") != null && request.getParameter("id_donnation") != null) {
        action = request.getParameter("action");
        id_donnation = Integer.parseInt(request.getParameter("id_donnation"));

        switch (action) {
            case "sup":
                controleur.Controleur.deleteDonation(id_donnation);
                break;
            case "edit":
                leDonation = controleur.Controleur.selectWhereDonation(id_donnation);
                break;
        }
    }
%>

<%@ include file="vues/vue_insert_donation.jsp" %>

<%
    if (request.getParameter("Valider") != null) {
        int id_utilisateur = Integer.parseInt(session.getAttribute("id_utilisateur").toString());
        int id_projetcar = Integer.parseInt(request.getParameter("id_projetcar"));
        int id_catedon = Integer.parseInt(request.getParameter("id_catedon"));
        int id_imagep = Integer.parseInt(request.getParameter("id_imagep"));
        int id_assocarita = Integer.parseInt(request.getParameter("id_assocarita"));
        String montant_don = request.getParameter("montant_don");
        String date_don = request.getParameter("date_don");

        // instanciation de la classe Donation
        Donation unDonation = new Donation(id_utilisateur, id_projetcar, id_catedon, id_imagep, id_assocarita, montant_don, date_don);
        // insertion dans la base de données
        controleur.Controleur.insertDonation(unDonation, session);
        out.print("<br> Ajout réussi dans la base ");
    }

    if (request.getParameter("Modifier") != null) {
        int id_utilisateur = Integer.parseInt(session.getAttribute("id_utilisateur").toString());
        int id_projetcar = Integer.parseInt(request.getParameter("id_projetcar"));
        int id_catedon = Integer.parseInt(request.getParameter("id_catedon"));
        int id_imagep = Integer.parseInt(request.getParameter("id_imagep"));
        int id_assocarita = Integer.parseInt(request.getParameter("id_assocarita"));
        String montant_don = request.getParameter("montant_don");
        String date_don = request.getParameter("date_don");

        // instanciation de la classe Donation
        Donation unDonation = new Donation(id_utilisateur, id_projetcar, id_catedon, id_imagep, id_assocarita, montant_don, date_don);
        // mise à jour dans la base de données
        controleur.Controleur.updateDonation(unDonation);
        out.print("<br> Mise à jour réussie dans la base ");
    }

    ArrayList<VueDonnation> lesDonations = controleur.Controleur.selectAllVueDonations();
%>

<%@ include file="vues/vue_select_donation.jsp" %>
