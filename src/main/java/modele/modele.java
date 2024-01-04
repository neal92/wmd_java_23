package modele;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import controleur.AssociationCarita;
import controleur.CategorieDon;
import controleur.CategorieProjet;
import controleur.Donation;
import controleur.ImageP;
import controleur.ProjetsCaritas;
import controleur.ProjetsCaritas;
import controleur.Utilisateur;
import controleur.VueDonnation;
import controleur.VueProjetCaritas;

public class modele {
	private static Connexion maConnexion = new Connexion ("localhost", "wmd_23", "root", "root");
	
	
	/****************Gesstion des Utilisateurs ********************/
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
	
	
	
	/******************GESTION DES Donations*************************/
	public static void insertDonation (Donation unDonation, HttpSession session) {
		String req = "insert into donnations VALUES (null, '"
				+ unDonation.getMontant_don() + "','"
			    + unDonation.getDate_don() + "', '"
			    + (session.getAttribute("id_utilisateur") != null ?
			    	      session.getAttribute("id_utilisateur") :
			    	      "null") + "','"
			    + unDonation.getId_assocarita() + "','" 
			    + unDonation.getId_projetcar() + "','"
			    + unDonation.getId_catedon() + "','"
			    + unDonation.getId_imagep() + "'); ";

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
				Donation unDonation = new Donation(
					    desRes.getInt("id_donnation"),
					    desRes.getInt("id_utilisateur"), 
					    desRes.getInt("id_projetcar"),
					    desRes.getInt("id_catedon"),
					    desRes.getInt("id_imagep"),
					    desRes.getInt("id_assocarita"),
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
	
	public static ArrayList<VueDonnation> selectAllVueDonnation(){
		String req ="select * from vuedonations;";
		ArrayList<VueDonnation> lesDonations = new ArrayList<VueDonnation>();
		try {
			maConnexion.seConnecter();
			java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(req);
			while(desRes.next()) {
				VueDonnation unDonation =new VueDonnation (
					    desRes.getInt("id_donnation"), 
					    desRes.getInt("id_utilisateur"),
					    desRes.getInt("id_projetcar"), 
					    desRes.getInt("id_catedon"), 
					    desRes.getInt("id_imagep"), 
					    desRes.getInt("id_assocarita"),
					    desRes.getString("montant_don"), 
					   desRes.getString("date_don"), 
					   desRes.getString("nom"),
					   desRes.getString("prenom"),  
					   desRes.getString("nom_cate_proj"),
					   desRes.getString("nom_cate_don"),
					   desRes.getString("nom_image_p"),
					   desRes.getString("nom_asso_carita")
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
		String req = "delete from donnations where id_donnation= "+id_donnation+";";
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
				 unDonation = new Donation(
					    desRes.getInt("id_donnation"),
					    desRes.getInt("id_utilisateur"), 
					    desRes.getInt("id_projetcar"),
					    desRes.getInt("id_catedon"),
					    desRes.getInt("id_imagep"),
					    desRes.getInt("id_assocarita"),
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
		String req = "UPDATE donnations SET id_utilisateur = '" + unDonation.getId_utilisateur() +
	              "', id_projetcar = '" + unDonation.getId_projetcar() +
	              "', id_catedon = '" + unDonation.getId_catedon() +
	              "', id_imagep = '" + unDonation.getId_imagep() +
	              "', montant_don = '" + unDonation.getMontant_don() +
	              "', date_don = '" + unDonation.getDate_don() +
	              "', id_assocarita = '" + unDonation.getId_assocarita() +
	              "' WHERE id_donnation = " + unDonation.getId_donnation() + ";";
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
	
	public static ArrayList<Donation> selectLikeDonations(String filtre){
		String req = "SELECT * FROM donnations " +
	             "WHERE id_donnation LIKE '%" + filtre + "%' " +
	             "OR montant_don LIKE '%" + filtre + "%' " +
	             "OR date_don LIKE '%" + filtre + "%' " +
	             "OR id_utilisateur LIKE '%" + filtre + "%' " +
	             "OR id_assocarita LIKE '%" + filtre + "%' " +
	             "OR id_projetcar LIKE '%" + filtre + "%' " +
	             "OR id_catedon LIKE '%" + filtre + "%' " +
	             "OR id_imagep LIKE '%" + filtre + "%';";

	             


		ArrayList<Donation> lesDonations = new ArrayList<Donation>();
		try {
			maConnexion.seConnecter();
			java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(req);
			while(desRes.next()) {
				Donation unDonation = new Donation(
					    desRes.getInt("id_donnation"),
					    desRes.getInt("id_utilisateur"),
					    desRes.getInt("id_projetcar"),
					    desRes.getInt("id_catedon"),
					    desRes.getInt("id_imagep"),
					    desRes.getInt("id_assocarita"),
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
	
	

	
/********************************* Gestion Categorie Dons******************************************************/
	
	public static ArrayList<CategorieDon> selectAllCategorieDons(){
		String req ="select * from cate_don;";
		ArrayList<CategorieDon> lesCategoriesDons = new ArrayList<CategorieDon>();
		try {
			maConnexion.seConnecter();
			java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
			ResultSet desRes = unStat.executeQuery(req);
			while(desRes.next()) {
				CategorieDon uneCategorieDon =new CategorieDon (
					    desRes.getInt("id_catedon"), 
					   desRes.getString("nom_cate_don"),
					   desRes.getString("descrip_cate_don")
					);

				lesCategoriesDons.add(uneCategorieDon);			
			}
			unStat.close();
			maConnexion.seDeconnecter();
			
		}
		catch (SQLException exp) {
			System.out.println("Erreur d'execution : " +req);
		}
		return lesCategoriesDons;
		
	}
	

/********************************* Gestion Projets_Carita******************************************************/



public static void insertProjetCarita (ProjetsCaritas unProjetCarita) {
	  String req = "insert into projets_carita values (null, '"+unProjetCarita.getTitre_p_car()+"','"+unProjetCarita.getDescrip_p_car()
	  +"','"+unProjetCarita.getDate_debut_p_car()+"','"+unProjetCarita.getDate_fin_p_car()+"','"+unProjetCarita.getId_assocarita()
	  +"','"+unProjetCarita.getId_cateproj()+"','"+unProjetCarita.getId_imagep()+"');";
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
public static ArrayList<ProjetsCaritas> selectAllProjetCarita(){
	String req ="select * from projets_carita;";
	ArrayList<ProjetsCaritas> lesProjetsCaritas = new ArrayList<ProjetsCaritas>();
	try {
		maConnexion.seConnecter();
		java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
		ResultSet desRes = unStat.executeQuery(req);
		while(desRes.next()) {
			ProjetsCaritas unProjetCarita =new ProjetsCaritas (
				    desRes.getInt("id_projetcar"),desRes.getInt("id_assocarita"),
				    desRes.getInt("id_cateproj"),desRes.getInt("id_imagep"),
				   desRes.getString("titre_p_car"),desRes.getString("descrip_p_car"),
				   desRes.getString("date_debut_p_car"),desRes.getString("date_fin_p_car")
				);

			lesProjetsCaritas.add(unProjetCarita);			
		}
		unStat.close();
		maConnexion.seDeconnecter();
		
	}
	catch (SQLException exp) {
		System.out.println("Erreur d'execution : " +req);
	}
	return lesProjetsCaritas;
	
}

 public static void deleteProjetCarita (int id_projetcar) {
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
 public static ProjetsCaritas selectWhereProjetCarita(int id_projetcar) {
	  
	  String req = " select * from projets_carita where id_projetcar=" +id_projetcar+";";
	  ProjetsCaritas unProjetCarita = null;
	  //System.out.println(req);
	  try {
		  maConnexion.seConnecter();
		  Statement unStat = maConnexion.getMaConnexion().createStatement();
		  ResultSet desRes = unStat.executeQuery(req);
		 
		  if(desRes.next()){
		  unProjetCarita= new ProjetsCaritas(
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
	  return unProjetCarita;
 }
 
 public static void updateProjetCarita(ProjetsCaritas unProjetCarita) {
	  String req = "update projets_carita set titre_p_car= '"+unProjetCarita.getTitre_p_car()
	  +"',descrip_p_car='"+unProjetCarita.getDescrip_p_car()+"',date_debut_p_car ='"+unProjetCarita.getDate_debut_p_car()
	  +"',date_fin_p_car ='"+unProjetCarita.getDate_fin_p_car()
	  +"',id_assocarita ='"+unProjetCarita.getId_assocarita()
	  +"',id_cateproj ='"+unProjetCarita.getId_cateproj()
	  +"',id_imagep ='"+unProjetCarita.getId_imagep()
	  + "' where id_projetcar ="+unProjetCarita.getId_projetcar()+";";
	  
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
public static ArrayList<ProjetsCaritas> selectLikeProjetCarita(String filtre){
	  String req = "select * from projets_carita where titre_p_car like'%"+filtre+"%' or descrip_p_car like '%"+filtre+"%' "
	  		+ "or date_debut_p_car like '%"+filtre+"%' "
	  	    + "or date_fin_p_car like '%"+filtre+"%' or id_assocarita like '%"+filtre+"%' "
	  	    + "or id_cateproj like '%"+filtre+"%' "
       + "or id_imagep like '%"+filtre+"%';";
	  ArrayList<ProjetsCaritas> lesProjetsCaritas = new ArrayList<ProjetsCaritas>();
	  try {
		  maConnexion.seConnecter();
		  Statement unStat = maConnexion.getMaConnexion().createStatement();
		  ResultSet desRes = unStat.executeQuery(req);
		  while(desRes.next()) {
		    ProjetsCaritas unProjetCarita= new ProjetsCaritas(
		    		desRes.getInt("id_projetcar"), 
		    		desRes.getInt("id_assocarita"), 
		    		desRes.getInt("id_cateproj"), 
		    		desRes.getInt("id_imagep"),
		    		desRes.getString("titre_p_car"),
		    		desRes.getString("descrip_p_car"), 
		    		desRes.getString("date_debut_p_car"),
		    		desRes.getString("date_fin_p_car")
		    		);
		    lesProjetsCaritas.add(unProjetCarita);
		  }
		  unStat.close();
		  maConnexion.seDeconnecter();
	  }
	    catch (SQLException exp) {
	    	System.out.println("Erreur d'execution:"+req);
	    }
	  return lesProjetsCaritas;  
}


public static ArrayList<VueProjetCaritas> selectAllVueProjetCaritas() {
    String req = "SELECT * FROM vueprojetcaritas;";
    ArrayList<VueProjetCaritas> lesProjetsCaritas = new ArrayList<VueProjetCaritas>();

    try {
        maConnexion.seConnecter();
        java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
        ResultSet desRes = unStat.executeQuery(req);

        while (desRes.next()) {
            VueProjetCaritas unProjetCarita = new VueProjetCaritas(
                desRes.getInt("id_projetcar"),
                desRes.getString("titre_p_car"),
                desRes.getString("descrip_p_car"),
                desRes.getString("date_debut_p_car"),
                desRes.getString("date_fin_p_car"),
                desRes.getString("nom_asso_carita"),
                desRes.getString("nom_cate_proj"),
                desRes.getString("nom_image_p")
            );

            lesProjetsCaritas.add(unProjetCarita);
        }

        unStat.close();
        maConnexion.seDeconnecter();

    } catch (SQLException exp) {
        System.out.println("Erreur d'execution : " + req);
    }

    return lesProjetsCaritas;
}

/********************************* Gestion Association_Carita******************************************************/

		public static ArrayList<AssociationCarita> selectAllAssociationCarita(){
			String req ="select * from asso_carita;";
				ArrayList<AssociationCarita> lesAssociationsCaritas = new ArrayList<AssociationCarita>();
				try {
					maConnexion.seConnecter();
					java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
					ResultSet desRes = unStat.executeQuery(req);
					while(desRes.next()) {
						AssociationCarita uneAssociationCarita =new AssociationCarita (
							    desRes.getInt("id_assocarita"),desRes.getString("nom_asso_carita"),
							   desRes.getString("descrip_asso_carita"),desRes.getString("pays_asso_carita"),
							   desRes.getString("adresse_asso_carita"),desRes.getString("email_asso_carita"),
							   desRes.getString("objectif_asso_carita")
							);
			
						lesAssociationsCaritas.add(uneAssociationCarita);			
					}
					unStat.close();
					maConnexion.seDeconnecter();
					
				}
				catch (SQLException exp) {
					System.out.println("Erreur d'execution : " +req);
				}
				return lesAssociationsCaritas;
				
			}
		
		
		
		
/********************************* Gestion Image_P******************************************************/
		
		public static ArrayList<ImageP> selectAllImagesP(){
			String req ="select * from images_p;";
			ArrayList<ImageP> lesImagesP = new ArrayList<ImageP>();
			try {
				maConnexion.seConnecter();
				java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
				ResultSet desRes = unStat.executeQuery(req);
				while(desRes.next()) {
					ImageP uneImageP =new ImageP (
						    desRes.getInt("id_imagep"),desRes.getInt("id_projetcar"),
						   desRes.getString("nom_image_p"),desRes.getString("chemin_image_p")
						);

					lesImagesP.add(uneImageP);			
				}
				unStat.close();
				maConnexion.seDeconnecter();
				
			}
			catch (SQLException exp) {
				System.out.println("Erreur d'execution : " +req);
			}
			return lesImagesP;
			
		}
		
		
/********************************* Gestion Catégorie Projet******************************************************/

		
		public static ArrayList<CategorieProjet> selectAllCategorieProjet(){
			String req ="select * from cate_projets;";
			ArrayList<CategorieProjet> lesCategoriesProjets= new ArrayList<CategorieProjet>();
			try {
				maConnexion.seConnecter();
				java.sql.Statement unStat = maConnexion.getMaConnexion().createStatement();
				ResultSet desRes = unStat.executeQuery(req);
				while(desRes.next()) {
					CategorieProjet uneCategorieProjet =new CategorieProjet (
						    desRes.getInt("id_cateproj"),
						   desRes.getString("nom_cate_proj"),desRes.getString("descrip_cate_proj")
						);

					lesCategoriesProjets.add(uneCategorieProjet);			
				}
				unStat.close();
				maConnexion.seDeconnecter();
				
			}
			catch (SQLException exp) {
				System.out.println("Erreur d'execution : " +req);
			}
			return lesCategoriesProjets;
			
		}
		

}
