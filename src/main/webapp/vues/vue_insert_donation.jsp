<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.Donation" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Ajouter un Donation</title>
</head>
<body>
    <h5>Ajouter une Donation</h5>
    
    <form method="post" class="bg-dark text-light">
        
            <tr>
                <td>ID Utilisateur Connecté</td>
                <td>
                    <input type="text" name="id_utilisateur" value='<%= (session.getAttribute("id_utilisateur") != null) ? session.getAttribute("id_utilisateur") : "" %>' readonly>
                </td>
            </tr>
            <br>
            <tr>
                <td>Selectionnez un Projet Caritatif</td>
                <td>
                   <select name="id_projetcar" >
                   <%
                   ArrayList<ProjetsCaritas> lesProjetsCaritas = Controleur.selectAllProjetsCaritas(); 
                                      for (ProjetsCaritas unProjCarita : lesProjetsCaritas ){
                                      out.print("<option value ='"+unProjCarita.getId_projetcar()+"'> "+ unProjCarita.getId_projetcar()+"-"+unProjCarita.getTitre_p_car()+"</option>"); 
                                      }
                   %>
                   </select>
                </td>
            </tr>
            <br>
            <tr>
                <td>Selectionnez une Catégorie de Donation</td>
                <td>
                   <select name="id_catedon" >
                   <%
                   ArrayList<CategorieDon> lesCategories = Controleur.selectAllCategorieDons(); 
                                      for (CategorieDon uneCateg : lesCategories ){
                                      out.print("<option value ='"+uneCateg.getId_catedon()+"'> "+ uneCateg.getNom_cate_don()+"</option>"); 
                                      }
                   %>
                   </select>
                </td>
            </tr>
            
            <tr>
            <br>
                <td>Selectionnez une Image</td>
                <td>
                <br>
                   <select name="id_imagep" >
                   <%
                   ArrayList<ImageP> lesImagesP = Controleur.selectAllImagesP(); 
                                      for (ImageP uneImageP : lesImagesP ){
                                      out.print("<option value ='"+uneImageP.getId_imagep()+"'> "+ uneImageP.getNom_image_p()+"</option>"); 
                                      }
                   %>
                   </select>
                </td>
            </tr>
            
            <tr>
            <br>	
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
                
            
            <tr class="p-4">            
              
                <td>
                    <input type="submit" <%= (leDonation != null) ? "name='Modifier' value='Modifier'" : "name='Valider' value='Valider'" %>>
                </td>
            </tr>
  
        <!-- Ajoutez des champs cachés pour d'autres attributs de la classe Donation -->
        <%= (leDonation != null) ? "<input type='hidden' name='id_donnation' value='" + leDonation.getId_donnation() + "'>" : "" %>
    </form>
</body>
</html>