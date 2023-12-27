<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Insert title here</title>
</head>
<body>

   <h3> Ajouter d'un Projet </h3>
      <form method="post">
      <table>
        <tr>
          
           <td>Titre_p_car</td>
           <td><input type="text" name ="titre_p_car" 
          value = '<%=  (leProjet != null)?leProjet.getTitre_p_car():"" %>'></td>
        </tr>
         <tr>
           <td>DescripProCarita</td>
           <td><input type="text" name ="descrip_p_car" 
           value = '<%=  (leProjet != null)?leProjet.getDescrip_p_car():"" %>'></td>
        </tr>
         <tr>
           <td>Date Debut Projet Carita</td>
           <td><input type="date" name ="date_debut_p_car" 
           value = '<%=  (leProjet != null)?leProjet.getDate_debut_p_car():"" %>'></td>
        </tr>
        <tr>
           <td>Date Fin Projet Carita</td>
           <td><input type="date" name ="date_fin_p_car" 
           value = '<%=  (leProjet != null)?leProjet.getDate_fin_p_car():"" %>'></td>
        </tr>
        <tr>
          <td>Id AssoCarita</td>
          <td><input type="text" name ="id_assocarita" 
          value = '<%=  (leProjet != null)?leProjet.getId_assocarita():"" %>'></td>
       </tr>
        <tr>
          <td>Id CategProj</td>
          <td><input type="text" name ="id_cateproj" 
          value = '<%=  (leProjet != null)?leProjet.getId_cateproj():"" %>'></td>
       </tr>
        <tr>
          <td>Id ImageProj</td>
          <td><input type="text" name ="id_imagep" 
          value = '<%=  (leProjet != null)?leProjet.getId_imagep():"" %>'></td>
       </tr>
         <tr>
           <td> </td>
           <td><input type="submit" 
           <%= (leProjet != null)? "name='Modifier' value='Modifier' ":
        	   " name='Valider' value='Valider' "%></td>
        </tr>
        
      </table>
      <%= (leProjet != null)?"<input type='hidden' name='id_projetcar' value='" + leProjet.getId_projetcar()+"'>":"" %>
      </form>

</body>
</html>