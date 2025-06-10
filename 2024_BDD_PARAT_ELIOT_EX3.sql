-- Cette commande nous permet de select les utilisateurs avec leur date de reservation
SELECT nom, Reservation.dateDebut, Reservation.dateFin FROM Utilisateur JOIN Reservation ON Utilisateur.idUtilisateur = Reservation.idUtilisateur;

-- Une requête de jointure pour récupérer les informations sur le matériel emprunté par un utilisateur donné

SELECT 
    Utilisateur.nom AS NomUtilisateur,
    Materiel.nom AS NomMateriel
FROM 
    Reservation
JOIN Utilisateur ON Reservation.idUtilisateur = Utilisateur.idUtilisateur
JOIN Materiel ON Reservation.idMateriel = Materiel.idMateriel
