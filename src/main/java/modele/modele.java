package modele;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import controleur.Donation;
import controleur.Projet;
import controleur.Utilisateur;

public class modele {
	private static Connexion maConnexion = new Connexion ("localhost", "wmd_23", "root", "");
	
	
	/****************Gesstion des Utilisateurs ********************/
	public static Utilisateur selectWhereUtilisateur(String email, String mdp_utilisateur) {
		String req ="select * from utilisateurs where email= '"+email+"' and mdp_utilisateur='"+mdp_utilisateur+"' ; "; 
		Utilisateur unUtilisateur= null;
		 
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
	
	
	
	/******************GESTTION DES Donations*************************/
	public static void insertDonation (Donation unDonation) {
		String req = "insert into donnations values (null, '"+unDonation.getMontant_don()+"','"
				+unDonation.getDate_don()+"', '"+unDonation.getId_utilisateur()+"','"+unDonation.getId_projetcar()+"', '"
				+unDonation.getId_catedon()+"', '"+unDonation.getId_imagep()+"'); ";
		System.out.println(req);
		try {
			maConnexion.seConnecter();
			Statement unStat = (Statement) maConnexion.getMaConnexion().createStatement();
			unStat.execute(req);
			unStat.close();
			maConnexion.seDeconnecter();
			
		}
		catch (SQLException exp) {
			System.out.println("Erreur d'execution : " +req);
		}
		
	}
	
	public static ArrayList<Donation> selectAllDonation(){
		String req ="select * from donnations;";
		ArrayList<Donation> lesDonations = new ArrayList<Donation>();
		try {
			maConnexion.seConnecter();
			java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(req);
			while(desRes.next()) {
				Donation unDonation =new Donation (
					    desRes.getInt("id_donnation"), 
					    desRes.getInt("id_utilisateur"),
					    desRes.getInt("id_projetcar"), 
					    desRes.getInt("id_catedon"), 
					    desRes.getInt("id_imagep"), 
					    desRes.getString("montant_don"), 
					   desRes.getString("date_don")
					);

				lesDonations.add(unDonation);			
			}
			unStat.close();
			maConnexion.seDeconnecter();
			
		}
		catch (SQLException exp) {
			System.out.println("Erreur d'execution : " +req);
		}
		return lesDonations;
		
	}
	
	public static void deleteDonation (int id_donnation) {
		String req = "delete from Donation where id_donnation= "+id_donnation+";";
		try {
			maConnexion.seConnecter();
			Statement unStat = (Statement) maConnexion.getMaConnexion().createStatement();
			unStat.execute(req);
			unStat.close();
			maConnexion.seDeconnecter();
			
		}
		catch (SQLException exp) {
			System.out.println("Erreur d'execution : " +req);
		}
		
	}
	
	public static Donation selectWhereDonation(int id_donnation) {
		String req ="select * from donnations where id_donnation= "+id_donnation+";"; 
		Donation unDonation = null;
		try {
			maConnexion.seConnecter();
			java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(req);
			if (desRes.next()) {
				 unDonation =new Donation (
					    desRes.getInt("id_donnation"), 
					    desRes.getInt("id_utilisateur"),
					    desRes.getInt("id_projetcar"), 
					    desRes.getInt("id_catedon"), 
					    desRes.getInt("id_imagep"), 
					    desRes.getString("montant_don"), 
					   desRes.getString("date_don")
					);
	
			}
			unStat.close();
			maConnexion.seDeconnecter();
			
		}
		catch (SQLException exp) {
			System.out.println("Erreur d'execution : " +req);
		}
		return unDonation;
		
	}
	
	public static void updateDonation (Donation unDonation) {
		String req = "update donnations set id_utilisateur= '"+unDonation.getId_utilisateur()+"',id_projetcar ='"+unDonation.getId_projetcar()
						+"',id_catedon ='"+unDonation.getId_catedon()+"',id_imagep ='"+unDonation.getId_imagep()+
						"',montant_don ='"+unDonation.getMontant_don()+"',date_don ='"+unDonation.getDate_don()+
						"'where id_donnation ="+unDonation.getId_donnation()+";";
		
		/*+"',id_cateproj ='"+unProjet.getId_cateproj()
		  +"',id_imagep ='"+unProjet.getId_imagep()
		  + "' where id_projetcar ="+unProjet.getId_projetcar()+";";*/
		
		
		
		try {
			maConnexion.seConnecter();
			Statement unStat = (Statement) maConnexion.getMaConnexion().createStatement();
			unStat.execute(req);
			unStat.close();
			maConnexion.seDeconnecter();
			
		}
		catch (SQLException exp) {
			System.out.println("Erreur d'execution : " +req);
		}
		
	}
	
	public static ArrayList<Donation> selectLikeDonations(String filtre){
		String req = "SELECT * FROM donnation " +
	             "WHERE id_utilisateur LIKE '%" + filtre + "%' " +
	             "OR id_projetcar LIKE '%" + filtre + "%' " +
	             "OR id_catedon LIKE '%" + filtre + "%' " +
	             "OR id_imagep LIKE '%" + filtre + "%' " +
	             "OR montant_don LIKE '%" + filtre + "%' " +
	             "OR date_don LIKE '%" + filtre + "%';";

		ArrayList<Donation> lesDonations = new ArrayList<Donation>();
		try {
			maConnexion.seConnecter();
			java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(req);
			while(desRes.next()) {
				Donation unDonation =new Donation (
					    desRes.getInt("id_donnation"), 
					    desRes.getInt("id_utilisateur"),
					    desRes.getInt("id_projetcar"), 
					    desRes.getInt("id_catedon"), 
					    desRes.getInt("id_imagep"), 
					    desRes.getString("montant_don"), 
					   desRes.getString("date_don")
					);

				lesDonations.add(unDonation);			
			}
			unStat.close();
			maConnexion.seDeconnecter();
		
	}catch (SQLException exp) {
		System.out.println("Erreur d'execution : " +req);
	}
		return lesDonations;
	}
	
	
	/********************************* Gestion Projets_Carita******************************************************/
	
	
	
	 public static void insertProjet (Projet unProjet) {
		  String req = "insert into projets_carita values (null, '"+unProjet.getTitre_p_car()+"','"+unProjet.getDescrip_p_car()
		  +"','"+unProjet.getDate_debut_p_car()+"','"+unProjet.getDate_fin_p_car()+"','"+unProjet.getId_assocarita()
		  +"','"+unProjet.getId_cateproj()+"','"+unProjet.getId_imagep()+"');";
		 System.out.println(req);
		  try {
			  maConnexion.seConnecter();
			  Statement unStat = maConnexion.getMaConnexion().createStatement();
			  unStat.execute(req);
			  unStat.close();
			  maConnexion.seDeconnecter();
			  
		  }
		  catch (SQLException exp) {
			  System.out.println("Erreur d'execution:"+req);
		  }
	  }
	  public static ArrayList<Projet> selectAllProjet(){
		  String req = "select * from projets_carita ;";
		  ArrayList<Projet> lesProjets = new ArrayList<Projet>();
		  try {
			  maConnexion.seConnecter();
			  Statement unStat = maConnexion.getMaConnexion().createStatement();
			  ResultSet desRes = unStat.executeQuery(req);
			  while(desRes.next()) {
			    Projet unProjet= new Projet(
			    		desRes.getInt("id_projetcar"), 
			    		desRes.getInt("id_assocarita"), 
			    		desRes.getInt("id_cateproj"), 
			    		desRes.getInt("id_imagep"),
			    		desRes.getString("titre_p_car"),
			    		desRes.getString("descrip_p_car"), 
			    		desRes.getString("date_debut_p_car"),
			    		desRes.getString("date_fin_p_car")
			    		);
			     lesProjets.add(unProjet);
			  }
			  unStat.close();
			  maConnexion.seDeconnecter();
		  }
		    catch (SQLException exp) {
		    	System.out.println("Erreur d'execution:"+req);
		    }
		  return lesProjets;
		  
	  }
	  public static void deleteProjet (int id_projetcar) {
		  String req = " delete from projets_carita where id_projetcar= "+id_projetcar+";";
		  try {
			  maConnexion.seConnecter();
			  Statement unStat = maConnexion.getMaConnexion().createStatement();
			  unStat.execute(req);
			  unStat.close();
			  maConnexion.seDeconnecter();
			  
		  }
		  catch (SQLException exp) {
			  System.out.println("Erreur d'execution:"+req);
		  }
		  
	  }
	  public static Projet selectWhereProjet(int id_projetcar) {
		  
		  String req = " select * from projets_carita where id_projetcar=" +id_projetcar+";";
		  Projet unProjet = null;
		  //System.out.println(req);
		  try {
			  maConnexion.seConnecter();
			  Statement unStat = maConnexion.getMaConnexion().createStatement();
			  ResultSet desRes = unStat.executeQuery(req);
			 
			  if(desRes.next()){
			  unProjet= new Projet(
			    		desRes.getInt("id_projetcar"), 
			    		desRes.getInt("id_assocarita"), 
			    		desRes.getInt("id_cateproj"), 
			    		desRes.getInt("id_imagep"),
			    		desRes.getString("titre_p_car"),
			    		desRes.getString("descrip_p_car"), 
			    		desRes.getString("date_debut_p_car"),
			    		desRes.getString("date_fin_p_car")
			    		);
			  
			  	}
			  unStat.close();
			  maConnexion.seDeconnecter();
		  }
		  catch(SQLException exp) {
			  System.out.println("Erreur d'execution:"+req);
			  exp.printStackTrace();
		  }
		  return unProjet;
	  }
	  public static void updateProjet(Projet unProjet) {
		  String req = "update projets_carita set titre_p_car= '"+unProjet.getTitre_p_car()
		  +"',descrip_p_car='"+unProjet.getDescrip_p_car()+"',date_debut_p_car ='"+unProjet.getDate_debut_p_car()
		  +"',date_fin_p_car ='"+unProjet.getDate_fin_p_car()
		  +"',id_assocarita ='"+unProjet.getId_assocarita()
		  +"',id_cateproj ='"+unProjet.getId_cateproj()
		  +"',id_imagep ='"+unProjet.getId_imagep()
		  + "' where id_projetcar ="+unProjet.getId_projetcar()+";";
		  
		  try {
			  maConnexion.seConnecter();
			  Statement unStat = maConnexion.getMaConnexion().createStatement();
			  unStat.execute(req);
			  unStat.close();
			  maConnexion.seDeconnecter();
			  
		  }
		  catch (SQLException exp) {
			  System.out.println("Erreur d'execution:"+req);
		  }
		  
		  
	  }
     public static ArrayList<Projet> selectLikeProjets(String filtre){
   	  String req = "select * from projets_carita where titre_p_car like'%"+filtre+"%' or descrip_p_car like '%"+filtre+"%' "
   	  		+ "or date_debut_p_car like '%"+filtre+"%' "
   	  	    + "or date_fin_p_car like '%"+filtre+"%' or id_assocarita like '%"+filtre+"%' "
   	  	    + "or id_cateproj like '%"+filtre+"%' "
            + "or id_imagep like '%"+filtre+"%';";
   	  ArrayList<Projet> lesProjets = new ArrayList<Projet>();
		  try {
			  maConnexion.seConnecter();
			  Statement unStat = maConnexion.getMaConnexion().createStatement();
			  ResultSet desRes = unStat.executeQuery(req);
			  while(desRes.next()) {
			    Projet unProjet= new Projet(
			    		desRes.getInt("id_projetcar"), 
			    		desRes.getInt("id_assocarita"), 
			    		desRes.getInt("id_cateproj"), 
			    		desRes.getInt("id_imagep"),
			    		desRes.getString("titre_p_car"),
			    		desRes.getString("descrip_p_car"), 
			    		desRes.getString("date_debut_p_car"),
			    		desRes.getString("date_fin_p_car")
			    		);
			     lesProjets.add(unProjet);
			  }
			  unStat.close();
			  maConnexion.seDeconnecter();
		  }
		    catch (SQLException exp) {
		    	System.out.println("Erreur d'execution:"+req);
		    }
		  return lesProjets;
		  
		  
		  
   	  
     }
}
