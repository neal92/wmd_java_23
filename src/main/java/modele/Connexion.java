package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

private String serveur, bdd, user, mdp;
	
	private Connection maConnexion ;

	public Connexion(String serveur, String bdd, String user, String mdp) {
		super();
		this.serveur = serveur;
		this.bdd = bdd;
		this.user = user;
		this.mdp = mdp;
		this.maConnexion = null;
	} 
	
	public void chargePilote () {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch( ClassNotFoundException exp) {
			System.out.println("Erreur: chargement du driver.");
		}
	}
	
	public void seConnecter () {
		this.chargePilote();
		String url ="jdbc:mysql://"+this.serveur+"/"+this.bdd;
		try {
			this.maConnexion= DriverManager.getConnection(url, this.user, this.mdp);
		}
		catch(SQLException exp) {
			System.out.println("Erreur de conexion à la Base de donnée");
			exp.printStackTrace();
		}
	}
	
	public void seDeconnecter () {
		try {
			if (this.maConnexion!=null) {
				this.maConnexion.close();;
			}
		}
		catch (SQLException exp) 
		{ 
			System.out.println("Erreur de connexion à la Base de donnée");
		}
	
	
		}

	public Connection getMaConnexion() {
		return this.maConnexion;
	}
	}
