-- Mettez à jour le modèle de données existant en ajoutant une nouvelle table "disponibilite" avec les colonnes suivantes :
--    id_disponibilite (clé primaire)
--    id_materiel (clé étrangère référençant la table "materiel")
--    date_debut (date de début de la disponibilité)
--    date_fin (date de fin de la disponibilité)

CREATE TABLE Disponibilite(
   id_disponibilite SERIAL,
   date_debut DATE,
   date_fin DATE,
   id_materiel INTEGER NOT NULL,
   PRIMARY KEY(id_disponibilite),
   FOREIGN KEY(id_materiel) REFERENCES Materiel(materialid)
);

-- Modifiez la table "reservation" en ajoutant une nouvelle colonne "id_disponibilite" (clé étrangère référençant la table "disponibilite").

ALTER TABLE reservation
ADD COLUMN id_disponibilite INTEGER,
ADD CONSTRAINT fk_disponibilite
    FOREIGN KEY (id_disponibilite) REFERENCES disponibilite(id_disponibilite);