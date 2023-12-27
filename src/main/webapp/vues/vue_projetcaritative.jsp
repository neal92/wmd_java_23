<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.ProjetCaritas" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Liste des Projets Caritatives</title>
</head>
<body>
    <h5>Liste des Projets Caritatives</h5>
    
    <table border="1" class="table bg-dark text-light p-4">
        <tr>
            <td>Titre Projet Caritative</td>
            <td>Description Projet Caritative</td>
            <td>Date Début</td>
            <td>Date de Fin</td>
        </tr>
        <%
            String chaineProjetCaritative = "";
            for (ProjetsCaritas unProjetCarita : lesProjetsCaritas) {
            	chaineProjetCaritative += "<td>" + unProjetCarita.getTitre_p_car() + "</td>";
            	chaineProjetCaritative += "<td>" + unProjetCarita.getDescrip_p_car() + "</td>";
            	chaineProjetCaritative += "<td>" + unProjetCarita.getDate_debut_p_car() + "</td>";
            	chaineProjetCaritative += "<td>" + unProjetCarita.getDate_fin_p_car() + "</td>";



            }
            out.print(chaineProjetCaritative);
        %>
    </table>
    <br>
    <br>
</body>
</html>
