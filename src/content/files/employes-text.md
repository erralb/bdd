```ansi wrap
[1mEMP[0m ([4mEMPNO[0m, ENAME, JOB, MGR*, HIREDATE, SAL, COMM, DEPTNO*)
[1mDEPT[0m ([4mDEPTNO[0m, DNAME, LOC)
[1mSALGRADE[0m ([4mGRADE[0m, LOSAL, HISAL)
```

<details>
    <summary>Remarques</summary>

- La relation `EMP` représente des employés.

    - Un employé est identifié par son numéro `EMPNO`, son nom `ENAME`, son emploi `JOB`, le numero de son chef hierarchique `MGR`, sa date d'embauche `HIREDATE`, son salaire mensuel `SAL`, le montant de ses commissions mensuelles `COMM` et le département auquel il appartient `DEPTNO`.
    - `MGR` est une clé étrangère qui référence le numéro `d'un autre employé`.
    - `DEPTNO` est une clé étrangère qui référence le `numéro d'un département`.

- La relation `DEPT` représente des départements.
    - Un département est identifié par son numéro `DEPTNO`, son nom `DNAME` et la ville `LOC` dans laquelle il se situe.

- La relation `SALGRADE` représente des grilles de salaire.
    - Les grilles de salaire sont identifiées par `GRADE`, le salaire minimum de la grille `LOSAL` et le salaire maximum `HISAL`.

</details>
