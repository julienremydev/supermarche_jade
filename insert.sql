
/* departement a refaire 
region a refaire 
id a modifier + attributs a ajouter 
(nb communes, nb communes ZRR, nb communes AFR*/


/* PIB */



	CREATE TABLE IF NOT EXISTS PIB (
	id_pib INT PRIMARY KEY NOT NULL,
	pib_habitant INT,
	pib_emploi INT,
	id_region INT,
	annee INT,
	FOREIGN KEY (id_region) REFERENCES Region(id_region),
	FOREIGN KEY (annee) REFERENCES Temps(annee)
	)COLLATE="utf8_general_ci";

CREATE TABLE IF NOT EXISTS Temps (
annee DATE PRIMARY KEY NOT NULL
);

/*id_revenu auto generate*/
CREATE TABLE IF NOT EXISTS Revenu (
id_revenu INT PRIMARY KEY NOT NULL,
revenu_annuel INT,
id_region INT,
annee INT,
FOREIGN KEY (id_region) REFERENCES Region(id_region),
FOREIGN KEY (annee) REFERENCES Temps(annee)
);

/*id_pop auto generate*/
CREATE TABLE IF NOT EXISTS Population (
id_pop INT PRIMARY KEY NOT NULL,
nb_habitants INT,
sexe VARCHAR(10),
tranche_age VARCHAR(100),
id_departement CHAR(2),
annee INT,
FOREIGN KEY (id_departement) REFERENCES Departement(id_departement),
FOREIGN KEY (annee) REFERENCES Temps(annee)
);

CREATE TABLE IF NOT EXISTS Tourisme (
id_tourisme INT PRIMARY KEY NOT NULL,
nb_touriste INT,
id_region INT,
annee INT,
FOREIGN KEY (id_region) REFERENCES Region(id_region),
FOREIGN KEY (annee) REFERENCES Temps(annee)
)
COLLATE="utf8_general_ci";

CREATE TABLE IF NOT EXISTS SecteurActivite (
nom_secteur VARCHAR(100) PRIMARY KEY NOT NULL
)COLLATE="utf8_general_ci";

CREATE TABLE IF NOT EXISTS ActiviteCommerce (
nom_activite VARCHAR(100) PRIMARY KEY NOT NULL,
nb_commerce INT,
id_departement CHAR(2),
FOREIGN KEY (id_departement) REFERENCES Departement(id_departement)
)COLLATE="utf8_general_ci";


CREATE TABLE IF NOT EXISTS Emploi (
id_emploi INT PRIMARY KEY NOT NULL,
nb_emploi INT,
id_departement CHAR(2),
nom_secteur VARCHAR(100),
annee INT,
FOREIGN KEY (annee) REFERENCES Temps(annee),
FOREIGN KEY (id_departement) REFERENCES Departement(id_departement),
FOREIGN KEY (nom_secteur) REFERENCES SecteurActivite(nom_secteur)
)COLLATE="utf8_general_ci";

CREATE TABLE IF NOT EXISTS PerenniteMotivation (
id_peren_motivation INT PRIMARY KEY NOT NULL,
motivation VARCHAR(256),
nb_entreprises_creees INT,
tx_1an INT,
tx_2an INT,
tx_3an INT
)COLLATE="utf8_general_ci";

CREATE TABLE IF NOT EXISTS PerenniteSecteur (
id_peren_secteur INT PRIMARY KEY NOT NULL,
nom_secteur VARCHAR(100),
nb_entreprises_creees INT,
tx_1an INT,
tx_2an INT,
tx_3an INT,
FOREIGN KEY (nom_secteur) REFERENCES SecteurActivite(nom_secteur)
)COLLATE="utf8_general_ci";

CREATE TABLE IF NOT EXISTS PerenniteAge (
id_peren_age INT PRIMARY KEY NOT NULL,
tranche_age VARCHAR(100),
nb_entreprises_creees INT,
tx_1an INT,
tx_2an INT,
tx_3an INT
)COLLATE="utf8_general_ci";