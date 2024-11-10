```ansi wrap frame="none"
[1mPRODUIT[0m ([4mNPRO[0m, LIBELLE, PRIX_U, POIDS_U)
[1mCOMPOSITION[0m ([4mCOMPOSE, COMPOSANT[0m, QTE)
```

<details>
    <summary>Remarques</summary>

* Un produit est identifié par son numéro `NPRO`, son libellé `LIBELLE`, son prix unitaire `PRIX_U` et son poids unitaire `POIDS_U`.
* La relation `COMPOSITION` décrit la composition des produits : Chaque ligne de la relation `COMPOSITION` indique que le produit identifié par `COMPOSE` est composé du produit identifié par `COMPOSANT` en quantité `QTE`.
* Seuls les produits composés ont une entrée dans la relation `COMPOSITION`.
* Un produit peut être composé de plusieurs produits, et un produit peut être le composant de plusieurs produits.
* La relation `COMPOSITION` est une relation réflexive : un produit peut être composé de lui-même.
* La relation `COMPOSITION` est une relation symétrique : si le produit A est composé du produit B, alors le produit B est le composant du produit A.
* Seuls les composants finaux ont un prix et un poids unitaires.

</details>
