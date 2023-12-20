<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
          <h3> Liste des Projets</h3>
    <table border = "1">
    <tr>
      <td> Id ProjetCar</td> <td> Titre_p_car</td>
      <td>Descrip_p_car</td> <td>Date_debut_p_car</td>
      <td>Date_fin_p_car</td>  <td>Id_assocarita</td>
      <td>Id_cateproj</td>  <td>Id_imagep</td>
      
      <td>Opérations</td>
    </tr>
    <%	
        String chaineProjets = "";
        for(Projet unProjet : lesProjets){
        	chaineProjets +="<tr>";
        	chaineProjets +="<td>"+unProjet.getId_projetcar()+"</td>";
        	chaineProjets +="<td>"+unProjet.getTitre_p_car()+"</td>";
        	chaineProjets +="<td>"+unProjet.getDescrip_p_car()+"</td>";
        	chaineProjets +="<td>"+unProjet.getDate_debut_p_car()+"</td>";
        	chaineProjets +="<td>"+unProjet.getDate_fin_p_car()+"</td>";
        	chaineProjets +="<td>"+unProjet.getId_assocarita()+"</td>";
        	chaineProjets +="<td>"+unProjet.getId_cateproj()+"</td>";
        	chaineProjets +="<td>"+unProjet.getId_imagep()+"</td>";
        	chaineProjets +="<td>";
        	chaineProjets +="<a href='index.jsp?page=1&action=sup&id_projetcar="
                +unProjet.getId_projetcar()+"'> SUP </a>";
                chaineProjets +="<a href='index.jsp?page=1&action=edit&id_projetcar="
                        +unProjet.getId_projetcar()+"'> Edit</a>";
        	chaineProjets +="</td>";
        	chaineProjets +="</tr>";
        }
        out.print(chaineProjets);
    %>
    </table>
</body>
</html>