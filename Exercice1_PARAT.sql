CREATE TABLE Materiel(
   idMateriel COUNTER,
   nom VARCHAR(50),
   PRIMARY KEY(idMateriel)
);

CREATE TABLE Utilisateur(
   idUtilisateur COUNTER,
   Nom VARCHAR(20),
   Prenom VARCHAR(20),
   email VARCHAR(50),
   PRIMARY KEY(idUtilisateur)
);

CREATE TABLE Reservation(
   idReservation COUNTER,
   dateDebut DATE,
   dateFin DATE,
   idUtilisateur VARCHAR(20) NOT NULL,
   idMateriel VARCHAR(50) NOT NULL,
   PRIMARY KEY(idReservation),
   FOREIGN KEY(idUtilisateur) REFERENCES Utilisateur(idUtilisateur),
   FOREIGN KEY(idMateriel) REFERENCES Materiel(idMateriel)
);

INSERT INTO utilisateur (idUtilisateur, nom, prenom, email)
VALUES 
(1, 'Dupont', 'Alice', 'alice.dupont@example.com'),
(2, 'Martin', 'Bob', 'bob.martin@example.com'),
(3, 'Dubois', 'Claire', 'claire.dubois@example.com'),
(4, 'Morel', 'David', 'david.morel@example.com'),
(5, 'Lefevre', 'Emma', 'emma.lefevre@example.com'),
(6, 'Lambert', 'Fabien', 'fabien.lambert@example.com'),
(7, 'Roux', 'Giselle', 'giselle.roux@example.com'),
(8, 'Bernard', 'Hugo', 'hugo.bernard@example.com'),
(9, 'Petit', 'Isabelle', 'isabelle.petit@example.com'),
(10, 'Girard', 'Julien', 'julien.girard@example.com');