<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.Donation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Ajouter un Donation</title>
</head>
<body>
<br>
<br>
    <h5>Ajouter une Donation</h5>
    <form method="post">
        <table>
            <tr>
                <td>ID Utilisateur Connecté</td>
                <td>
                    <input type="text" name="id_utilisateur" value='<%= (session.getAttribute("id_utilisateur") != null) ? session.getAttribute("id_utilisateur") : "" %>' readonly>
                </td>
            </tr>
            <tr>
                <td>ID Projet Car</td>
                <td>
                    <input type="text" name="id_projetcar" value='<%= (leDonation != null) ? leDonation.getId_projetcar() : "" %>'>
                </td>
            </tr>
            <tr>
                <td>ID Catedon</td>
                <td>
                    <input type="text" name="id_catedon" value='<%= (leDonation != null) ? leDonation.getId_catedon() : "" %>'>
                </td>
            </tr>
            <tr>
                <td>ID Imagep</td>
                <td>
                    <input type="text" name="id_imagep" value='<%= (leDonation != null) ? leDonation.getId_imagep() : "" %>'>
                </td>
            </tr>
            
            <tr>
                <td>Id AssoCarita</td>
                <td>
                    <input type="text" name="id_assocarita" value='<%= (leDonation != null) ? leDonation.getId_assocarita() : "" %>'>
                </td>
            </tr>
            
            <tr>
                <td>Montant Don</td>
                <td>
                    <input type="text" name="montant_don" value='<%= (leDonation != null) ? leDonation.getMontant_don() : "" %>'>
                </td>
            </tr>
            
            <tr>
                <td>Date Don</td>
                <td>
                    <input type="date" name="date_don" value='<%= (leDonation != null) ? leDonation.getDate_don() : "" %>'>
                </td>
            </tr>
                
            <tr>
            <tr>            
                <td></td>
                <td>
                    <input type="submit" <%= (leDonation != null) ? "name='Modifier' value='Modifier'" : "name='Valider' value='Valider'" %>>
                </td>
            </tr>
        </table>
        <!-- Ajoutez des champs cachés pour d'autres attributs de la classe Donation -->
        <%= (leDonation != null) ? "<input type='hidden' name='id_donnation' value='" + leDonation.getId_donnation() + "'>" : "" %>
    </form>
</body>
</html>
