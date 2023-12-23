package controleur;

public class AssociationCarita {
	private int id_assocarita;
	private String nom_asso_carita, descrip_asso_carita, pays_asso_carita, adresse_asso_carita, email_asso_carita,
	objectif_asso_carita;
	
	public AssociationCarita(int id_assocarita, String nom_asso_carita, String descrip_asso_carita,
			String pays_asso_carita, String adresse_asso_carita, String email_asso_carita,
			String objectif_asso_carita) {
		super();
		this.id_assocarita = id_assocarita;
		this.nom_asso_carita = nom_asso_carita;
		this.descrip_asso_carita = descrip_asso_carita;
		this.pays_asso_carita = pays_asso_carita;
		this.adresse_asso_carita = adresse_asso_carita;
		this.email_asso_carita = email_asso_carita;
		this.objectif_asso_carita = objectif_asso_carita;
	}
	
	
	public AssociationCarita(String nom_asso_carita, String descrip_asso_carita,
			String pays_asso_carita, String adresse_asso_carita, String email_asso_carita,
			String objectif_asso_carita) {
		super();
		this.id_assocarita = 0;
		this.nom_asso_carita = nom_asso_carita;
		this.descrip_asso_carita = descrip_asso_carita;
		this.pays_asso_carita = pays_asso_carita;
		this.adresse_asso_carita = adresse_asso_carita;
		this.email_asso_carita = email_asso_carita;
		this.objectif_asso_carita = objectif_asso_carita;
	}


	public int getId_assocarita() {
		return id_assocarita;
	}


	public void setId_assocarita(int id_assocarita) {
		this.id_assocarita = id_assocarita;
	}


	public String getNom_asso_carita() {
		return nom_asso_carita;
	}


	public void setNom_asso_carita(String nom_asso_carita) {
		this.nom_asso_carita = nom_asso_carita;
	}


	public String getDescrip_asso_carita() {
		return descrip_asso_carita;
	}


	public void setDescrip_asso_carita(String descrip_asso_carita) {
		this.descrip_asso_carita = descrip_asso_carita;
	}


	public String getPays_asso_carita() {
		return pays_asso_carita;
	}


	public void setPays_asso_carita(String pays_asso_carita) {
		this.pays_asso_carita = pays_asso_carita;
	}


	public String getAdresse_asso_carita() {
		return adresse_asso_carita;
	}


	public void setAdresse_asso_carita(String adresse_asso_carita) {
		this.adresse_asso_carita = adresse_asso_carita;
	}


	public String getEmail_asso_carita() {
		return email_asso_carita;
	}


	public void setEmail_asso_carita(String email_asso_carita) {
		this.email_asso_carita = email_asso_carita;
	}


	public String getObjectif_asso_carita() {
		return objectif_asso_carita;
	}


	public void setObjectif_asso_carita(String objectif_asso_carita) {
		this.objectif_asso_carita = objectif_asso_carita;
	}
	
	
	

}
