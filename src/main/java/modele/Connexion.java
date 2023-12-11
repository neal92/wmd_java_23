package modele;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connexion {

    private String serveur, bdd, user, mdp;
    private Connection maConnexion;

    public Connexion(String serveur, String bdd, String user, String mdp) {
        this.serveur = serveur;
        this.bdd = bdd;
        this.user = user;
        this.mdp = mdp;
        this.maConnexion = null;
    }

    public void chargePilote() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Utilisez le pilote JDBC pour MySQL 8
        } catch (ClassNotFoundException exp) {
            System.out.println("Erreur: chargement du driver.");
            exp.printStackTrace();
        }
    }

    public void seConnecter() {
        this.chargePilote();
        String url = "jdbc:mysql://" + this.serveur + "/" + this.bdd + "?useSSL=false&serverTimezone=UTC";
        try {
            this.maConnexion = DriverManager.getConnection(url, this.user, this.mdp);
        } catch (SQLException exp) {
            System.out.println("Erreur de connexion à la base de données");
            exp.printStackTrace();
        }
    }

    public void seDeconnecter() {
        try {
            if (this.maConnexion != null && !this.maConnexion.isClosed()) {
                this.maConnexion.close();
            }
        } catch (SQLException exp) {
            System.out.println("Erreur lors de la déconnexion de la base de données");
            exp.printStackTrace();
        }
    }

    public Connection getMaConnexion() {
        return this.maConnexion;
    }
}
