<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.Donation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Liste des Donations</title>
</head>
<body>
    <h3>Liste des Donations</h3>
    <table border="1">
        <tr>
            <td>Id Donation</td>
            <td>ID Utilisateur</td>
            <td>ID Projet Car</td>
            <td>ID Catedon</td>
            <td>ID Imagep</td>
            <td>Montant Don</td>
            <td>Date Don</td>
            <td>Opérations</td>
        </tr>
        <%
            String chaineDonations = "";
            for (Donation uneDonation : lesDonations) {
                chaineDonations += "<tr>";
                chaineDonations += "<td>" + uneDonation.getId_donnation() + "</td>";
                chaineDonations += "<td>" + uneDonation.getId_utilisateur() + "</td>";
                chaineDonations += "<td>" + uneDonation.getId_projetcar() + "</td>";
                chaineDonations += "<td>" + uneDonation.getId_catedon() + "</td>";
                chaineDonations += "<td>" + uneDonation.getId_imagep() + "</td>";
                chaineDonations += "<td>" + uneDonation.getMontant_don() + "</td>";
                chaineDonations += "<td>" + uneDonation.getDate_don() + "</td>";
                chaineDonations += "<td>";

                chaineDonations += "<a href='index.jsp?page=1&action=sup&idDonation="
                        + uneDonation.getId_donnation() + "'> SUP </a>";

                chaineDonations += "<a href='index.jsp?page=1&action=edit&idDonation="
                        + uneDonation.getId_donnation() + "'> EDIT </a>";

                chaineDonations += "</td>";
                chaineDonations += "</tr>";
            }
            out.print(chaineDonations);
        %>
    </table>
</body>
</html>
