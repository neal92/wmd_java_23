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
	
	public static ArrayList<VueDonnation> selectAllVueDonations (){
		return modele.selectAllVueDonation();
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
 }
