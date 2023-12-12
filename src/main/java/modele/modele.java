package modele;
import java.sql.ResultSet;
import java.sql.SQLException;

import controleur.Utilisateur;

public class modele {
	private static Connexion maConnexion = new Connexion ("localhost", "wmd_23", "root", "root");
	
	
	/****************Utilisateur ********************/
	public static Utilisateur selectWhereUtilisateur(String email, String mdp_utilisateur) {
		String req ="select * from utilisateurs where email= '"+email+"' and mdp_utilisateur='"+mdp_utilisateur+"' ; "; 
		Utilisateur unUtilisateur= null;
		System.out.println(req);
		try {
			maConnexion.seConnecter();
			java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(req);
			if (desRes.next()) {
				unUtilisateur = new Utilisateur (
						desRes.getInt ("id_utilisateur"),desRes.getInt("id_role"),
						desRes.getString("nom"),desRes.getString ("prenom"), desRes.getString("email"), 
						desRes.getString("age"), desRes.getString("mdp_utilisateur"), 
						desRes.getString("telephone"), desRes.getString("date_inscription") 
						);			
			}
			unStat.close();
			maConnexion.seDeconnecter();
			
		} catch (Exception e) {
		    e.printStackTrace();
		}
		return unUtilisateur;
		
	}

}
