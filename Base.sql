#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Utilisateur
#------------------------------------------------------------

CREATE TABLE Utilisateur(
        idUtilisateur          Int  Auto_increment  NOT NULL ,
        motdepasseUtilisateur  Varchar (50) NOT NULL ,
        identifiantUtilisateur Varchar (50) NOT NULL
	,CONSTRAINT Utilisateur_PK PRIMARY KEY (idUtilisateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Personne
#------------------------------------------------------------

CREATE TABLE Personne(
        identifiant Int  Auto_increment  NOT NULL ,
        nom         Varchar (50) NOT NULL ,
        prenom      Varchar (50) NOT NULL ,
        mail        Int NOT NULL
	,CONSTRAINT Personne_PK PRIMARY KEY (identifiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Particulier
#------------------------------------------------------------

CREATE TABLE Particulier(
        identifiant        Int NOT NULL ,
        siteWebParticulier Varchar (50) NOT NULL ,
        nom                Varchar (50) NOT NULL ,
        prenom             Varchar (50) NOT NULL ,
        mail               Int NOT NULL
	,CONSTRAINT Particulier_PK PRIMARY KEY (identifiant)

	,CONSTRAINT Particulier_Personne_FK FOREIGN KEY (identifiant) REFERENCES Personne(identifiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: T�l�phone
#------------------------------------------------------------

CREATE TABLE Telephone(
        numeroTel   Int NOT NULL ,
        typeTel     Varchar (20) NOT NULL ,
        identifiant Int NOT NULL
	,CONSTRAINT Telephone_PK PRIMARY KEY (numeroTel)

	,CONSTRAINT Telephone_Personne_FK FOREIGN KEY (identifiant) REFERENCES Personne(identifiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Adresse
#------------------------------------------------------------

CREATE TABLE Adresse(
        idAdresse          Int  Auto_increment  NOT NULL ,
        adresseParticulier Varchar (50) NOT NULL ,
        adressePro         Varchar (50) NOT NULL ,
        adresseEntreprise  Varchar (50) NOT NULL ,
        codePostal         Int NOT NULL ,
        numeroRue          Int NOT NULL ,
        rue                Varchar (50) NOT NULL ,
        etage              Varchar (50) NOT NULL ,
        ville              Varchar (50) NOT NULL
	,CONSTRAINT Adresse_PK PRIMARY KEY (idAdresse)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Professionnel
#------------------------------------------------------------

CREATE TABLE Professionnel(
        identifiant Int NOT NULL ,
        siteWebPro  Varchar (50) NOT NULL ,
        nom         Varchar (50) NOT NULL ,
        prenom      Varchar (50) NOT NULL ,
        mail        Int NOT NULL
	,CONSTRAINT Professionnel_PK PRIMARY KEY (identifiant)

	,CONSTRAINT Professionnel_Personne_FK FOREIGN KEY (identifiant) REFERENCES Personne(identifiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Entreprise
#------------------------------------------------------------

CREATE TABLE Entreprise(
        identifiantEntreprise Int  Auto_increment  NOT NULL ,
        nomEntreprise         Varchar (50) NOT NULL ,
        mailEntreprise        Varchar (50) NOT NULL ,
        adresseEntreprise     Varchar (50) NOT NULL ,
        numeroSIRET           Int NOT NULL ,
        numeroTVA             Int NOT NULL ,
        numeroInscription     Int NOT NULL ,
        siteWebEntreprise     Varchar (50) NOT NULL ,
        identifiant           Int NOT NULL
	,CONSTRAINT Entreprise_PK PRIMARY KEY (identifiantEntreprise)

	,CONSTRAINT Entreprise_Professionnel_FK FOREIGN KEY (identifiant) REFERENCES Professionnel(identifiant)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Habiter
#------------------------------------------------------------

CREATE TABLE Habiter(
        identifiant Int NOT NULL ,
        idAdresse   Int NOT NULL
	,CONSTRAINT Habiter_PK PRIMARY KEY (identifiant,idAdresse)

	,CONSTRAINT Habiter_Personne_FK FOREIGN KEY (identifiant) REFERENCES Personne(identifiant)
	,CONSTRAINT Habiter_Adresse0_FK FOREIGN KEY (idAdresse) REFERENCES Adresse(idAdresse)
)ENGINE=InnoDB;

