-- Afficher tous les utilisateurs ayant emprunté au moins un équipement

SELECT * FROM utilisateur
INNER JOIN reservation ON utilisateur.idutilisateur=reservation.idutilisateur;

-- Afficher les équipements n’ayant jamais été empruntés

SELECT * FROM materiel 
WHERE idmateriel NOT IN (SELECT idmateriel FROM reservation);

-- Afficher les équipements ayant été emprunté plus de 3 fois

SELECT 
    materiel.idmateriel, 
    materiel.nom, 
    COUNT(reservation.idmateriel)
FROM materiel 
INNER JOIN reservation ON materiel.idmateriel = reservation.idmateriel
GROUP BY materiel.idmateriel, materiel.nom
HAVING COUNT(reservation.idmateriel) > 3;

-- Afficher le nombre d’emprunts pour chaque utilisateur, ordonné par numéro d'étudiant. Les utilisateurs n'ayant pas de réservations en cours doivent également être affichés avec la valeur 0 dans le nombre d'emprunts.

SELECT 
    utilisateur.idutilisateur,
    utilisateur.nom,
    utilisateur.prenom,
    COUNT(reservation.idreservation)
FROM utilisateur
LEFT JOIN reservation ON utilisateur.idutilisateur = reservation.idutilisateur
GROUP BY utilisateur.idutilisateur, utilisateur.nom, utilisateur.prenom
ORDER BY utilisateur.idutilisateur;