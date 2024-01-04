package controleur;

   public class ProjetsCaritas {
			private int id_projetcar, id_assocarita, id_cateproj, id_imagep;
			private String titre_p_car, descrip_p_car, date_debut_p_car, date_fin_p_car;
			
	
	
   public ProjetsCaritas(int id_projetcar, int id_assocarita, int id_cateproj, int id_imagep, String titre_p_car,
			String descrip_p_car, String date_debut_p_car, String date_fin_p_car) {
	   
		super();
		this.id_projetcar = id_projetcar;
		this.id_assocarita = id_assocarita;
		this.id_cateproj = id_cateproj;
		this.id_imagep = id_imagep;
		this.titre_p_car = titre_p_car;
		this.descrip_p_car = descrip_p_car;
		this.date_debut_p_car = date_debut_p_car;
		this.date_fin_p_car = date_fin_p_car;
	}
	
   public ProjetsCaritas(int id_assocarita, int id_cateproj, int id_imagep, String titre_p_car,
			String descrip_p_car, String date_debut_p_car, String date_fin_p_car) {
	   
		super();
		this.id_projetcar = 0;
		this.id_assocarita = id_assocarita;
		this.id_cateproj = id_cateproj;
		this.id_imagep = id_imagep;
		this.titre_p_car = titre_p_car;
		this.descrip_p_car = descrip_p_car;
		this.date_debut_p_car = date_debut_p_car;
		this.date_fin_p_car = date_fin_p_car;
	}

	public int getId_projetcar() {
		return id_projetcar;
	}
	
	public void setId_projetcar(int id_projetcar) {
		this.id_projetcar = id_projetcar;
	}
	
	public int getId_assocarita() {
		return id_assocarita;
	}
	
	public void setId_assocarita(int id_assocarita) {
		this.id_assocarita = id_assocarita;
	}
	
	public int getId_cateproj() {
		return id_cateproj;
	}
	
	public void setId_cateproj(int id_cateproj) {
		this.id_cateproj = id_cateproj;
	}
	
	public int getId_imagep() {
		return id_imagep;
	}
	
	public void setId_imagep(int id_imagep) {
		this.id_imagep = id_imagep;
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

}
