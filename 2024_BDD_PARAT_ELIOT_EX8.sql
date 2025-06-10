-- Mettez à jour le modèle de données existant en ajoutant une nouvelle table "disponibilite" avec les colonnes suivantes :
--    id_disponibilite (clé primaire)
--    id_materiel (clé étrangère référençant la table "materiel")
--    date_debut (date de début de la disponibilité)
--    date_fin (date de fin de la disponibilité)

CREATE TABLE Disponibilite(
   idDisponibilite SERIAL,
   dateDebut DATE,
   dateFin DATE,
   idMateriel INTEGER NOT NULL,
   PRIMARY KEY(idDisponibilite),
   FOREIGN KEY(idMateriel) REFERENCES Materiel(idMateriel)
);

-- Modifiez la table "reservation" en ajoutant une nouvelle colonne "id_disponibilite" (clé étrangère référençant la table "disponibilite").
-- Modifiez les contraintes SQL existantes pour prendre en compte les contraintes de disponibilité lors de la création et de la mise à jour des réservations

ALTER TABLE reservation
ADD COLUMN idDisponibilite INTEGER,
ADD CONSTRAINT fkDisponibilite
    FOREIGN KEY (idDisponibilite) REFERENCES disponibilite(idDisponibilite);

-- Implémentez une fonctionnalité permettant de vérifier la disponibilité d'un matériel pour une période donnée avant de permettre la réservation. Si le matériel n'est pas disponible, affichez un message d'erreur approprié.

SELECT
    materiel.idMateriel,
    Materiel.nom,
    -- On commence une expression conditionnelle (CASE) pour retourner 'OK' si une disponibilité existe selon les critères, sinon 'KO'.
    CASE 
        WHEN EXISTS (
            -- on regarde dans la table Disponibilite s'il existe au moins une plage de disponibilité pour ce matériel.
            SELECT 1
            FROM Disponibilite
            WHERE Disponibilite.idMateriel = Materiel.idMateriel
              AND '2025-05-13' >= Disponibilite.dateDebut
              AND '2025-05-14' <= Disponibilite.dateFin
              -- On verifie que cette disponibilité n’est pas déjà réservé pour la période demandée.
              AND NOT EXISTS (
                  SELECT 1
                  FROM Reservation
                  WHERE Reservation.idDisponibilite = Disponibilite.idDisponibilite
                    AND ('2025-05-13', '2025-05-14') OVERLAPS (Reservation.dateDebut, Reservation.dateFin)
              )
        )
        THEN 'OK'
        ELSE 'KO'
    END AS statut_disponibilite
FROM Materiel
WHERE Materiel.idMateriel = 5;


-- Implémentez une fonctionnalité permettant de gérer les disponibilités du matériel. Les administrateurs doivent pouvoir ajouter, modifier et supprimer des périodes de disponibilité pour chaque matériel.


-- Testez votre application en effectuant des réservations avec différentes périodes pour vérifier que les contraintes de disponibilité sont correctement appliquées. En ayant utilisé le Query ajouter_disponibilite au dessus et en executant le query ci dessous on obtient bien un retour OK

SELECT 
    m.idMateriel,
    m.nom,
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM Disponibilite d
            WHERE d.idMateriel = m.idMateriel
              AND '2025-06-02 09:00:00' >= d.dateDebut
              AND '2025-06-09 09:00:00' <= d.dateFin
              AND NOT EXISTS (
                  SELECT 1
                  FROM Reservation r
                  WHERE r.idDisponibilite = d.idDisponibilite
                    AND ('2025-06-02 09:00:00', '2025-06-09 09:00:00') OVERLAPS (r.dateDebut, r.dateFin)
              )
        )
        THEN 'OK'
        ELSE 'KO'
    END AS statut_disponibilite
FROM Materiel m
WHERE m.idMateriel = 1;