package controleur;

public class CategorieProjet {
	
	private int id_cateproj;
	private String nom_cate_proj, descrip_cate_proj;
	
	
	public CategorieProjet(int id_cateproj, String nom_cate_proj, String descrip_cate_proj) {
		super();
		this.id_cateproj = id_cateproj;
		this.nom_cate_proj = nom_cate_proj;
		this.descrip_cate_proj = descrip_cate_proj;
	}
	
	public CategorieProjet(String nom_cate_proj, String descrip_cate_proj) {
		super();
		this.id_cateproj = 0;
		this.nom_cate_proj = nom_cate_proj;
		this.descrip_cate_proj = descrip_cate_proj;
	}

	public int getId_cateproj() {
		return id_cateproj;
	}

	public void setId_cateproj(int id_cateproj) {
		this.id_cateproj = id_cateproj;
	}

	public String getNom_cate_proj() {
		return nom_cate_proj;
	}

	public void setNom_cate_proj(String nom_cate_proj) {
		this.nom_cate_proj = nom_cate_proj;
	}

	public String getDescrip_cate_proj() {
		return descrip_cate_proj;
	}

	public void setDescrip_cate_proj(String descrip_cate_proj) {
		this.descrip_cate_proj = descrip_cate_proj;
	}
	
	

}
