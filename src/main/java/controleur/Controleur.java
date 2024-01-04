package controleur;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import modele.modele;

public class Controleur {
	
	/********** Gestion des Utilisateur  ************/

	 public static Utilisateur selectWhereUtilisateur(String email, String mdp_utilisateur) {
	       return modele.selectWhereUtilisateur(email, mdp_utilisateur);
	    }
	 



	/********** Gestion des donations ************/
	 public static void insertDonation (Donation unDonation, HttpSession session) {
		    modele.insertDonation(unDonation, session);
		}

	public static ArrayList<Donation> selectAllDonations (){
		return modele.selectAllDonation();
	}
	
	public static ArrayList<VueDonnation> selectAllVueDonnation (){
		return modele.selectAllVueDonnation();
	}
	
	
	public static ArrayList<Donation> selectLikeDonations (String filtre){
		return modele.selectLikeDonations(filtre);
	}
	public static void deleteDonation (int id_donnation){
		 modele.deleteDonation(id_donnation);
	}
	public static Donation selectWhereDonation(int id_donnation){
		return modele.selectWhereDonation(id_donnation);
	}
	
	 public static void updateDonation(Donation unDonation) {
	        modele.updateDonation(unDonation);
	 }
	 
	 

	/********** Gestion des Projets ************/
	 
	public static void insertProjetCarita (ProjetsCaritas unProjet) {
		modele.insertProjetCarita(unProjet);
		
	}
	 public static ArrayList<ProjetsCaritas> selectAllProjetCarita (){
			return modele.selectAllProjetCarita();
		}
	 
		public static ArrayList<VueProjetCaritas> selectAllVueProjetCaritas (){
			return modele.selectAllVueProjetCaritas();
		}
	 
	public static ArrayList<ProjetsCaritas> selectLikeProjetCarita (String filtre){
		return modele.selectLikeProjetCarita(filtre);
	}
	public static void deleteProjetCarita (int id_projetcar){
		 modele.deleteProjetCarita(id_projetcar);
	}
	public static ProjetsCaritas selectWhereProjetCarita(int id_projetcar){
		return modele.selectWhereProjetCarita(id_projetcar);
	}
	
	 public static void updateProjetCarita(ProjetsCaritas unProjet) {
	        modele.updateProjetCarita(unProjet);
	 }
	 
	 
	 
	/********** Gestion des ImageP ************/

	 
	 public static ArrayList<ImageP> selectAllImagesP (){
			return modele.selectAllImagesP();
		}
	 
	/********** Gestion des Association Carita ************/	 
	 
	 public static ArrayList<AssociationCarita> selectAllAssociationCarita (){
			return modele.selectAllAssociationCarita();
		}
	 
	 
	 /********** Gestion des Catégorie Dons ************/
	 public static ArrayList<CategorieDon> selectAllCategorieDons (){
			return modele.selectAllCategorieDons();
		}
	 
	 /********** Gestion des Catégorie Projet ************/
	 public static ArrayList<CategorieProjet> selectAllCategorieProjet (){
			return modele.selectAllCategorieProjet();
		}
	 
	}

