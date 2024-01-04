package controleur;

public class VueProjetCaritas {
	private int id_projetcar;
	private String titre_p_car, descrip_p_car, date_debut_p_car, date_fin_p_car;
	private String nom_asso_carita, nom_cate_proj, nom_image_p;
	
	
	public VueProjetCaritas(int id_projetcar, String titre_p_car, String descrip_p_car, String date_debut_p_car,
			String date_fin_p_car, String nom_asso_carita, String nom_cate_proj, String nom_image_p) {
		super();
		this.id_projetcar = id_projetcar;
		this.titre_p_car = titre_p_car;
		this.descrip_p_car = descrip_p_car;
		this.date_debut_p_car = date_debut_p_car;
		this.date_fin_p_car = date_fin_p_car;
		this.nom_asso_carita = nom_asso_carita;
		this.nom_cate_proj = nom_cate_proj;
		this.nom_image_p = nom_image_p;
	}
	
	public VueProjetCaritas(String titre_p_car, String descrip_p_car, String date_debut_p_car,
			String date_fin_p_car, String nom_asso_carita, String nom_cate_proj, String nom_image_p) {
		super();
		this.id_projetcar = 0;
		this.titre_p_car = titre_p_car;
		this.descrip_p_car = descrip_p_car;
		this.date_debut_p_car = date_debut_p_car;
		this.date_fin_p_car = date_fin_p_car;
		this.nom_asso_carita = nom_asso_carita;
		this.nom_cate_proj = nom_cate_proj;
		this.nom_image_p = nom_image_p;
	}

	public int getId_projetcar() {
		return id_projetcar;
	}

	public void setId_projetcar(int id_projetcar) {
		this.id_projetcar = id_projetcar;
	}

	public String getTitre_p_car() {
		return titre_p_car;
	}

	public void setTitre_p_car(String titre_p_car) {
		this.titre_p_car = titre_p_car;
	}

	public String getDescrip_p_car() {
		return descrip_p_car;
	}

	public void setDescrip_p_car(String descrip_p_car) {
		this.descrip_p_car = descrip_p_car;
	}

	public String getDate_debut_p_car() {
		return date_debut_p_car;
	}

	public void setDate_debut_p_car(String date_debut_p_car) {
		this.date_debut_p_car = date_debut_p_car;
	}

	public String getDate_fin_p_car() {
		return date_fin_p_car;
	}

	public void setDate_fin_p_car(String date_fin_p_car) {
		this.date_fin_p_car = date_fin_p_car;
	}

	public String getNom_asso_carita() {
		return nom_asso_carita;
	}

	public void setNom_asso_carita(String nom_asso_carita) {
		this.nom_asso_carita = nom_asso_carita;
	}

	public String getNom_cate_proj() {
		return nom_cate_proj;
	}

	public void setNom_cate_proj(String nom_cate_proj) {
		this.nom_cate_proj = nom_cate_proj;
	}

	public String getNom_image_p() {
		return nom_image_p;
	}

	public void setNom_image_p(String nom_image_p) {
		this.nom_image_p = nom_image_p;
	}
	
	

	
	
}
