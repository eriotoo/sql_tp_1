-- Selectionner tous les utilisateurs qui ont comme nom Dupont
select nom From Utilisateur Where nom = 'Dupont'; 

-- Selectionner les utilisateur ainsi que leur materiel reservé à condition que la date de debut sois superieur à 2025-05-08
select idUtilisateur, idMateriel From Reservation Where dateDebut > '2025-05-08';

-- Selectionner tous les utilisateurs qui ont un nom qui commence M
SELECT * FROM Utilisateur WHERE nom LIKE 'M%';
