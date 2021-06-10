CREATE DATABASE IF NOT EXISTS BDDepartamentos;
    CREATE TABLE DEPART(
    TDEPT_NO int, DNOMBRE varchar(14), LOC varchar(14));
        
    CREATE TABLE EMPLE(
    EMP_NO int, APELLIDO varchar(10), OFICIO varchar(10), DIR int, FECHA_ALT date, SALARIO int, COMISION int, DEPT_NO int);
        
    CREATE TABLE GRADO(
    GRADO int, SALARIO_MAS_BAJO int, SALARIO_MAS_ALTO int);
        