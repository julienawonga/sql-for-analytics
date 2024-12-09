Questions SQL
1. Requêtes de base
 - Sélectionner tous les clients ayant un score supérieur à 80.
- Trouver les produits dont le prix est supérieur à la moyenne.
 - Récupérer tous les employés ayant un salaire supérieur à 50 000 € et travaillant dans le département "Ventes".
2. Agrégats
 - Compter le nombre total de commandes pour chaque statut (OrderStatus).
 - Calculer la somme totale des quantités commandées pour chaque produit.
 - Trouver le prix moyen des produits par catégorie.
Lister les pays des clients avec le score moyen pour chaque pays.
3. Jointures
 - Afficher les informations des commandes (produit, client, commercial) avec leurs détails.
 - Trouver les clients qui ont passé des commandes pour des produits coûtant plus de 100 €.
 - Lister les employés qui n’ont aucune commande associée en tant que SalesPerson.
4. Sous-requêtes
 - Trouver les produits qui n'ont jamais été commandés.
 - Récupérer les employés ayant un salaire supérieur à la moyenne des salaires dans leur département.
 - Lister les clients ayant passé une commande après leur première commande.
5. Expressions de table communes (CTE)
 - Utiliser un CTE pour afficher les produits ayant été commandés plus de 10 fois.
 - Créer un CTE pour calculer les revenus générés par chaque produit, puis afficher les 5 produits les plus rentables.
 - Trouver les employés qui ont des subordonnés avec un salaire supérieur à leur propre salaire.
6. Fenêtres analytiques
 - Calculer le total cumulé (running total) des quantités commandées pour chaque client.
 - Ajouter une colonne indiquant le rang (RANK) des employés en fonction de leur salaire dans chaque département.
 - Calculer la date de la première commande pour chaque client.
7. Manipulation de chaînes
 - Créer une colonne concaténant les noms et prénoms des employés.
 - Rechercher les produits dont le nom contient le mot "Pro".
 - Extraire le nom de la ville de l'adresse d'expédition (ShipAddress).
8. Dates et temps
 - Trouver toutes les commandes qui ont été expédiées plus de 7 jours après leur création.
 - Afficher les employés ayant fêté leur anniversaire le mois dernier.
 - Calculer la durée moyenne entre la date de commande et la date d'expédition pour les commandes livrées.
9. Données manquantes
 - Lister les commandes sans adresse de livraison (ShipAddress).
 - Trouver les employés sans manager (ManagerID NULL).
10. Indices avancés
 - Récupérer les commandes où la quantité est dans le top 10 % des quantités totales commandées.
 - Trouver les produits appartenant à la catégorie avec les ventes les plus élevées (en termes de quantité totale).
 - Récupérer les clients ayant un score supérieur à la médiane des scores.