package controleur;

public class Utilisateur {
	
	private int idutilisateur, id_role ; 
	private String nom, prenom, email, age, mdp_utilisateur, telephone, date_inscription ;
	
	public Utilisateur(int idutilisateur, int id_role, String date_inscription, String nom, String prenom, String email, String age, String mdp_utilisateur, String telephone)  {
		super();
		this.idutilisateur = idutilisateur;
		this.id_role = id_role;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.age = age;
		this.mdp_utilisateur = mdp_utilisateur;
		this.telephone = telephone;
		this.date_inscription = date_inscription;
		
	}

	public Utilisateur (String nom, String prenom, String email, String age, String mdp_utilisateur, String telephone, String date_inscription) {
		super();
		this.idutilisateur = 0;
		this.id_role = 0;
		this.nom = nom;
		this.prenom = prenom;
		this.email = email;
		this.age = age;
		this.mdp_utilisateur = mdp_utilisateur;
		this.telephone = telephone;
		this.date_inscription = date_inscription;
	}

	public int getIdutilisateur() {
		return idutilisateur;
	}

	public void setIdutilisateur(int idutilisateur) {
		this.idutilisateur = idutilisateur;
	}

	public int getId_role() {
		return id_role;
	}

	public void setId_role(int id_role) {
		this.id_role = id_role;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getMdp_utilisateur() {
		return mdp_utilisateur;
	}

	public void setMdp_utilisateur(String mdp_utilisateur) {
		this.mdp_utilisateur = mdp_utilisateur;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getDate_inscription() {
		return date_inscription;
	}

	
	public void setDate_inscription(String date_inscription) {
		this.date_inscription = date_inscription;
	}
	
	

}
