ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
CREATE USER vinicius_pires IDENTIFIED BY 566543;
-- O comando GRANT, concede permiss�es de conexao ao Banco de Dados, cria��o de tabelas e outros
objetos do banco de dados
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO vinicius_pires;