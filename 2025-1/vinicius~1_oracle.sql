-- COMANDOS SQL DDL
CREATE TABLE Ambulatorios (
 nroa NUMBER PRIMARY KEY,
 andar NUMBER NOT NULL,
 capacidade NUMBER
);
CREATE TABLE Medicos (
 codm NUMBER PRIMARY KEY,
 CPF NUMBER(11) UNIQUE,
 nome VARCHAR2(40) NOT NULL,
 idade NUMBER NOT NULL,
 especialidade VARCHAR2(20),
 cidade VARCHAR2(30),
 nroa NUMBER,
 FOREIGN KEY(nroa) REFERENCES Ambulatorios(nroa)
);

CREATE TABLE funcionario(
    cod_func INTEGER,
    nome VARCHAR(20)
);
-- END SQL DDL


-- COMANDOS SQL DML (manipulação de dados)
INSERT INTO Ambulatorios VALUES (1, 3, 40);
INSERT INTO Ambulatorios VALUES (2, 1, 50);
INSERT INTO Ambulatorios VALUES (3, 2, 40);
INSERT INTO Ambulatorios VALUES (4, 2, 25);
INSERT INTO Ambulatorios VALUES (5, 2, 55);
INSERT INTO Medicos VALUES (1, 10000100000, 'Joao', 40, 'ortopedia', 'Florianopolis', 1);
INSERT INTO Medicos VALUES (2, 10000110000, 'Maria', 42, 'traumatologia', 'Blumenau', 2);
INSERT INTO Medicos VALUES (3, 11000100000, 'Pedro', 51, 'pediatria', 'São José', 2);
INSERT INTO Medicos VALUES (4, 11000110000, 'Carlos', 28, 'ortopedia', 'Joinville', NULL);
INSERT INTO Medicos VALUES (5, 11000111000, 'Marcia', 33, 'neurologia', 'Biguacu', 3);
-- END SQL DML


-- CREATE PROCEDURE
/*
    Como posso incluir uma operação de update e 
    delete de dados da tabela
*/

CREATE OR REPLACE PROCEDURE "SP_FUNCIONARIO" (
    vCOD_FUNC INTEGER,
    vNOME VARCHAR2,
    vOPR CHAR
)
IS

vEXCEPTION EXCEPTION;

BEGIN
    IF (vOPR = 'I') THEN
        INSERT INTO FUNCIONARIO(COD_FUNC, NOME) VALUES (vCOD_FUNC, vNOME);
    ELSE
        RAISE vEXCEPTION;
    END IF;

EXCEPTION
    WHEN vEXCEPTION THEN
    RAISE_APPLICATION_ERROR(-20999,'ATENÇÃO! Operação diferente de I (Insercao).', FALSE);END SP_FUNCIONARIO;
-- END PROCEDURE
