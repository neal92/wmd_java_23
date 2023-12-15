package controleur;

public class VueDonnation {
		private int id_donnation, id_utilisateur, id_projetcar, id_catedon, id_imagep,id_assocarita;
		private String montant_don, date_don;
		private String nom, prenom; 
		private String nomproj, nomdon, nomimage, nom_asso_carita;
		
		public VueDonnation(int id_donnation, int id_utilisateur, int id_projetcar, int id_catedon, int id_imagep,
				int id_assocarita,
				String montant_don, String date_don, String nom, String prenom, String nomproj, String nomdon,
				String nomimage, String nom_asso_carita) {
			super();
			this.id_donnation = id_donnation;
			this.id_utilisateur = id_utilisateur;
			this.id_projetcar = id_projetcar;
			this.id_catedon = id_catedon;
			this.id_imagep = id_imagep;
			this.id_assocarita =id_assocarita;
			this.montant_don = montant_don;
			this.date_don = date_don;
			this.nom = nom;
			this.prenom = prenom;
			this.nomproj = nomproj;
			this.nomdon = nomdon;
			this.nomimage = nomimage;
			this.nom_asso_carita = nom_asso_carita;
		}
		
		public VueDonnation( int id_utilisateur, int id_projetcar, int id_catedon, int id_imagep, int id_assocarita,
				String montant_don, String date_don, String nom, String prenom, String nomproj, String nomdon,
				String nomimage, String nom_asso_carita) {
			super();
			this.id_donnation = 0; 
			this.id_utilisateur = id_utilisateur;
			this.id_projetcar = id_projetcar;
			this.id_catedon = id_catedon;
			this.id_imagep = id_imagep;
			this.id_assocarita = id_assocarita;
			this.montant_don = montant_don;
			this.date_don = date_don;
			this.nom = nom;
			this.prenom = prenom;
			this.nomproj = nomproj;
			this.nomdon = nomdon;
			this.nomimage = nomimage;
			this.nom_asso_carita = nom_asso_carita;
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

		public int getId_assocarita() {
			return id_assocarita;
		}

		public void setId_assocarita(int id_assocarita) {
			this.id_assocarita = id_assocarita;
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

		public String getNomproj() {
			return nomproj;
		}

		public void setNomproj(String nomproj) {
			this.nomproj = nomproj;
		}

		public String getNomdon() {
			return nomdon;
		}

		public void setNomdon(String nomdon) {
			this.nomdon = nomdon;
		}

		public String getNomimage() {
			return nomimage;
		}

		public void setNomimage(String nomimage) {
			this.nomimage = nomimage;
		}

		public String getNom_asso_carita() {
			return nom_asso_carita;
		}

		public void setNom_asso_carita(String nom_asso_carita) {
			this.nom_asso_carita = nom_asso_carita;
		}

		
		}
