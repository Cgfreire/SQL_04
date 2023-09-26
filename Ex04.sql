-- EXERCICIO 1
CREATE TABLE funcionarios
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(255),
    data_nascimento DATE
);


INSERT INTO funcionarios
    (nome, data_nascimento)
VALUES
    ('João', '1990-05-07'),
    ('Maria', '2003-09-09'),
    ('Mariana', '2014-07-07');

SELECT *
FROM funcionarios
WHERE MONTH(data_nascimento) = MONTH(GETDATE())


-- EXERCICIO 2

CREATE TABLE clientes
(
    ClientId INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255),
    Email VARCHAR(255)
)

CREATE TABLE produtos
(
    ProdutoId INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255),
    ValorUnit DECIMAL(10,2)
)

CREATE TABLE vendas
(
    VendaId INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT,
    ProdutoId INT,
    Quantidade INT,
    ValorTotal DECIMAL(10,2),
    DataVenda DATE,
    FOREIGN KEY(ClientId) REFERENCES Clientes(ClientId),
    FOREIGN KEY(ProdutoId) REFERENCES Produtos(ProdutoId)
)

INSERT INTO Clientes
    (Nome, Email)
VALUES
    ('João da Silva', 'joão@gmail.com'),
    ('Maria Da Silva', 'maria@gmail.com')

INSERT INTO Produtos
    (Nome, ValorUnit)
VALUES
    ('Calça Jeans', 20.00),
    ('Moletom', 30.00),
    ('Tênis de Corrida', 50.00)


INSERT INTO Vendas
    (ClientID, ProdutoId, Quantidade, ValorTotal, DataVenda)
VALUES
    (1, 1, 3, 60.00, '2023-09-09'),
    (1, 2, 3, 60.00, '2023-10-23'),
    (2, 2, 3, 60.00, '2023-10-23');

DECLARE @ClientID INT = 1
SELECT
    a.Nome as NomeClient,
    b.Nome as NomeProduto,
    d.Quantidade as Quantidade,
    b.ValorUnit as ValorUnitario,
    d.ValorTotal as ValorTotal,
    d.DataVenda as DataVenda
FROM vendas d
    JOIN Clientes a ON d.ClientID = a.ClientId
    JOIN Produtos b ON d.ProdutoId = b.ProdutoId
WHERE d.ClientId = @ClientId

-- EXERCICIO 3 

CREATE TABLE alunos
(
    AlunoId INT PRIMARY KEY IDENTITY (1,1),
    Nome VARCHAR(255),
    TurmaId INT
)

CREATE TABLE turmas
(
    TurmaId INT PRIMARY KEY IDENTITY(1,1),
    NomeTurma VARCHAR(255)
)

CREATE TABLE notas
(
    NotaId INT PRIMARY KEY IDENTITY(1,1),
    AlunoId INT,
    Disciplina VARCHAR(255),
    Nota DECIMAL(5,2),
    FOREIGN KEY (AlunoId) REFERENCES Alunos(AlunoId)
);

INSERT INTO turmas
    (NomeTurma)
VALUES
    ('Sistemas de Informação'),
    ('Engenharia de Software'),
    ('TADS');

INSERT INTO alunos
    (Nome, TurmaId)
VALUES
    ('João da Silva Souza', 1),
    ('Maria Antonia', 2),
    ('Pedro Augusto', 3)

INSERT INTO notas
    (AlunoId, Disciplina, Nota)
VALUES
    (1, 'Algoritmo 1', 9.0),
    (2, 'Compiladores', 8.0),
    (3, 'Estrutura de Dados', 10.0),
    (2, 'Cálculo 1', 5.0)

DECLARE @AlunoId INT = 2

SELECT
    a.Nome as NomeAluno,
    b.NomeTurma as NomeTurma,
    c.Disciplina as Disciplina,
    c.Nota as Nota
FROM Notas C
    JOIN Alunos a ON c.AlunoId = a.AlunoId
    JOIN Turmas b ON  a.TurmaId = b.TurmaId
WHERE c.AlunoId = @AlunoId

-- EXERCICIO 4

CREATE TABLE Employees
(
    FuncionarioId INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(255)
)

CREATE TABLE Escalas
(
    EscalaId INT PRIMARY KEY IDENTITY(1,1),
    NomeEscala VARCHAR(255)
)

CREATE TABLE EscalaFuncionarios
(
    EscalaFuncionarioId INT PRIMARY KEY IDENTITY(1,1),
    FuncionarioId INT,
    EscalaId INT,
    Data DATE
)

INSERT INTO Employees
    (Nome)
VALUES
    ('João Pedro'),
    ('Pedro João'),
    ('Lucas João')

INSERT INTO Escalas
    (NomeEscala)
VALUES
    ('A'),
    ('B'),
    ('C');

INSERT INTO EscalaFuncionarios
    (FuncionarioId, EscalaId, Data)
VALUES
    (1, 2, '2023-09-12'),
    (2, 1, '2023-09-20'),
    (3, 3, '2023-09-27')

DECLARE @Data date = '2023-09-27';
DECLARE @EscalaId INT = 3;

SELECT
    a.nome as NomeFuncionario,
    b.NomeEscala as NomeEscala,
    c.Data as Data
FROM EscalaFuncionarios C
    JOIN Employees a ON c.FuncionarioId = a.FuncionarioId
    JOIN Escalas b ON c.EscalaId = b.EscalaId
WHERE c.data = @Data AND c.EscalaId = @EscalaId
FOR JSON PATH










 

