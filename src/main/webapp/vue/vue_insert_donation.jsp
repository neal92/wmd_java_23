<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.Donation" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
    <title>Ajouter une Donation</title>
</head>
<body>
  <style>

  
  </style>
    <h3>Ajouter une Donation</h3>
    <form method="post">
        <table>
            <tr>
                <td>ID Utilisateur</td>
                <td>
                    <input type="text" name="id_utilisateur" value='<%= (unDonation != null) ? unDonation.getId_utilisateur() : "" %>'>
                </td>
            </tr>
            <tr>
                <td>ID Projet Car</td>
                <td>
                    <input type="text" name="id_projetcar" value='<%= (unDonation != null) ? unDonation.getId_projetcar() : "" %>'>
                </td>
            </tr>
            <tr>
                <td>ID Catedon</td>
                <td>
                    <input type="text" name="id_catedon" value='<%= (unDonation != null) ? unDonation.getId_catedon() : "" %>'>
                </td>
            </tr>
            <tr>
                <td>ID Imagep</td>
                <td>
                    <input type="text" name="id_imagep" value='<%= (unDonation != null) ? unDonation.getId_imagep() : "" %>'>
                </td>
            </tr>
            <tr>
                <td>Montant Don</td>
                <td>
                    <input type="text" name="montant_don" value='<%= (unDonation != null) ? unDonation.getMontant_don() : "" %>'>
                </td>
            </tr>
            <tr>
                <td>Date Don</td>
                <td>
                    <input type="date" name="date_don" value='<%= (unDonation != null) ? unDonation.getDate_don() : "" %>'>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" <%= (unDonation != null) ? " name='Modifier' value='Modifier'" : "name='Valider' value='Valider'" %>
                    >
                </td>
            </tr>
        </table>
        <!-- Ajoutez des champs cachés pour d'autres attributs de la classe Donation -->
        <%= (unDonation != null) ? "<input type='hidden' name='idDonation' value='" + unDonation.getId_donnation() + "'>" : "" %>
    </form>
</body>
</html>
