--Número 1 

USE SALESIANO_EXERCICIOS

CREATE TABLE NOTAS_FISCAIS (
	ID_NF INT NOT NULL,
	ID_ITEM NOT NULL,
	COD_PROD INT NOT NULL,
	VALOR_UNIT FLOAT NOT NULL,
	QUANTIDADE INT NOT NULL,
	DESCONTO FLOAT NULL
)

INSERT INTO NOTAS_FISCAIS VALUES (1,1,1,25.00,10,5)
INSERT INTO NOTAS_FISCAIS VALUES (1,2,2,13.50,3,null)
INSERT INTO NOTAS_FISCAIS VALUES (1,3,3,15.00,2,null)
INSERT INTO NOTAS_FISCAIS VALUES (1,4,4,10.00,1,null)
INSERT INTO NOTAS_FISCAIS VALUES (1,5,5,30.00,1,null)
INSERT INTO NOTAS_FISCAIS VALUES (2,1,1,15.00,4,null)
INSERT INTO NOTAS_FISCAIS VALUES (2,2,2,10.00,5,null)
INSERT INTO NOTAS_FISCAIS VALUES (2,3,3,30.00,7,null)
INSERT INTO NOTAS_FISCAIS VALUES (3,4,4,25.00,5,null)
INSERT INTO NOTAS_FISCAIS VALUES (3,5,5,10.00,4,null)
INSERT INTO NOTAS_FISCAIS VALUES (3,1,1,30.00,5,null)
INSERT INTO NOTAS_FISCAIS VALUES (3,2,2,13.50,7,null)
INSERT INTO NOTAS_FISCAIS VALUES (4,3,3,30.00,10,15)
INSERT INTO NOTAS_FISCAIS VALUES (4,4,4,10.00,12,5)
INSERT INTO NOTAS_FISCAIS VALUES (4,5,5,25.00,13,5)
INSERT INTO NOTAS_FISCAIS VALUES (4,1,1,13.50,15,5)
INSERT INTO NOTAS_FISCAIS VALUES (5,2,2,15.00,3,null)
INSERT INTO NOTAS_FISCAIS VALUES (5,3,3,30.00,6,null)
INSERT INTO NOTAS_FISCAIS VALUES (6,4,4,25.00,22,15)
INSERT INTO NOTAS_FISCAIS VALUES (6,5,5,15.00,25,20)
INSERT INTO NOTAS_FISCAIS VALUES (7,1,1,25.00,10,3)
INSERT INTO NOTAS_FISCAIS VALUES (7,2,2,13.50,10,4)
INSERT INTO NOTAS_FISCAIS VALUES (7,3,3,15.00,10,4)
INSERT INTO NOTAS_FISCAIS VALUES (7,4,4,30.00,10,1)


A) SELECT ID_NF, ID_ITEM, COD_PROD E VALOR_UNIT FROM NOTAS_FISCAIS WHERE DESCONTO = NULL

B) SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, VALOR_UNIT - VALOR_UNIT*(DESCONTO/100) AS VALORVENDIDO FROM NOTAS_FISCAIS WHERE DESCONTO <> NULL

C)  UPDATE NOTAS_FISCAIS
    SET DESCONTO = 0
	WHERE DESCONTO = NULL
	
D)SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE * VALOR_UNIT AS VALOR_TOTAL, DESCONTO,VALOR_UNIT - VALOR_UNIT*(DESCONTO/100) AS VALORVENDIDO FROM NOTAS_FISCAIS

E) SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOTAL GROUP BY ID_NF ORDER BY SUM(QUANTIDADE * VALOR_UNIT) DESC

F)SELECT ID_NF, VALOR_UNIT - VALOR_UNIT*(DESCONTO/100) AS VALOR_VENDIDO FROM NOTAS_FISCAIS GROUP BY ID_NF ORDER BY VALOR_UNIT - VALOR_UNIT*(DESCONTO/100)

G) SELECT COD_PROD, SUM(QUANTIDADE) FROM NOTAS_FISCAIS GROUP BY(COD_PROD)

H)SELECT ID_NF, COD_PROD, QUANTIDADE FROM NOTAS_FISCAIS WHERE QUANTIDADE >=10 GROUP BY  ID_NF, COD_PROD

I) SELECT ID_NF, SUM(QUANTIDADE * VALOR_UNIT) AS VALOR_TOT FROM NOTAS_FISCAIS GROUP BY ID_NF

J) SELECT COD_PROD, AVG(VALOR_UNIT*(DESCONTO/100)) AS MEDIA FROM NOTAS_FISCAIS GROUP BY COD_PROD

K)SELECT COD_PROD, MIN(VALOR_UNIT*(DESCONTO/100)) MENOR, MAX(VALOR_UNIT*(DESCONTO/100)) MAIOR, AVG(VALOR_UNIT*(DESCONTO/100)) AS MEDIA FROM NOTAS_FISCAIS GROUP BY COD_PROD

L) SELECT ID_NF, SUM(QUANTIDADE) FROM NOTAS_FISCAIS WHERE QUANTIDADE >= 3 

--Número 2

USE SALESIANO_EXERCICIOS

CREATE TABLE ALUNOS(
	MAT INT PRIMARY KEY,
	NOME VARCHAR(100),
	ENDERECO VARCHAR(100),
	CIDADE VARCHAR(100)
)

CREATE TABLE DISCIPLINA (
	COD_DISC INT PRIMARY KEY,
	NOME_DISC VARCHAR(50),
	CARGA_HOR FLOAT 
)

CREATE TABLE PROFESSORES (
	COD_PROF INT PRIMARY KEY,
	NOME VARCHAR(50),
	ENDERECO VARCHAR(100),
	CIDADE VARCHAR(100)
)

CREATE TABLE TURMA (
	COD_DISC INT,
	COD_TURMA INT,
	COD_PROF INT,
	ANO INT,
	HORARIO TIME
)

ALTER TABLE TURMA ADD CONSTRAINTS FK_TURMA_COD_DISC REFERENCES DISCIPLINA(COD_DISC)
ALTER TABLE TURMA ADD CONSTRAINTS FK_TURMA_COD_PROF REFERENCES PROFESSORES(COD_PROF)



INSERT INTO ALUNOS VALUES (2015010101, "JOSE DE ALENCAR", "RUA DAS ALMAS", "NATAL")
INSERT INTO ALUNOS VALUES (2015010102, "JOÃO JOSÉ, AVENIDA RUY CARNEIRO", "JOÃO PESSOA")
INSERT INTO ALUNOS VALUES (2015010103, "MARIA JOAQUINA", "RUA CARROSSEL", "RECIFE")
INSERT INTO ALUNOS VALUES (2015010104, "MARIA DAS DORES", "RUA DAS LADEIRAS", "FORTALEZA")
INSERT INTO ALUNOS VALUES (2015010105, "JOSUÉ CLAUDINO DOS SANTOS", "CENTRO", "NATAL")
INSERT INTO ALUNOS VALUES (2015010106, "JOSUÉLISSON CLAUDINO DOS SANTOS", "CENTRO", "NATAL")

INSERT INTO DISCIPLINAS VALUES ("BD", "BANCO DE DADOS", 100)
INSERT INTO DISCIPLINAS VALUES ("POO", "PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS", 100)
INSERT INTO DISCIPLINAS VALUES ("WEB", "AUTORIA WEB", 50)
INSERT INTO DISCIPLINAS VALUES ("ENG", "ENGENHARIA DE SOFTWARE", 80)

INSERT INTO PROFESSORES (212131, "NICKERSON FERREIRA", "RUA MANAÍRA", "JOÃO PESSOA")
INSERT INTO PROFESSORES (122135, "ADORILSON BEZERRA", "AVENIDA SALGADO FILHO", "NATAL")
INSERT INTO PROFESSORES (192011, "DIEGO OLIVEIRA", "AVENIDA ROBERTO FREIRE", "NATAL")

INSERT INTO TURMA ("BD", 1, 212131, 2015, 11H-12H)
INSERT INTO TURMA ("BD", 2, 212131, 2015, 13H-14H)
INSERT INTO TURMA ("POO", 1, 192011, 2015, 08H-09H)
INSERT INTO TURMA ("WEB", 1, 192011, 2015, 07H-08H)
INSERT INTO TURMA ("ENG", 1, 122135, 2015, 10H-11H)


SELECT MAT FROM alunos a

INNER JOIN historico b ON a.mat = b.mat 

WHERE b.cod_disc = 1 AND b.ano = 2015 AND b.nota < 5 

 
SELECT a.mat AVG(b.nota) FROM alunos a

INNER JOIN historico b ON a.mat = b.mat

WHERE b.cod_disc = 2 AND b.ano = 2015


SELECT a.mat AVG(b.nota) FROM alunos a

INNER JOIN historico b ON a.mat = b.mat

WHERE b.cod_disc = 2 AND b.ano = 2015 AND AVG(b.nota) > 6 


SELECT * FROM  alunos

WHERE cidade != 'NATAL'