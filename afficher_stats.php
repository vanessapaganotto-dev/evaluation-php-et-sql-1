<?php
try {
    $pdo = new PDO(
        "mysql:host=localhost;dbname=db_sports;charset=utf8",
        "root",
        "Ubuntu1412",
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    // Récup écoles
    $ecoles = $pdo->query("SELECT id, nom FROM ecoles")->fetchAll(PDO::FETCH_ASSOC);
    ?>

   <!DOCTYPE html>      <!-- mise en page minimaliste-->
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Statistiques des écoles</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

     <?php
    
    echo "<h1>Statistiques des écoles</h1>";

    foreach ($ecoles as $ecole) {
        $ecole_id = $ecole['id'];

        // Nb élèves
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM eleves WHERE ecole_id = ?");
        $stmt->execute([$ecole_id]);
        $nbEleves = $stmt->fetchColumn();

        // Nb eleves pratiquent au moins un sport
        $stmt = $pdo->prepare("
            SELECT COUNT(DISTINCT e.id) 
            FROM eleves e 
            JOIN eleves_sports es ON e.id = es.eleve_id 
            WHERE e.ecole_id = ?
        ");
        $stmt->execute([$ecole_id]);
        $nbElevesAvecSport = $stmt->fetchColumn();

        // Nomb d'activités 
        $stmt = $pdo->prepare("
            SELECT COUNT(DISTINCT es.sport_id) 
            FROM eleves e 
            JOIN eleves_sports es ON e.id = es.eleve_id 
            WHERE e.ecole_id = ?
        ");
        $stmt->execute([$ecole_id]);
        $nbSportsPratiques = $stmt->fetchColumn();

        echo "<h2>" . htmlspecialchars($ecole['nom']) . "</h2>";
        echo "<p>Nombre total d'élèves : $nbEleves</p>";
        echo "<p>Nombre d'élèves pratiquant au moins un sport : $nbElevesAvecSport</p>";
        echo "<p>Nombre d'activités sportives pratiquées : $nbSportsPratiques</p>";

        // Liste sports 
        $stmt = $pdo->prepare("
            SELECT s.nom, COUNT(es.eleve_id) AS nb_pratiquants
            FROM sports s
            JOIN eleves_sports es ON s.id = es.sport_id
            JOIN eleves e ON es.eleve_id = e.id
            WHERE e.ecole_id = ?
            GROUP BY s.nom
            ORDER BY nb_pratiquants ASC
        ");
        $stmt->execute([$ecole_id]);
        $sports = $stmt->fetchAll(PDO::FETCH_ASSOC);

        if ($sports) {
            echo "<ul>";
            foreach ($sports as $sport) {
                echo "<li>" . htmlspecialchars($sport['nom']) . " : " . $sport['nb_pratiquants'] . " élève(s)</li>";
            }
            echo "</ul>";
        } else {
            echo "<p>Aucun sport pratiqué.</p>";
        }
    }

} catch (Exception $e) {
    echo "Erreur : " . $e->getMessage();
}
?>

</body>
</html>
    
    
   