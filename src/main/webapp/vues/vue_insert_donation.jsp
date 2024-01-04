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
    
        <div class="container text-center">
        <div class="row">
            <div class="col-md-6">
                <form method="post" class="bg-dark text-light p-4">
                    <div class="mb-3">
                        <label for="id_utilisateur" class="form-label">ID Utilisateur Connecté</label>
                        <input type="int" class="form-control" id="id_utilisateur" name="id_utilisateur"
                            value='<%= (session.getAttribute("id_utilisateur") != null) ? session.getAttribute("id_utilisateur") : "" %>' readonly>
                    </div>

                    <div class="mb-3">
                        <label for="id_projetcar" class="form-label">Sélectionnez un Projet Caritatif</label>
                        <select class="form-select" id="id_projetcar" name="id_projetcar">
                            <%
                                ArrayList<ProjetsCaritas> lesProjetsCaritas = controleur.Controleur.selectAllProjetCarita();
                                for (ProjetsCaritas unProjCarita : lesProjetsCaritas) {
                                    out.print("<option value='" + unProjCarita.getId_projetcar() + "'> " + unProjCarita.getId_projetcar() + "-" + unProjCarita.getTitre_p_car() + "</option>");
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="id_catedon" class="form-label">Sélectionnez une Catégorie de Donation</label>
                        <select class="form-select" id="id_catedon" name="id_catedon">
                            <%
                                ArrayList<CategorieDon> lesCategories = controleur.Controleur.selectAllCategorieDons();
                                for (CategorieDon uneCateg : lesCategories) {
                                    out.print("<option value='" + uneCateg.getId_catedon() + "'> " + uneCateg.getNom_cate_don() + "</option>");
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="id_imagep" class="form-label">Sélectionnez une Image</label>
                        <select class="form-select" id="id_imagep" name="id_imagep">
                      

                            <%
                                ArrayList<ImageP> lesImagesP = controleur.Controleur.selectAllImagesP();
                                for (ImageP uneImageP : lesImagesP) {
                                    out.print("<option value='" + uneImageP.getId_imagep() + "'> " + uneImageP.getNom_image_p() + "</option>");
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="id_assocarita" class="form-label">Sélectionnez une Association Caritative</label>
                        <select class="form-select" id="id_assocarita" name="id_assocarita">
                            <%
                                ArrayList<AssociationCarita> lesAssociationsCaritas = controleur.Controleur.selectAllAssociationCarita();
                                for (AssociationCarita uneAssociationCarita : lesAssociationsCaritas) {
                                    out.print("<option value='" + uneAssociationCarita.getId_assocarita() + "'> " + uneAssociationCarita.getNom_asso_carita() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                </form>
            </div>

            <div class="col-md-6">
                <form method="post" class="bg-dark text-light p-4">
                    <div class="mb-3">
                        <label for="montant_don" class="form-label">Montant Don</label>
                        <input type="text" class="form-control" id="montant_don" name="montant_don"
                            value='<%= (leDonation != null) ? leDonation.getMontant_don() : "" %>'>
                    </div>

                    <div class="mb-3">
                        <label for="date_don" class="form-label">Date Don</label>
                        <input type="date" class="form-control" id="date_don" name="date_don"
                            value='<%= (leDonation != null) ? leDonation.getDate_don() : "" %>'>
                    </div>

                    <div class="text-end">
                        <input type="submit"
                            <%= (leDonation != null) ? "name='Modifier' value='Modifier'" : "name='Valider' value='Valider'" %>>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
                       
       <!-- Ajoutez des champs cachés pour d'autres attributs de la classe Donation -->
        <%= (leDonation != null) ? "<input type='hidden' name='id_donnation' value='" + leDonation.getId_donnation() + "'>" : "" %>
    
</body>
</html>