    -- Supprimer la base de données si elle existe
    DROP DATABASE IF EXISTS wmd_23;

    -- Créer la base de données wmd_23
    CREATE DATABASE wmd_23;

    -- Utiliser la base de données wmd_23
    USE wmd_23;

    -- Création de la table Catégories_Donnation
    CREATE TABLE cate_don (
        id_catedon INT AUTO_INCREMENT,
        nom_cate_don VARCHAR(255),
        descrip_cate_don VARCHAR(255),
        PRIMARY KEY (id_catedon)
    );

    -- Création de la table CategoriesProjets
    CREATE TABLE cate_projets (
        id_cateproj INT AUTO_INCREMENT,
        nom_cate_proj VARCHAR(255),
        descrip_cate_proj VARCHAR(255),
        PRIMARY KEY (id_cateproj)
    );

    -- Création de la table AssociationCaritatif
    CREATE TABLE asso_carita (
        id_assocarita INT AUTO_INCREMENT,
        nom_asso_carita VARCHAR(255),
        descrip_asso_carita VARCHAR(255),
        pays_asso_carita VARCHAR(255),
        adresse_asso_carita VARCHAR(255),
        email_asso_carita VARCHAR(255),
        objectif_asso_carita TEXT (2000),
        PRIMARY KEY (id_assocarita)
    );

    -- Création de la table ProjetsCaritatifs
    CREATE TABLE projets_carita (
        id_projetcar INT AUTO_INCREMENT,
        titre_p_car VARCHAR(255),
        descrip_p_car VARCHAR(255),
        date_debut_p_car DATE,
        date_fin_p_car DATE,
        id_assocarita INT,
        id_cateproj INT,
        id_imagep INT,
        PRIMARY KEY (id_projetcar),
        FOREIGN KEY (id_assocarita) REFERENCES asso_carita(id_assocarita),
        FOREIGN KEY (id_cateproj) REFERENCES cate_projets(id_cateproj)
    );

    -- Création de la table Image_P
    CREATE TABLE images_p (
        id_imagep INT AUTO_INCREMENT,
        nom_image_p VARCHAR(255),
        chemin_image_p VARCHAR(255),
        id_projetcar INT,
        PRIMARY KEY (id_imagep),
        FOREIGN KEY (id_projetcar) REFERENCES projets_carita(id_projetcar)
    );
    -- Alter Table sur la Table Projets_carita
    ALTER TABLE projets_carita
    ADD FOREIGN KEY (id_imagep) REFERENCES images_p(id_imagep);

    -- Création de la table Roles
    CREATE TABLE roles (
        id_role INT AUTO_INCREMENT,
        nom_role VARCHAR(255),
        PRIMARY KEY (id_role),
        UNIQUE (id_role)
    );

    -- Création de la table Utilisateurs
    CREATE TABLE utilisateurs (
        id_utilisateur INT AUTO_INCREMENT,
        nom VARCHAR(255),
        prenom VARCHAR(255),
        email VARCHAR(255) UNIQUE NOT NULL,
        age INT,
        mdp_utilisateur VARCHAR(255),
        telephone VARCHAR(255) UNIQUE NOT NULL,
        date_inscription DATETIME,
        id_role INT,
        PRIMARY KEY (id_utilisateur),
        FOREIGN KEY (id_role) REFERENCES roles(id_role)
    );

    -- Création de la table Evenements
    CREATE TABLE evenements (
        id_evenement INT AUTO_INCREMENT,
        nom_event VARCHAR(255),
        descrip_event VARCHAR(255),
        date_debut_event DATE,
        date_fin_event DATE,
        lieu_event VARCHAR(255),
        id_assocarita INT,
        id_imagep INT,
        PRIMARY KEY (id_evenement),
        FOREIGN KEY (id_assocarita) REFERENCES asso_carita(id_assocarita),
        FOREIGN KEY (id_imagep) REFERENCES images_p(id_imagep)
    );

    -- Création de la table Séjours
    CREATE TABLE sejours (
        id_sejour INT AUTO_INCREMENT,
        date_debut_sejour DATE,
        nb_places_dispo_sejour INT,
        station_sejour VARCHAR(255),
        prix_sejour DECIMAL(10, 2),
        PRIMARY KEY (id_sejour)
    );

    -- Création de la table Evaluations
    CREATE TABLE evaluations (
        id_evaluation INT AUTO_INCREMENT,
        id_sejour INT,
        note INT NOT NULL,
        commentaire VARCHAR(255) NOT NULL,
        date_evaluation DATE,
        id_utilisateur INT,
        PRIMARY KEY (id_evaluation),
        FOREIGN KEY (id_sejour) REFERENCES sejours(id_sejour),
        FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
    );

    -- Création de la table Reservations
    CREATE TABLE reservations (
        id_reservation INT AUTO_INCREMENT,
        id_sejour INT,
        id_utilisateur INT,
        date_reservation DATE,
        nb_personne INT,
        PRIMARY KEY (id_reservation),
        FOREIGN KEY (id_sejour) REFERENCES sejours(id_sejour),
        FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
    );

    -- Création de la table Paiements
    CREATE TABLE paiements (
        id_paiement INT AUTO_INCREMENT,
        montant_paie DECIMAL (10, 2),
        date_paie DATE,
        id_utilisateur INT,
        id_donnation INT,
        mode_paie VARCHAR(255),
        stat_paie VARCHAR(255),
        ref_paie VARCHAR(255),
        PRIMARY KEY (id_paiement),
        FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
    );

    -- Création de la table Donnations
    CREATE TABLE donnations (
        id_donnation INT AUTO_INCREMENT,
        montant_don DECIMAL(10, 2),
        date_don DATE,
        id_utilisateur INT,
        id_projetcar INT,
        id_catedon INT,
        id_imagep INT,
        PRIMARY KEY (id_donnation),
        FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur),
        FOREIGN KEY (id_projetcar) REFERENCES projets_carita(id_projetcar),
        FOREIGN KEY (id_catedon) REFERENCES cate_don (id_catedon),
        FOREIGN KEY (id_imagep) REFERENCES images_p(id_imagep)
    );

    -- Rajouter dans la table paiements la clé étrangère de la table donnation -- 
    ALTER TABLE paiements
    ADD FOREIGN KEY (id_donnation) REFERENCES donnations(id_donnation);


    -- Création de la table Activités
    CREATE TABLE activites (
        id_activite INT AUTO_INCREMENT,
        libelle_activite VARCHAR(255),
        nom_station_activite VARCHAR(255),
        prix_activite DECIMAL(10, 2),
        PRIMARY KEY (id_activite)
    );

    -- Création de la table Admin (la table enfant)
    CREATE TABLE admin (
        id_admin INT AUTO_INCREMENT,
        id_utilisateur INT,
        PRIMARY KEY (id_admin),
        FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
    );

    -- Création de la table Responsable (la table enfant)
    CREATE TABLE responsable (
        id_responsable INT AUTO_INCREMENT,
        id_assocarita INT,
        id_utilisateur INT,
        PRIMARY KEY (id_responsable),
        FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
    );

    -- Création de la table Activités_Séjours
    CREATE TABLE activites_sejours (
        id_activite INT,
        id_sejour INT,
        PRIMARY KEY (id_activite, id_sejour),
        FOREIGN KEY (id_activite) REFERENCES activites(id_activite),
        FOREIGN KEY (id_sejour) REFERENCES sejours(id_sejour)
    );


    --- Insert table Sejour ---
    INSERT INTO sejours (date_debut_sejour, nb_places_dispo_sejour, station_sejour, prix_sejour)
    VALUES
        ('2023-01-01', 10, 'Séjour A', 500.00),
        ('2023-02-02', 5, 'Séjour B', 300.50),
        ('2024-03-03', 8, 'Séjour C', 150.75),
        ('2023-04-04', 12, 'Séjour D', 299.99),
        ('2023-05-05', 4, 'Séjour E', 138.00),
        ('2023-06-06', 2, 'Séjour F', 284.00),
        ('2023-07-07', 20, 'Séjour G', 123.56),
        ('2023-08-08', 17, 'Séjour H', 218.40);


    -- Inséret table rôles --
    INSERT INTO roles (nom_role) VALUES ('Utilisateur');

    INSERT INTO roles (nom_role) VALUES ('Invité');

    INSERT INTO roles (nom_role) VALUES ('Modérateur');

    --Insert utilisateurs --
    INSERT INTO utilisateurs (nom, prenom, email, age, mdp_utilisateur, telephone, date_inscription, id_role)
    VALUES ('Doe', 'John', 'john.doe@example.com', 30, 'motdepasse123', '123456789', NOW(), 1);

    -- Insérer un autre utilisateur --
    INSERT INTO utilisateurs (nom, prenom, email, age, mdp_utilisateur, telephone, date_inscription, id_role)
    VALUES ('Smith', 'Jane', 'jane.smith@example.com', 25, 'mdp456', '987654321', NOW(), 2);

    -- Insérer un troisième utilisateur --
    INSERT INTO utilisateurs (nom, prenom, email, age, mdp_utilisateur, telephone, date_inscription, id_role)
    VALUES ('Martin', 'Luc', 'luc.martin@example.com', 40, 'monmotdepasse', '5551234567', NOW(), 1);

    INSERT INTO evaluations (id_sejour, id_utilisateur, note, commentaire, date_evaluation) 
    VALUES 
    (1, 1, 4, 'Très bon séjour !', '2023-12-15'),
    (2, 2, 5, 'Expérience formidable.', '2023-12-16'),
    (3, 3, 3, 'Peut être amélioré.', '2023-12-17');

   -- Insérer un asso_carita
   INSERT INTO asso_carita (nom_asso_carita, descrip_asso_carita, pays_asso_carita, adresse_asso_carita, email_asso_carita, objectif_asso_carita)
   VALUES
    ('Acting for life', 'Acting for Life est une ONG de solidarité internationale apolitique et non-confessionnelle fondée en 1973.', 'France', '40 Av. de l Europe', 'contact@acting-for-life.org', 'Objectif depuis près de 50 ans : lutter contre la pauvreté.'),
    ('Resto du coeur', 'Une association loi de 1901 à but non lucratif et reconnue.', 'France', '4 Cité Hauteville', 'contact@restosducoeur.org', 'Aider et apporter une assistance bénévole aux personnes démunies, notamment dans le domaine alimentaire avec la disposition des repas gratuits, et par la participation à leur insertion sociale et économique, ainsi que à toute action contre la pauvreté.'),
    ('Médecins sans Frontières (MSF)', 'une organisation non gouvernementale médicale humanitaire internationale française fondée en 1971 à Paris.', 'Suisse', 'Rte de Ferney 140', 'donateurs@paris.msf.org', 'Apporte une assistance médicale à des populations dont la vie ou la santé sont menacées, en France ou à ailleur.'),
    ('FAO', 'Organisation des Nations unies pour lalimentation et lagriculture est une organisation spécialisée du système des Nations unies, créée en 1945 à Québec', 'Italie', 'Viale delle Terme di Caracalla', 'Careers@fao.org', 'Atteindre la sécurité alimentaire pour tous et dassurer un accès régulier et suffisant à une nourriture de bonne qualité permettant à tous, de mener une vie saine et active'),
    ('Solidarité Eau Sud', 'Association humanitaire daide internationale pour le développement de laccès à une eau de qualité et lassainissement pour lamélioration des conditions de vie, notamment en Afrique et en Asie depuis 2004.', 'France', '8 All. des Amandiers', 'contact@solidarite-eau-sud.fr', 'La lutte contre la pollution la protection et la conservation des eaux superficielles et souterraines'),
    ('Caritas Habitat', 'Contribuer à la réponse à la crise du logement social et de lhébergement en France', 'France', '106 Rue du Bac', 'a@gmail.com', 'Caritas France sengage dans léconomie solidaire pour faire aboutir des opérations immobilières facilitant laccès aux logements à ceux qui en sont les plus éloignés'),
    ('Carita Feliz', 'La Fundación Carita Feliz contribue à briser le cycle de la pauvreté grâce à des programmes déducation intégrale denfants exclus', 'Colombie', '18A - 80, Cañaverales, Cali, Valle del Cauca', 'b@gmail.com', 'Objectif : assurer léducation, la protection et le développement des enfants marginalisés en Colombie');




    -- Inserer cate_don --
    INSERT INTO cate_don (nom_cate_don, descrip_cate_don) VALUES
    ('Annuels','Ce type de donnation  effectue tout les ans');

    INSERT INTO cate_don (nom_cate_don, descrip_cate_don) VALUES
    ('Mensuelle','Ce type de donnation  effectue tout les mois');


    --insert Activités-- 

    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité A1', 'Séjour A', 50.00);

    -- Pour Séjour  B
    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité B1', 'Séjour B', 70.00);

    -- Pour Séjour C
    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité C1', 'Séjour C', 45.00);

    -- Pour Séjour D
    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité D1', 'Séjour D', 80.00);

    -- Pour Séjour E
    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité E1', 'Séjour E', 90.00);

    -- Pour Séjour F
    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité F1', 'Séjour F', 100.00);

    -- Pour Séjour G
    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité G1', 'Séjour G', 35.00);

    -- Pour Séjour H
    INSERT INTO activites (libelle_activite, nom_station_activite, prix_activite) VALUES
    ('Activité H1', 'Séjour H', 125.00);

    --Inserer activite_sejours--
    INSERT INTO activites_sejours (id_activite, id_sejour) VALUES
    (1, 1);

    INSERT INTO activites_sejours (id_activite, id_sejour) VALUES
    (2, 2);

    INSERT INTO activites_sejours (id_activite, id_sejour) VALUES
    (3, 3);

    INSERT INTO activites_sejours (id_activite, id_sejour) VALUES
    (4, 4);

    INSERT INTO activites_sejours (id_activite, id_sejour) VALUES
    (5, 5);

    INSERT INTO activites_sejours (id_activite, id_sejour) VALUES
    (6, 6);


    -- Insert cate_projets --

    -- Aide humanitaire d'urgence
    INSERT INTO cate_projets (nom_cate_proj, descrip_cate_proj) VALUES
    ('Aide humanitaire', 'Aide urgente et ponctuelle mise en place lors d\'une situation de crise exceptionnelle ou de catastrophe naturelle.');

    -- Bénévolat
    INSERT INTO cate_projets (nom_cate_proj, descrip_cate_proj) VALUES
    ('Bénévolat', 'Aide alimentaire et assistance bénévole aux personnes démunies.');

    -- Santé
    INSERT INTO cate_projets (nom_cate_proj, descrip_cate_proj) VALUES
    ('Organisations médicales humanitaires', 'Fournir des soins médicaux d\'urgence et des services de santé dans des contextes de crises humanitaires.');

    -- Alimentation et agriculture
    INSERT INTO cate_projets (nom_cate_proj, descrip_cate_proj) VALUES
    ('Alimentation', 'Atteindre la sécurité alimentaire pour tous.');

    -- Eau et assainissement
    INSERT INTO cate_projets (nom_cate_proj, descrip_cate_proj) VALUES
    ('Eau et Assainissement', 'Lutte contre la pollution, la protection et la conservation des eaux.');

    -- Logement
    INSERT INTO cate_projets (nom_cate_proj, descrip_cate_proj) VALUES
    ('Logement', 'Facilitent laccès aux logements à ceux qui en sont les plus éloignés.');

    -- Education
    INSERT INTO cate_projets (nom_cate_proj, descrip_cate_proj) VALUES
    ('Education', 'Aider les enfants à avoir accès à une education scolaire');


    --Insert evenement

        INSERT INTO evenements (nom_event, descrip_event, date_debut_event, date_fin_event, lieu_event, id_assocarita, id_imagep) VALUES
        ('Event1', 'Description Event1', '2001-01-01', '2001-02-02', 'Lieu Event1', 1, null);

        INSERT INTO evenements (nom_event, descrip_event, date_debut_event, date_fin_event, lieu_event, id_assocarita, id_imagep) VALUES
        ('Event2', 'Description Event2', '2001-03-03', '2001-04-04', 'Lieu Event2', 2, null);

        INSERT INTO evenements (nom_event, descrip_event, date_debut_event, date_fin_event, lieu_event, id_assocarita, id_imagep) VALUES
        ('Event3', 'Description Event3', '2001-05-05', '2001-06-06', 'Lieu Event3', 3, null);

        INSERT INTO evenements (nom_event, descrip_event, date_debut_event, date_fin_event, lieu_event, id_assocarita, id_imagep) VALUES
        ('Event4', 'Description Event4', '2001-07-07', '2001-08-08', 'Lieu Event4', 4, null);

        INSERT INTO evenements (nom_event, descrip_event, date_debut_event, date_fin_event, lieu_event, id_assocarita, id_imagep) VALUES
        ('Event5', 'Description Event5', '2001-09-09', '2001-10-10', 'Lieu Event5', 5, null);


   -- Insert projet_carita
    INSERT INTO projets_carita (titre_p_car, descrip_p_car, date_debut_p_car, date_fin_p_car, id_assocarita, id_cateproj, id_imagep)
    VALUES ('MADE-M', 'La réalisation de nouveaux modules de formation en bâti traditionnel, permet de renforcer la formation des maçons formés au Mali', '2015-01-01', NOW(), 1, 7, null);


    --Insert reservations
    INSERT INTO reservations (id_sejour, id_utilisateur, date_reservation, nb_personne) VALUES
    (1, 1, '2004-01-01', 5);

    INSERT INTO reservations (id_sejour, id_utilisateur, date_reservation, nb_personne) VALUES
    (2, 2, '2004-02-02', 3);

    INSERT INTO reservations (id_sejour, id_utilisateur, date_reservation, nb_personne) VALUES
    (3, 3, '2004-02-03', 4);

