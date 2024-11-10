

```ansi wrap frame="none"
[1mVILLE[0m ([4mNOMV[0m, PAYS)
{(n, p) ∈ VILLE ↔ la ville dont le nom est n, est située dans la pays p}

[1mMONUMENT[0m ([4mNOMM[0m, NOMV*, PRIX)
{(nm, nv, p) ∈ MONUMENT ↔ le monument de nom nm est situé dans la ville nv. La visite coûte p euros}

[1mCIRCUIT[0m ([4mNC[0m, NBETAPES, PRIX)
{(nc, nb, p) ∈ CIRCUIT ↔ le circuit est identifié par le numéro nc. Il comprend nb étapes et vaut p euros}

[1mETAPE[0m (NOMV, [4mNC, NUMETAPE[0m, DUREE)
{(nv, nc, nu, no, d) ∈ ETAPE ↔ la ville nv est la nu ième étape du circuit nc. L'étape dure d jours}

[1mPROGRAMMATION[0m ([4mNC, DATE[0m, PLACES)
{(nc, d, p) ∈ P ROGRAMMATION ↔ le circuit nc est programmé à la date d. P places sont disponibles}

[1mRESERVATION[0m (NC*, [4mNR[0m, NOMC*, PLACES, DATE)
{(nc, nr, c, p, d) ∈ RESERVATION ↔ le client de nom c a réservé p places pour le circuit nc commençant à la date d. Sa réservation est identifiée par le numéro nr}
```


Les contraintes d'intégrité référentielle (_relations entre les clés primaires et étrangères_) sont :

```ansi wrap frame="none"
[1mRESERVATION[0m[NC, DATE] ⊂ [1mPROGRAMMATION[0m[NC, DATE]
[1mCIRCUIT[0m[NC] = [1mPROGRAMMATION[0m[NC]
[1mCIRCUIT[0m[NC] = [1mETAPE[0m[NC]
[1mVILLE[0m[NOMV] = [1mETAPE[0m[NOMV]
[1mMONUMENT[0m[NOMV] ⊂ [1mVILLE[0m[NOMV]
```
