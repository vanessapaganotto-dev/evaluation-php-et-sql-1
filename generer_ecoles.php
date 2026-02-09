<?php
// Connexion PDO
$pdo = new PDO(
    "mysql:host=localhost;dbname=db_sports;charset=utf8",
    "root",
    "Ubuntu1412",
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
);


// noms de base

$prenoms = [
    'Alice','Bob','Charlie','David','Emma','Lucas','Lina',
    'Noah','Eva','Hugo','Mila','Leo','Nina','Paul','Sarah'
];

// Récupé écoles + sports
$ecoles = $pdo->query("SELECT id FROM ecoles")->fetchAll(PDO::FETCH_COLUMN);
$sports = $pdo->query("SELECT id FROM sports")->fetchAll(PDO::FETCH_COLUMN);

// Nettoyage
$pdo->exec("DELETE FROM eleves_sports");
$pdo->exec("DELETE FROM eleves");


// Génération élèves

$nbEleves = rand(20, 50);

for ($i = 0; $i < $nbEleves; $i++) {

    $nom = $prenoms[array_rand($prenoms)];
    $ecole_id = $ecoles[array_rand($ecoles)];

    // Insertion élève
    $stmt = $pdo->prepare(
        "INSERT INTO eleves (nom, ecole_id) VALUES (?, ?)"
    );
    $stmt->execute([$nom, $ecole_id]);

    $eleve_id = $pdo->lastInsertId();

    // Sports
    $nbSports = rand(0, 3);

    if ($nbSports > 0) {
        shuffle($sports);
        $sportsChoisis = array_slice($sports, 0, $nbSports);

        foreach ($sportsChoisis as $sport_id) {
            $stmt = $pdo->prepare(
                "INSERT INTO eleves_sports (eleve_id, sport_id) VALUES (?, ?)"
            );
            $stmt->execute([$eleve_id, $sport_id]);
        }
    }
}

echo "<h2><strong>Liste des écoles et statistiques affichées avec succès.</strong></h2>";