-- PRODUIT (NPRO, NOMP, QTP, COULEUR)
-- VENTE (NVEN, NOMC, NPRV*, QTV, DATEV)
-- ACHAT (NACH, NOMF, NPRA*, QTA, DATEA)
-- 1. Donner les noms et couleurs de tous les produits
-- PRODUIT [ NOMP, COULEUR ]
SELECT
    NOMP,
    COULEUR
FROM
    PRODUIT;

-- 2. Donner les noms et quantités en stock des produits de couleur rouge
-- PRODUIT : ( COULEUR = 'rouge' ) [ NOMP, QTP ]
SELECT
    NOMP,
    QTP
FROM
    PRODUIT
WHERE
    COULEUR = 'rouge';

-- 3. Donner les numéros de vente, le nom du client, la quantité vendue pour les ventes du produit de nom « torchon », réalisées avant le 12/09/87
-- R1 = PRODUIT : (NOMP = 'torchon') 
-- R2 = R1 (NPRO = NPRV) x VENTE
-- R3 = R2 : ( DATEV < 12/09/87 )
-- R4 = R3 [ NVEN, NOMC ]
SELECT
    NVEN,
    NOMC
FROM
    VENTE
WHERE
    NPRV IN (
        SELECT
            NPRO
        FROM
            PRODUIT
        WHERE
            NOMP = "torchon"
    )
    AND DATEV < '1987-09-12';

-- 4. Donner les noms des clients ayant acheté au moins un produit de couleur vert
-- R1 = PRODUIT : (COULEUR = 'vert') [ NOMP ]
-- R2 = R1 (NPRO = NPRV) x VENTE
-- R3 = R2 [ NOMC ]
SELECT
    NOMC
FROM
    VENTE
WHERE
    NPRV IN (
        SELECT
            NPRO
        FROM
            PRODUIT
        WHERE
            COULEUR = 'vert'
    );

-- 5. Donner les noms des fournisseurs qui sont également des clients
-- R1 = ACHAT [ NOMF ]
-- R2 = VENTE [ NOMC ]
-- R3 = R1 INTERSECT R2
SELECT
    NOMF
FROM
    ACHAT
INTERSECT
SELECT
    NOMC
FROM
    VENTE;

-- 6. Donner les noms des fournisseurs qui fournissent les produits de couleur bleue et dont la quantité en stock (actuellement) est inférieur à 100
-- R1 = PRODUIT : (COULEUR = 'bleue') [ NPRO ]
-- R2 = R1 (NPRO = NPRA) x ACHAT
-- R3 = R2 (QTA < 100) [ NOMF ]
SELECT
    NOMF
FROM
    ACHAT
WHERE
    NPRA IN (
        SELECT
            NPRO
        FROM
            PRODUIT
        WHERE
            COULEUR = 'bleue'
    )
    AND QTA < 100;

-- 7. Donner le nom des fournisseurs avec lesquels aucune commande de produit n’a été réalisée depuis le 30/06/87
-- R1 = ACHAT [ NOMF ]
-- R2 = ACHAT (DATEA < 30/06/87) [ NOMF ]
-- R3 = R1 - R2
SELECT
    NOMF
FROM
    ACHAT
EXCEPT
SELECT
    NOMF
FROM
    ACHAT
WHERE
    DATEA < '1987-06-30';

-- 8. Donner pour chaque produit, les noms des fournisseurs du produit et les noms des clients l’ayant acheté
-- R1 = PRODUIT [ NPRO ]
-- R2 = ACHAT (NPRO = NPRA) [ NOMF ]
-- R3 = VENTE (NPRO = NPRV) [ NOMC ]
-- R4 = R1 x R2 x R3
SELECT
    "NUMERO P",
    "TYPE",
    "NOM"
UNION
SELECT
    DISTINCT NPRA as "NUMERO P",
    "FOURNISSEUR",
    NOMF as "NOM"
FROM
    ACHAT
UNION
SELECT
    DISTINCT NPRV,
    "CLIENT",
    NOMC
FROM
    VENTE;

SELECT
    NOMP,
    NOMF,
    NOMC
FROM
    PRODUIT
    JOIN ACHAT ON NPRO = NPRA
    JOIN VENTE ON NPRO = NPRV;

-- sans jointure
SELECT
    NOMP,
    (
        SELECT
            NOMF
        FROM
            ACHAT
        WHERE
            NPRO = NPRA
    ) as NOMF,
    (
        SELECT
            NOMC
        FROM
            VENTE
        WHERE
            NPRO = NPRV
    ) as NOMC
FROM
    PRODUIT;

-- 9. Donner les noms des clients ayant acheté au moins une fois de tous les produits disponibles
-- R1 = VENTE [ NOMC, NPRV ]
-- R2 = PRODUIT [ NPRO ]
-- R3 = R1 / R2
SELECT
    DISTINCT NOMC
FROM
    VENTE V1
WHERE
    NOT EXISTS (
        SELECT
            NPRO
        FROM
            PRODUIT P
        WHERE
            NOT EXISTS (
                SELECT
                    NPRV
                FROM
                    VENTE V2
                WHERE
                    V2.NOMC = V1.NOMC
                    AND V2.NPRV = P.NPRO
            )
    );

-- Explication :
-- Sous-requête extérieure :
-- La requête extérieure sélectionne les clients distincts dans la table VENTE (SELECT DISTINCT NOMC).
-- La condition principale utilise WHERE NOT EXISTS, qui vérifie que pour chaque client, il n'existe aucun produit qui n'a pas été acheté par ce client.
-- Première sous-requête (corrélée) :
-- La première sous-requête sélectionne les numéros de produits (NPRO) dans la table PRODUIT pour vérifier s'il existe des produits qu'un client donné n'a pas achetés.
-- Deuxième sous-requête (corrélée à la première) :
-- La deuxième sous-requête vérifie pour chaque produit (P.NPRO) s'il est présent dans les ventes du client en question (V2.NOMC = V1.NOMC et V2.NPRV = P.NPRO).
-- Si ce produit n'a pas été acheté par le client, alors cette sous-requête retourne une ligne, ce qui fait que l'existence de ce produit non acheté est confirmée. S'il n'existe pas de produit non acheté, le client est inclus dans le résultat.
-- 10. Donner les noms des fournisseurs qui fournissent tous les produits
-- R1 = ACHAT [ NOMF, NPRA ]
-- R2 = PRODUIT [ NPRO ]
-- R3 = R2 / R1
SELECT
    DISTINCT NOMF
FROM
    ACHAT A1
WHERE
    NOT EXISTS (
        SELECT
            NPRO
        FROM
            PRODUIT P
        WHERE
            NOT EXISTS (
                SELECT
                    NPRA
                FROM
                    ACHAT A2
                WHERE
                    A2.NOMF = A1.NOMF
                    AND A2.NPRA = P.NPRO
            )
    );

-- Explication :
-- Sous-requête extérieure :
-- La requête extérieure sélectionne les fournisseurs distincts dans la table ACHAT (SELECT DISTINCT NOMF).
-- La condition principale utilise WHERE NOT EXISTS, qui vérifie que pour chaque fournisseur, il n'existe aucun produit qu'il n'a pas fourni.
-- Première sous-requête (corrélée) :
-- La première sous-requête sélectionne les numéros de produits (NPRO) dans la table PRODUIT pour vérifier s'il existe des produits qu'un fournisseur donné n'a pas fournis.
-- Deuxième sous-requête (corrélée à la première) :
-- La deuxième sous-requête vérifie pour chaque produit (P.NPRO) s'il est présent dans les achats du fournisseur en question (A2.NOMF = A1.NOMF et A2.NPRA = P.NPRO).
-- Si ce produit n'a pas été acheté par le fournisseur, alors cette sous-requête retourne une ligne, ce qui fait que l'existence de ce produit non acheté est confirmée. S'il n'existe pas de produit non acheté, le fournisseur est inclus dans le résultat.
-- 11. Donner, pour chaque couleur, le nombre de produits de cette couleur
-- R1 = PRODUIT [ COULEUR ]
-- R2 = PRODUIT (COULEUR = R1.COULEUR) [ COULEUR, COUNT(*) ]
SELECT
    DISTINCT COULEUR,
    (
        SELECT
            COUNT(*)
        FROM
            PRODUIT P2
        WHERE
            P2.COULEUR = P1.COULEUR
    ) AS NBR_PRODUITS
FROM
    PRODUIT P1;

-- 12. Donner le nom et le nombre des produits vendus lors de la plus grosse vente.
-- R1 = VENTE [ NVEN, NPRV, QTV ]
-- R2 = VENTE (QTV = MAX(QTV)) [ NVEN, NPRV, QTV ]
-- R3 = PRODUIT [ NPRO, NOMP ]
-- R4 = R2 (NPRV = NPRO) x R3
SELECT
    NOMP,
    (
        SELECT
            QTV
        FROM
            VENTE V
        WHERE
            V.NPRV = P.NPRO
            AND NOT EXISTS (
                SELECT
                    1
                FROM
                    VENTE V2
                WHERE
                    V2.QTV > V.QTV
            )
    ) AS QTV_MAX
FROM
    PRODUIT P
WHERE
    EXISTS (
        SELECT
            1
        FROM
            VENTE V
        WHERE
            V.NPRV = P.NPRO
            AND NOT EXISTS (
                SELECT
                    1
                FROM
                    VENTE V2
                WHERE
                    V2.QTV > V.QTV
            )
    );

-- explication
-- Sous-requête extérieure :
    -- La requête extérieure sélectionne les produits (NOMP) dans la table PRODUIT.
    -- La condition principale utilise WHERE EXISTS, qui vérifie que pour chaque produit, il existe une vente correspondante.
-- Première sous-requête (corrélée) :
    -- La première sous-requête sélectionne la quantité vendue (QTV) dans la table VENTE pour le produit en question (V.NPRV = P.NPRO).
    -- La condition NOT EXISTS vérifie que pour cette vente, il n'existe aucune autre vente avec une quantité supérieure.
    -- Si la vente en question est la plus grosse vente pour ce produit, la quantité est retournée.


-- version avec jointure
SELECT
    NOMP,
    QTV
FROM
    PRODUIT
    JOIN VENTE ON NPRO = NPRV
WHERE
    QTV = (
        SELECT
            MAX(QTV)
        FROM
            VENTE
    );
