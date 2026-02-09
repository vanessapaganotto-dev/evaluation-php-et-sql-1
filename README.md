Pour la version anglaise, cliquez ici : [README_EN.md](README_EN.md)

# Application de gestion pour école - PHP & SQL

## Description

Cette application permet de gérer les élèves inscrits dans une école ainsi que leur participation aux activités sportives.  
Elle est développée en PHP orienté objet avec une base de données SQL pour stocker les informations des élèves, des sports, et leurs inscriptions.

Fonctionnalités principales :  
- Gestion des élèves (nom, prénom, classe)  
- Gestion des sports proposés par l’école  
- Association des élèves aux sports via des inscriptions  
- Consultation des listes d’élèves par sport et vice-versa  

---

## Technologies utilisées

- PHP 8.x (POO)  
- MySQL / MariaDB  
- PDO pour la connexion sécurisée à la base de données  
- HTML/CSS pour le frontend simple  

---

## Installation

1. Cloner ce dépôt :  
  
   git clone https://github.com/ton-utilisateur/nom-du-projet.git

2. Importer la base de données :

Utiliser le fichier schema.sql fourni pour créer les tables et la structure.

Importer via phpMyAdmin ou en ligne de commande :

   mysql -u utilisateur -p nom_base < schema.sql

3. Configurer la connexion à la base dans le fichier Database.php (host, dbname, user, password).

4. Déployer les fichiers sur un serveur local (ex: XAMPP, MAMP) ou distant supportant PHP.
