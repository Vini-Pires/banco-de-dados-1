/*

CREATE TABLE ambulatorios (
nroa NUMBER PRIMARY KEY,
andar NUMBER NOT NULL,
capacidade NUMBER
);

CREATE TABLE medicos (
codm NUMBER PRIMARY KEY,
cpf NUMBER(11) UNIQUE,
nome VARCHAR(50) NOT NULL,
idade NUMBER NOT NULL,
especialidade VARCHAR(40),
cidade VARCHAR(30),
nroa NUMBER,
FOREIGN KEY(nroa) REFERENCES ambulatorios(nroa)
);


INSERT INTO ambulatorios VALUES(1,3,40);
INSERT INTO ambulatorios VALUES(2,1,50);
INSERT INTO ambulatorios VALUES(3,2,40);
INSERT INTO ambulatorios VALUES(4,2,25);
INSERT INTO ambulatorios VALUES(5,2,55);

INSERT INTO medicos VALUES (1, 10000100000, 'Joao', 40, 'ortopedia', 'Florianopolis', 1);
INSERT INTO medicos VALUES (2, 10000110000, 'Maria', 42, 'traumatologia', 'Blumenau', 2);
INSERT INTO medicos VALUES (3, 11000100000, 'Pedro', 51, 'pediatria', 'São José', 2);
INSERT INTO medicos VALUES (4, 11000110000, 'Carlos', 28, 'ortopedia', 'Joinville', NULL);
INSERT INTO medicos VALUES (5, 11000111000, 'Marcia', 33, 'neurologia', 'Biguacu', 3); 

*/

CREATE TABLE funcionarios (
cod_func NUMBER PRIMARY KEY,
nome varchar(30)
);

CREATE OR REPLACE PROCEDURE "sp_funcionario" (
vCOD_FUNC NUMBER,
vNOME VARCHAR,
vOPERATION CHAR
)

IS

vEXCEPTION EXCEPTION;

BEGIN 

    IF (vOPERATION = 'I') THEN
        INSERT INTO funcionarios VALUES (vCOD_FUNC, vNOME);
    ELSE
        RAISE vEXCEPTION;
    END IF;
    
    EXCEPTION 
        WHEN vEXCEPTION THEN
        RAISE_APPLICATION_ERROR(-20999, 'ATENÇÃO! OPERAÇÃO DIFERENTE DE I( INSERÇÃO ).', FALSE);
        
END sp_funcionario;
