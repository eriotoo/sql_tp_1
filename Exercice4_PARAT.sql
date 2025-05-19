-- Requête d’aggrégation pour calculer le nombre total de réservations effectuées sur une période donnée entre 2025-05-04 et 2025-05-20
SELECT COUNT(*) AS nombre_reservations
FROM Reservation
WHERE dateDebut >= '2025-05-04' AND dateFin <= '2025-05-20';

-- Requête d’aggrégation pour calculer le nombre d’utilisateur ayant emprunté du matériel
SELECT COUNT(DISTINCT idUtilisateur) AS nombre_reservations
FROM Reservation

