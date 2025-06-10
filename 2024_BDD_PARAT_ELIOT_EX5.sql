
-- Requête de modification de la quantité disponible d’un matériel

UPDATE Materiel
SET qteDispo = 50
WHERE idMateriel = 1;

-- Requête de modification de la quantité de tous les matériels qui sont en cours d'emprunt et la date de retour prévue dans plus de 2 jours.

UPDATE Materiel
SET qteDispo = qteDispo - 1
WHERE idMateriel IN (
    SELECT DISTINCT Reservation.idMateriel
    FROM Reservation
    WHERE Reservation.dateFin > CURRENT_DATE + INTERVAL '2 days'
    AND Reservation.dateDebut <= CURRENT_DATE
);
