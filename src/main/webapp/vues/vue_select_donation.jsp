<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.Donation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Liste des Donations</title>
</head>
<body>
    <h5>Liste des Donations</h5>
    <table border="1">
        <tr>
            <td>Id Donation</td>
            <td>Nom Association Caritatif</td>
            <td>Nom de l'utilisateur</td>
            <td>Projet Car</td>
            <td>Catedon</td>
            <td>Imagep</td>
            <td>Montant Don</td>
            <td>Date Don</td>
            <td>Opérations</td>
        </tr>
        <%
            String chaineDonations = "";
            for (VueDonnation uneDonation : lesDonations) {
                chaineDonations += "<td>" + uneDonation.getId_donnation() + "</td>";
                chaineDonations += "<td>" + uneDonation.getNom_asso_carita() + "</td>";
                chaineDonations += "<td>" + uneDonation.getNom() + "</td>";
                chaineDonations += "<td>" + uneDonation.getNomproj() + "</td>";
                chaineDonations += "<td>" + uneDonation.getNomdon()+ "</td>";
                chaineDonations += "<td>" + uneDonation.getNomimage() + "</td>";
                chaineDonations += "<td>" + uneDonation.getMontant_don() + "</td>";
                chaineDonations += "<td>" + uneDonation.getDate_don() + "</td>";
                chaineDonations += "<td>";

                chaineDonations += "<a href='index.jsp?page=1&action=sup&id_donnation="
                        + uneDonation.getId_donnation() + "'> SUP </a>";

                chaineDonations += "<a href='index.jsp?page=1&action=edit&id_donnation="
                        + uneDonation.getId_donnation() + "'> EDIT </a>";

                chaineDonations += "</td>";
                chaineDonations += "</tr>";
            }
            out.print(chaineDonations);
        %>
    </table>
    <br>
    <br>
</body>
</html>
