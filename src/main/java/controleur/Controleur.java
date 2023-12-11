package controleur;

import modele.modele;

public class Controleur {
	
	/********** Gestion des Utilisateur  ************/

	 public static Utilisateur selectWhereUtilisateur(String email, String mdp_utilisateur) {
	       return modele.selectWhereUtilisateur(email, mdp_utilisateur);
	    }
	 

}
