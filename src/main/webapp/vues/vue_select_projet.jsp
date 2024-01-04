<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.ProjetsCaritas" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Liste des Projets Caritatifs</title>
</head>
<body>

          <h3> Liste des Projets</h3>
    <table border="1" class="table bg-dark text-light p-4">
    <tr>
      <td> Id Projet Caritatif</td> <td> Titre du Projet Caritatif</td>
      <td>Descrip Projet Caritatif</td> <td>Date debut du Projet Caritatif</td>
      <td>Date fin du Projet Caritatif</td>  <td>Nom de l'association Caritatif</td>
      <td>Nom Catégorie Projet</td>  <td>Nom Image Projet</td>
      
      <td>Opérations</td>
    </tr>
    <%	
        String chaineProjetsCaritas = "";
        for(VueProjetCaritas unProjetCarita : lesProjetsCaritaS) {
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getId_projetcar()+"</td>";
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getTitre_p_car()+"</td>";
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getDescrip_p_car()+"</td>";
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getDate_debut_p_car()+"</td>";
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getDate_fin_p_car()+"</td>";
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getNom_asso_carita()+"</td>";
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getNom_cate_proj()+"</td>";
        	chaineProjetsCaritas +="<td>"+unProjetCarita.getNom_image_p()+"</td>";
        	chaineProjetsCaritas +="<td>";
        	
        	chaineProjetsCaritas +="<a href='index.jsp?page=2&action=sup&id_projetcar="
                +unProjetCarita.getId_projetcar()+"'> SUP </a>";
                
                chaineProjetsCaritas +="<a href='index.jsp?page=2&action=edit&id_projetcar="
                        +unProjetCarita.getId_projetcar()+"'> EDIT </a>";
                        
                        chaineProjetsCaritas +="</td>";
                        chaineProjetsCaritas +="</tr>";
        }
        out.print(chaineProjetsCaritas);
    %>
    </table>
</body>
</html>