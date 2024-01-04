package controleur;

public class CategorieDon {
	private int id_catedon ; 
	private String nom_cate_don ; 
	private String descrip_cate_don ;
	
	public CategorieDon(int id_catedon, String nom_cate_don, String descrip_cate_don) {
		super();
		this.id_catedon = id_catedon;
		this.nom_cate_don = nom_cate_don;
		this.descrip_cate_don = descrip_cate_don;
	} 
	
	public CategorieDon(String nom_cate_don, String descrip_cate_don) {
		super();
		this.id_catedon = 0;
		this.nom_cate_don = nom_cate_don;
		this.descrip_cate_don = descrip_cate_don;
	}
	
	
	public int getId_catedon() {
		return id_catedon;
	}
	public void setId_catedon(int id_catedon) {
		this.id_catedon = id_catedon;
	}
	public String getNom_cate_don() {
		return nom_cate_don;
	}
	public void setNom_cate_don(String nom_cate_don) {
		this.nom_cate_don = nom_cate_don;
	}
	public String getDescrip_cate_don() {
		return descrip_cate_don;
	}
	public void setDescrip_cate_don(String descrip_cate_don) {
		this.descrip_cate_don = descrip_cate_don;
	} 
	
}
