package controleur;

public class ImageP {
	private int id_imagep, id_projetcar;
	private String nom_image_p, chemin_image_p;
	
	public ImageP(int id_imagep, int id_projetcar, String nom_image_p, String chemin_image_p) {
		super();
		this.id_imagep = id_imagep;
		this.id_projetcar = id_projetcar;
		this.nom_image_p = nom_image_p;
		this.chemin_image_p = chemin_image_p;
	}
	
	public ImageP (String nom_image_p, String chemin_image_p) {
		super();
		this.id_imagep = 0;
		this.id_projetcar = 0;
		this.nom_image_p = nom_image_p;
		this.chemin_image_p = chemin_image_p;
	}

	public int getId_imagep() {
		return id_imagep;
	}

	public void setId_imagep(int id_imagep) {
		this.id_imagep = id_imagep;
	}

	public int getId_projetcar() {
		return id_projetcar;
	}

	public void setId_projetcar(int id_projetcar) {
		this.id_projetcar = id_projetcar;
	}

	public String getNom_image_p() {
		return nom_image_p;
	}

	public void setNom_image_p(String nom_image_p) {
		this.nom_image_p = nom_image_p;
	}

	public String getChemin_image_p() {
		return chemin_image_p;
	}

	public void setChemin_image_p(String chemin_image_p) {
		this.chemin_image_p = chemin_image_p;
	}
	
	

}
