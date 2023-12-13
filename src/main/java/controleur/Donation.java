package controleur;

import java.sql.Date;

public class Donation {
	private int id_donnation, id_utilisateur, id_projetcar, id_catedon, id_imagep;
	private String montant_don, date_don;
	
	public Donation(int id_donnation,int id_utilisateur,int id_projetcar,int id_catedon,int id_imagep, String montant_don, String date_don) {
		super();
		this.id_donnation = id_donnation;
		this.id_utilisateur = id_utilisateur;
		this.id_projetcar = id_projetcar;
		this.id_catedon = id_catedon;
		this.id_imagep = id_imagep;
		this.montant_don = montant_don;
		this.date_don = date_don;
	}
	
	public Donation(int id_utilisateur,int id_projetcar,int id_catedon,int id_imagep, String montant_don, String date_don) {
		super();
		this.id_donnation = 0;
		this.id_utilisateur = id_utilisateur;
		this.id_projetcar = id_projetcar;
		this.id_catedon = id_catedon;
		this.id_imagep = id_imagep;
		this.montant_don = montant_don;
		this.date_don = date_don;
	}
	
	public Donation (String montant_don, String date_don) {
		super();
		this.id_donnation = 0;
		this.id_utilisateur = 0;
		this.id_projetcar = 0;
		this.id_catedon = 0;
		this.id_imagep = 0;
		this.montant_don = montant_don;
		this.date_don = date_don;
	}

	public int getId_donnation() {
		return id_donnation;
	}

	public void setId_donnation(int id_donnation) {
		this.id_donnation = id_donnation;
	}

	public int getId_utilisateur() {
		return id_utilisateur;
	}

	public void setId_utilisateur(int id_utilisateur) {
		this.id_utilisateur = id_utilisateur;
	}

	public int getId_projetcar() {
		return id_projetcar;
	}

	public void setId_projetcar(int id_projetcar) {
		this.id_projetcar = id_projetcar;
	}

	public int getId_catedon() {
		return id_catedon;
	}

	public void setId_catedon(int id_catedon) {
		this.id_catedon = id_catedon;
	}

	public int getId_imagep() {
		return id_imagep;
	}

	public void setId_imagep(int id_imagep) {
		this.id_imagep = id_imagep;
	}

	public String getMontant_don() {
		return montant_don;
	}

	public void setMontant_don(String montant_don) {
		this.montant_don = montant_don;
	}

	public String getDate_don() {
		return date_don;
	}

	public void setDate_don(String date_don) {
		this.date_don = date_don;
	}
	

}
