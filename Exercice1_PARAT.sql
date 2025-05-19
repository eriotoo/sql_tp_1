CREATE TABLE Materiel(
   idMateriel serial,
   nom VARCHAR(20),
   qteDispo int,
   PRIMARY KEY(idMateriel)
);

CREATE TABLE Utilisateur(
   idUtilisateur serial,
   Nom VARCHAR(20),
   Prenom VARCHAR(20),
   email VARCHAR(50),
   PRIMARY KEY(idUtilisateur)
);

CREATE TABLE Reservation(
   idReservation serial,
   dateDebut DATE,
   dateFin DATE,
   idUtilisateur int NOT NULL,
   idMateriel int NOT NULL,
   PRIMARY KEY(idReservation),
   FOREIGN KEY(idUtilisateur) REFERENCES Utilisateur(idUtilisateur),
   FOREIGN KEY(idMateriel) REFERENCES Materiel(idMateriel)
);

INSERT INTO Utilisateur ( nom, prenom, email)
VALUES 
( 'Dupont', 'Alice', 'alice.dupont@example.com'),
( 'Martin', 'Bob', 'bob.martin@example.com'),
( 'Dubois', 'Claire', 'claire.dubois@example.com'),
( 'Morel', 'David', 'david.morel@example.com'),
( 'Lefevre', 'Emma', 'emma.lefevre@example.com'),
( 'Lambert', 'Fabien', 'fabien.lambert@example.com'),
( 'Roux', 'Giselle', 'giselle.roux@example.com'),
( 'Bernard', 'Hugo', 'hugo.bernard@example.com'),
( 'Petit', 'Isabelle', 'isabelle.petit@example.com'),
('Girard', 'Julien', 'julien.girard@example.com');

INSERT INTO Materiel (nom,qteDispo) VALUES
('Ordinateur',25),
('Imprimante',20),
('Scanner',10),
('Projecteur',6),
('Téléphone',7),
('Tablette',3),
('Routeur',50),
('Switch',10),
('Clavier',6),
('Souris',12);

INSERT INTO Reservation (dateDebut, dateFin, idUtilisateur, idMateriel) VALUES
('2025-05-01', '2025-05-05', 1, 2),
('2025-05-03', '2025-05-07', 2, 3),
('2025-05-04', '2025-05-06', 3, 4),
('2025-05-06', '2025-05-10', 4, 5),
('2025-05-08', '2025-05-12', 5, 6),
('2025-05-10', '2025-05-13', 6, 7),
('2025-05-11', '2025-05-14', 7, 8),
('2025-05-13', '2025-05-17', 8, 9),
('2025-05-15', '2025-05-18', 9, 10),
('2025-05-16', '2025-05-20', 10, 1);


