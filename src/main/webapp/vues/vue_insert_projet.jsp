<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="controleur.AssociationCarita" %>
<%@ page import="controleur.CategorieProjet" %>
<%@ page import="controleur.ImageP" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Ajouter un Projet Caritatif</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <form method="post" class= " card bg-dark text-light p-4">
                    <div class="mb-3 text-right">
                        <label for="id_assocarita" class="form-label">Sélectionnez une Association Caritative</label>
                        <input type ="text" name = "id_assocarita">
                    </div>

                    <div class="mb-3 text-right">
                        <label for="id_cateproj" class="form-label">Sélectionnez une Catégorie de Projet</label>
                        <select class="form-select" id="id_cateproj" name="id_cateproj">
                            <%
                                ArrayList<CategorieProjet> lesCategoriesProjets = controleur.Controleur.selectAllCategorieProjet();
                                for (CategorieProjet uneCategorieProjet : lesCategoriesProjets) {
                            %>
                            <option value='<%= uneCategorieProjet.getId_cateproj() %>'><%= uneCategorieProjet.getNom_cate_proj() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3 text-right">
                        <label for="id_imagep" class="form-label">Sélectionnez une Image</label>
                        <select class="form-select" id="id_imagep" name="id_imagep">
                            <%
                                ArrayList<ImageP> lesImageSP = controleur.Controleur.selectAllImagesP();
                                for (ImageP uneImageP : lesImageSP) {
                            %>
                            <option value='<%= uneImageP.getId_imagep() %>'><%= uneImageP.getNom_image_p() %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="date_debut_p_car">Date Debut Projet Caritatif</label>
                        <input type="date" class="form-control" name="date_debut_p_car" value='<%= (leProjetCarita != null) ? leProjetCarita.getDate_debut_p_car() : "" %>'>
                    </div>

                    <div class="mb-3">
                        <label for="date_fin_p_car">Date Fin Projet Caritatif</label>
                        <input type="date" class="form-control" name="date_fin_p_car" value='<%= (leProjetCarita != null) ? leProjetCarita.getDate_fin_p_car() : "" %>'>
                    </div>

                    <%
                        if (leProjetCarita != null) {
                    %>
                    <input type='hidden' name='id_projetcar' value='<%= leProjetCarita.getId_projetcar() %>'>
                    <%
                        }
                    %>
                </form>
            </div>
            <div class="col-md-6">
                <form method="post" class="bg-dark text-light p-4">
                    <div class="mb-3">
                        <label for="titre_p_car">Titre Projet Caritatif</label>
                        <input type="text" class="form-control" name="titre_p_car" value='<%= (leProjetCarita != null) ? leProjetCarita.getTitre_p_car() : "" %>'>
                    </div>

                    <div class="mb-3">
                        <label for="descrip_p_car">Description Projet Caritatif</label>
                        <textarea class="form-control" name="descrip_p_car" rows="4"><%= (leProjetCarita != null) ? leProjetCarita.getDescrip_p_car() : "" %></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <input type="submit" class="btn btn-primary" <%= (leProjetCarita != null) ? "name='Modifier' value='Modifier'" : "name='Valider' value='Valider'" %>>
                    </div>

                    <%
                        if (leProjetCarita != null) {
                    %>
                    <input type='hidden' name='id_projetcar' value='<%= leProjetCarita.getId_projetcar() %>'>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
