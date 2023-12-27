<%@ page import="javax.servlet.http.HttpSession" %>

<h2>Gestion des Donations</h2>

<%
    // Récupération des paramètres pour effectuer des actions
    String action = "";
    int id_donnation = 0;
    Donation leDonation = null;

    if (request.getParameter("action") != null && request.getParameter("id_donnation") != null) {
        action = request.getParameter("action");
        // Vérification avant la conversion
        id_donnation = (request.getParameter("id_donnation") != null) ? Integer.parseInt(request.getParameter("id_donnation")) : 0;

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
        int id_utilisateur = (session.getAttribute("id_utilisateur") != null) ? Integer.parseInt(session.getAttribute("id_utilisateur").toString()) : 0;
        int id_projetcar = (request.getParameter("id_projetcar") != null) ? Integer.parseInt(request.getParameter("id_projetcar")) : 0;
        int id_catedon = (request.getParameter("id_catedon") != null) ? Integer.parseInt(request.getParameter("id_catedon")) : 0;
        int id_imagep = (request.getParameter("id_imagep") != null) ? Integer.parseInt(request.getParameter("id_imagep")) : 0;
        int id_assocarita = (request.getParameter("id_assocarita") != null) ? Integer.parseInt(request.getParameter("id_assocarita")) : 0;
        String montant_don = request.getParameter("montant_don");
        String date_don = request.getParameter("date_don");

        // instanciation de la classe Donation
        Donation unDonation = new Donation(id_utilisateur, id_projetcar, id_catedon, id_imagep, id_assocarita, montant_don, date_don);
        // insertion dans la base de données
        controleur.Controleur.insertDonation(unDonation, session);
        out.print("<br> Ajout réussi dans la base ");
        response.sendRedirect("index.jsp");
    }

    if (request.getParameter("Modifier") != null) {
        int id_utilisateur = (session.getAttribute("id_utilisateur") != null) ? Integer.parseInt(session.getAttribute("id_utilisateur").toString()) : 0;
        int id_projetcar = (request.getParameter("id_projetcar") != null) ? Integer.parseInt(request.getParameter("id_projetcar")) : 0;
        int id_catedon = (request.getParameter("id_catedon") != null) ? Integer.parseInt(request.getParameter("id_catedon")) : 0;
        int id_imagep = (request.getParameter("id_imagep") != null) ? Integer.parseInt(request.getParameter("id_imagep")) : 0;
        int id_assocarita = (request.getParameter("id_assocarita") != null) ? Integer.parseInt(request.getParameter("id_assocarita")) : 0;
        id_donnation = (request.getParameter("id_donnation") != null) ? Integer.parseInt(request.getParameter("id_donnation")) : 0;
        String montant_don = request.getParameter("montant_don");
        String date_don = request.getParameter("date_don");

        // instanciation de la classe Donation
        Donation unDonation = new Donation(id_donnation, id_utilisateur, id_projetcar, id_catedon, id_imagep, id_assocarita, montant_don, date_don);
        // mise à jour dans la base de données
        controleur.Controleur.updateDonation(unDonation);
        out.print("<br> Mise à jour réussie dans la base ");
        response.sendRedirect("index.jsp");
    }

    ArrayList<VueDonnation> lesDonations = controleur.Controleur.selectAllVueDonations();
%>


<%@ include file="vues/vue_select_donation.jsp" %>