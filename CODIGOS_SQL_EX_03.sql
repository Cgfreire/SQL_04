CREATE DATABASE BILBIOTECA

USE BIBLIOTECA 

CREATE TABLE ASSUNTOS(
	ID INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL
)

CREATE TABLE LIVROS (
	ID INT PIRMARY KEY IDENTITY,
	TITULO VARCHAR(50) NOT NULL,
	AUTOR VARCHAR(50) NOT NULL,
	ASSUNTO_ID INT NOT NULL,
	DATALAN DATE, 
	COPIAS INT,
)

CREATE TABLE EMPRESTIMOS (
	ID INT PRIMARY KEY IDENTITY,
	ALUNO_ID INT NOT NULL,
	LIVRO_ID INT NOT NULL,
	DATARET DATE,
	DATAPREV DATE,
	DATADEV DATE,
	MULTA FLOAT
)

CREATE TABLE ALUNOS(
	ID INT PRIMARY KEY IDENTITY,
	NOME VARCHAR(50) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	TELEFONE VARCHAR(20) NOT NULL
)

ALTER TABLE LIVROS ADD CONSTRAINTS FK_LIVRO_ASSUNTO_ID REFERENCES ASSUNTOS(ID)
ALTER TABLE EMPRESTIMOS ADD CONSTRAINTS FK_EMPRESTIMOS_LIVRO_ID REFERENCES LIVROS(ID)
ALTER TABLE EMPRESTIMOS ADD CONSTRAINTS FK_EMPRESTIMOS_ALUNO_ID REFERENCES ALUNOS(ID)

A)SELECT TITULO, AUTOR,DATALAN FROM LIVROS ORDER BY TITULO;

B)SELECT * FROM LIVROS WHERE YEAR(DATALAN) IN ('2011','2012');

C) SELECT * FROM LIVROS WHERE TITULO LIKE '%Redes%';

D) SELECT a.TITULO, b.NOME, a.COPIAS FROM LIVROS a 
INNER JOIN ASSUNTOS b 
ON a.ASSUNTO_ID = b.ID

E)SELECT TITULO, AUTOR FROM LIVROS WHERE TITULO = 'Redes'

F) SELECT b.NOME,COUNT(a.*) FROM LIVROS a 
INNER JOIN ASSUNTOS b 
ON a.ASSUNTO_ID = b.ID
GROUP BY B.NOME

G)UPDATE LIVROS
SET COPIAS = COPIAS + 2
WHERE COPIAS < 10

H)SELECT a.TITULO, b.DATARET, c.NOME FROM LIVROS a 
INNER JOIN EMPRESTIMOS b 
INNER JOIN ALUNOS c 
ON a.ID = b.LIVRO_ID 
ON b.ALUNO_ID = c.ID

I)SELECT SUM(MULTA) FROM EMPRESITMOS WHERE YEAR(DATARET) = '2013'

J) INSERT INTO ALUNOS VALUES ('CAIO BONITAO','CAIOMAISBONITAO@GMAIL','27999999999')
