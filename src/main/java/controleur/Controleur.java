package controleur;
import java.util.ArrayList;
import modele.modele;

public class Controleur {
	
	/********** Gestion des Utilisateur  ************/

	 public static Utilisateur selectWhereUtilisateur(String email, String mdp_utilisateur) {
		  
	       return modele.selectWhereUtilisateur(email, mdp_utilisateur);
	    }
	 



	/********** Gestion des donations ************/
	public static void insertDonation (Donation unDonation) {
		modele.insertDonation(unDonation);
		
	}
	public static ArrayList<Donation> selectAllDonations (){
		return modele.selectAllDonation();
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
		public static void insertProjet (Projet unProjet) {
			modele.insertProjet(unProjet);
			
		}
		public static ArrayList<Projet> selectAllProjets (){
			return modele.selectAllProjet();
		}
		public static ArrayList<Projet> selectLikeProjets (String filtre){
			return modele.selectLikeProjets(filtre);
		}
		public static void deleteProjet (int id_projetcar){
			 modele.deleteProjet(id_projetcar);
		}
		public static Projet selectWhereProjet(int id_projetcar){
			return modele.selectWhereProjet(id_projetcar);
		}
		
		 public static void updateProjet(Projet unProjet) {
		        modele.updateProjet(unProjet);
		 }
 }
