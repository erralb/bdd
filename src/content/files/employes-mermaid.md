```mermaid
erDiagram

EMP {
  string EMPNO
  string ENAME
  string JOB
  string MGR
  date HIREDATE
  float SAL
  float COMM
  string DEPTNO
}

DEPT {
  string DEPTNO
  string DNAME
  string LOC
}

SALGRADE {
  string GRADE
  float LOSAL
  float HISAL
}

EMP }o--|| EMP : "Manager"
EMP ||--o{ DEPT : "Département"

```
