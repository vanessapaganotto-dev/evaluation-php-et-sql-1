<?php
try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=db_sports;charset=utf8",
        "root",
        "Ubuntu1412",
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    // Récup écoles et sports
    $ecoles = $pdo->query("SELECT id FROM ecoles")->fetchAll(PDO::FETCH_COLUMN);
    $sports = $pdo->query("SELECT id FROM sports")->fetchAll(PDO::FETCH_COLUMN);

    if (empty($ecoles) || empty($sports)) {
        throw new Exception("Les tables 'ecoles' et 'sports' doivent contenir des données.");
    }

    // Vider tables 
    $pdo->exec("DELETE FROM eleves_sports");
    $pdo->exec("DELETE FROM eleves");

    // Liste prénoms 
    $prenoms = ['Alice','Bob','Charlie','David','Emma','Lucas','Lina',
                'Noah','Eva','Hugo','Mila','Leo','Nina','Paul','Sarah'];

    // Génerer nombre aléatoire 
    $nbEleves = rand(20, 50);

    for ($i = 0; $i < $nbEleves; $i++) {
        $nom = $prenoms[array_rand($prenoms)] . ' ' . chr(rand(65, 90)) . '.'; // Nom + initiale pour éviter doublon
        $ecole_id = $ecoles[array_rand($ecoles)];

        // Inserer élève
        $stmt = $pdo->prepare("INSERT INTO eleves (nom, ecole_id) VALUES (?, ?)");
        $stmt->execute([$nom, $ecole_id]);
        $eleve_id = $pdo->lastInsertId();

        // Nombre aléatoire sports 
        $nbSports = rand(0, 3);
        if ($nbSports > 0) {
            shuffle($sports);
            $sportsChoisis = array_slice($sports, 0, $nbSports);
            foreach ($sportsChoisis as $sport_id) {
                $stmt = $pdo->prepare("INSERT INTO eleves_sports (eleve_id, sport_id) VALUES (?, ?)");
                $stmt->execute([$eleve_id, $sport_id]);
            }
        }
    }

    echo "<h3>Génération aléatoire des élèves et sports terminée !</h3>";

} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage();
}