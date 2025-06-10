
-- Requête de suppression d’une réservation existante

DELETE FROM employes
WHERE id = 5;

-- Requête de suppression d'une réservation ou la date de retour prévue est passée.

DELETE FROM reservation
WHERE datefin < CURRENT_DATE;
