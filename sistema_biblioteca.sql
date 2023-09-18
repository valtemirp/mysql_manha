-- Criando o banco de dados
create database sistema_biblioteca;
-- Usando o sistema biblioteca
use sistema_biblioteca;
-- Tabela que representa a biblioteca
CREATE TABLE BIBLIOTECA (
  cnpj NVARCHAR(14) PRIMARY KEY
  -- CNPJ da biblioteca é a chave primária
);

-- Tabela que representa os livros
CREATE TABLE LIVRO (
  numero_registro INT PRIMARY KEY,
  titulo NVARCHAR(40),
  ano_publicacao NVARCHAR(30),
  autor NVARCHAR(50)
  -- Número de registro do livro é a chave primária
);

-- Tabela que representa os funcionários
CREATE TABLE FUNCIONARIO (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50)
  -- Matrícula do funcionário é a chave primária
);

-- Tabela que relaciona os livros a uma biblioteca específica
CREATE TABLE LIVRO_BIBLIOTECA (
  cnpj NVARCHAR(14),
  numero_registro INT,
  FOREIGN KEY (cnpj) REFERENCES BIBLIOTECA(cnpj),
  FOREIGN KEY (numero_registro) REFERENCES LIVRO(numero_registro)
  -- Chaves estrangeiras para biblioteca e livro
);

-- Tabela que representa o bibliotecário
CREATE TABLE BIBLIOTECARIO (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50),
  FOREIGN KEY (matricula) REFERENCES FUNCIONARIO(matricula)
  -- Chave estrangeira para funcionário
);

-- Tabela que representa eventos na biblioteca
CREATE TABLE EVENTO (
  id_evento INT PRIMARY KEY,
  data NVARCHAR(30),
  custo DECIMAL(6,2),
  tipo NVARCHAR(30)
  -- ID do evento é a chave primária
);

-- Tabela que representa palestras
CREATE TABLE PALESTRA (
  id_evento INT PRIMARY KEY,
  FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
  -- Chave estrangeira para o evento
);

-- Tabela que representa workshops
CREATE TABLE WORKSHOP (
  id_evento INT PRIMARY KEY,
  FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
  -- Chave estrangeira para o evento
);

-- Tabela que representa livros de sociologia
CREATE TABLE SOCIOLOGIA (
  numero_registro INT PRIMARY KEY,
  FOREIGN KEY (numero_registro) REFERENCES LIVRO(numero_registro)
  -- Chave estrangeira para livro
);

-- Tabela que representa livros de tecnologia
CREATE TABLE TECNOLOGIA (
  numero_registro INT PRIMARY KEY,
  FOREIGN KEY (numero_registro) REFERENCES LIVRO(numero_registro)
  -- Chave estrangeira para livro
);

-- Tabela que representa livros de ciência
CREATE TABLE CIENCIA (
  numero_registro INT PRIMARY KEY,
  FOREIGN KEY (numero_registro) REFERENCES LIVRO(numero_registro)
  -- Chave estrangeira para livro
);

-- Tabela que representa periódicos
CREATE TABLE PERIODICO (
  numero_registro INT PRIMARY KEY,
  titulo NVARCHAR(40),
  ano_publicacao NVARCHAR(30),
  autor NVARCHAR(50)
  -- Número de registro do periódico é a chave primária
);

-- Tabela que relaciona periódicos a uma biblioteca específica
CREATE TABLE PERIODICO_BIBLIOTECA (
  cnpj NVARCHAR(14),
  numero_registro INT,
  FOREIGN KEY (cnpj) REFERENCES BIBLIOTECA(cnpj),
  FOREIGN KEY (numero_registro) REFERENCES PERIODICO(numero_registro)
  -- Chaves estrangeiras para biblioteca e periódico
);

-- Tabela que representa educadores
CREATE TABLE EDUCADOR (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50),
  FOREIGN KEY (matricula) REFERENCES FUNCIONARIO(matricula)
  -- Chave estrangeira para funcionário
);

-- Tabela que representa atendentes
CREATE TABLE ATENDENTE (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50),
  FOREIGN KEY (matricula) REFERENCES FUNCIONARIO(matricula)
  -- Chave estrangeira para funcionário
);

-- Tabela que representa estagiários
CREATE TABLE ESTAGIARIO (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50),
  FOREIGN KEY (matricula) REFERENCES FUNCIONARIO(matricula)
  -- Chave estrangeira para funcionário
);

-- Tabela que representa assistentes
CREATE TABLE ASSISTENTE (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50),
  FOREIGN KEY (matricula) REFERENCES FUNCIONARIO(matricula)
  -- Chave estrangeira para funcionário
);

-- Tabela que representa gerentes
CREATE TABLE GERENTE (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50),
  FOREIGN KEY (matricula) REFERENCES FUNCIONARIO(matricula)
  -- Chave estrangeira para funcionário
);

-- Tabela que representa técnicos de TI
CREATE TABLE TECNICO_TI (
  matricula INT PRIMARY KEY,
  nome NVARCHAR(50),
  FOREIGN KEY (matricula) REFERENCES FUNCIONARIO(matricula)
  -- Chave estrangeira para funcionário
);

-- Inserindo registros para a tabela BIBLIOTECA
INSERT INTO BIBLIOTECA (cnpj) VALUES ('12345678901234');
INSERT INTO BIBLIOTECA (cnpj) VALUES ('23456789012345');
INSERT INTO BIBLIOTECA (cnpj) VALUES ('34567890123456');

-- Inserindo registros para a tabela LIVRO
INSERT INTO LIVRO (numero_registro, titulo, ano_publicacao, autor) VALUES (1, 'O Principe', '1532', 'Maquiavel');
INSERT INTO LIVRO (numero_registro, titulo, ano_publicacao, autor) VALUES (2, 'A Arte da Guerra', '500 a.C.', 'Sun Tzu');
INSERT INTO LIVRO (numero_registro, titulo, ano_publicacao, autor) VALUES (3, 'Dom Quixote', '1605', 'Miguel de Cervantes');

-- Inserindo registros para a tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (matricula, nome) VALUES (1001, 'João Silva');
INSERT INTO FUNCIONARIO (matricula, nome) VALUES (1002, 'Maria Pereira');
INSERT INTO FUNCIONARIO (matricula, nome) VALUES (1003, 'Carlos Santos');

-- Inserindo registros para a tabela LIVRO_BIBLIOTECA
INSERT INTO LIVRO_BIBLIOTECA (cnpj, numero_registro) VALUES ('12345678901234', 1);
INSERT INTO LIVRO_BIBLIOTECA (cnpj, numero_registro) VALUES ('12345678901234', 2);
INSERT INTO LIVRO_BIBLIOTECA (cnpj, numero_registro) VALUES ('23456789012345', 3);

-- Inserindo registros para a tabela EVENTO
INSERT INTO EVENTO (id_evento, data, custo, tipo) VALUES (101, '2023-09-15', 100.00, 'Workshop');
INSERT INTO EVENTO (id_evento, data, custo, tipo) VALUES (102, '2023-09-20', 150.00, 'Palestra');
INSERT INTO EVENTO (id_evento, data, custo, tipo) VALUES (103, '2023-09-30', 50.00, 'Seminário');

-- Inserindo registros para a tabela PALESTRA
INSERT INTO PALESTRA (id_evento) VALUES (102);

-- Inserindo registros para a tabela WORKSHOP
INSERT INTO WORKSHOP (id_evento) VALUES (101);

-- Inserindo registros para as categorias específicas de livros
INSERT INTO SOCIOLOGIA (numero_registro) VALUES (1);
INSERT INTO TECNOLOGIA (numero_registro) VALUES (2);
INSERT INTO CIENCIA (numero_registro) VALUES (3);

-- Inserindo registros para a tabela PERIODICO
INSERT INTO PERIODICO (numero_registro, titulo, ano_publicacao, autor) VALUES (4, 'Revista de Tecnologia', '2023', 'Editora Tech');
INSERT INTO PERIODICO (numero_registro, titulo, ano_publicacao, autor) VALUES (5, 'Revista de Ciências', '2023', 'Editora Ciência');
INSERT INTO PERIODICO (numero_registro, titulo, ano_publicacao, autor) VALUES (6, 'Revista de Atualidades', '2023', 'Editora Atual');

-- Inserindo registros para a tabela PERIODICO_BIBLIOTECA
INSERT INTO PERIODICO_BIBLIOTECA (cnpj, numero_registro) VALUES ('12345678901234', 4);
INSERT INTO PERIODICO_BIBLIOTECA (cnpj, numero_registro) VALUES ('23456789012345', 5);
INSERT INTO PERIODICO_BIBLIOTECA (cnpj, numero_registro) VALUES ('34567890123456', 6);

-- Inserindo registros para as tabelas de funcionários específicos
INSERT INTO BIBLIOTECARIO (matricula, nome) VALUES (1001, 'João Silva');
INSERT INTO EDUCADOR (matricula, nome) VALUES (1002, 'Maria Pereira');
INSERT INTO ATENDENTE (matricula, nome) VALUES (1003, 'Carlos Santos');

-- Considerando que todos os funcionários têm um papel específico, não inserimos registros para as tabelas ASSISTENTE, GERENTE e TECNICO_TI.

-- 1.1. Listar todos os livros:
SELECT * FROM LIVRO;
SELECT * FROM LIVRO_BIBLIOTECA;
-- 1.2. Listar todos os funcionários:
SELECT * FROM FUNCIONARIO;
-- 1.3. Mostrar os detalhes de um evento específico:
SELECT * FROM EDUCADOR
WHERE MATRICULA LIKE  '%10';

-- 2. Consultas com JOIN
-- 2.1. Listar todos os livros disponíveis em uma biblioteca específica:
SELECT L.titulo, L.ano_publicacao
FROM LIVRO L
JOIN LIVRO_BIBLIOTECA LB ON L.numero_registro = LB.numero_registro
WHERE LB.cnpj = '12345678901234';

-- 2.2. Mostrar os funcionários que são bibliotecários:
SELECT FUNCIONARIO.nome
FROM FUNCIONARIO
JOIN ATENDENTE  ON FUNCIONARIO.matricula = ATENDENTE.matricula;

-- 3. Consultas com Agregações
-- 3.1. Contar o número total de livros em cada biblioteca:
SELECT LB.cnpj, COUNT(LB.numero_registro) as Total_Livros
FROM LIVRO_BIBLIOTECA LB
GROUP BY LB.cnpj;

select * from LIVRO_BIBLIOTECA;

-- Stop dia 14/09/2023
-- ==================================


-- 3.2. Mostrar o custo médio dos eventos:
SELECT AVG(custo) as Custo_Medio FROM EVENTO;

-- 4. Consultas com Subconsultas
-- 4.1. Encontrar livros que não estão em nenhuma biblioteca:
SELECT titulo FROM LIVRO
WHERE numero_registro NOT IN (SELECT numero_registro FROM LIVRO_BIBLIOTECA);

-- 4.2. Listar funcionários que não têm um papel específico definido (não são bibliotecários, educadores, etc.):
SELECT nome FROM FUNCIONARIO
WHERE matricula NOT IN (SELECT matricula FROM BIBLIOTECARIO)
AND matricula NOT IN (SELECT matricula FROM EDUCADOR)
AND matricula NOT IN (SELECT matricula FROM ATENDENTE);

-- 5. Consultas Avançadas
-- 5.1. Listar bibliotecas e a quantidade de livros de cada autor:
SELECT B.cnpj, L.autor, COUNT(LB.numero_registro) as Quantidade_Livros
FROM BIBLIOTECA B
JOIN LIVRO_BIBLIOTECA LB ON B.cnpj = LB.cnpj
JOIN LIVRO L ON LB.numero_registro = L.numero_registro
GROUP BY B.cnpj, L.autor;

-- 5. Consultas Avançadas
-- 5.1. Listar bibliotecas e a quantidade de livros de cada autor:
SELECT B.cnpj, L.autor, COUNT(LB.numero_registro) as Quantidade_Livros
FROM BIBLIOTECA B
JOIN LIVRO_BIBLIOTECA LB ON B.cnpj = LB.cnpj
JOIN LIVRO L ON LB.numero_registro = L.numero_registro
GROUP BY B.cnpj, L.autor;

select * from livro
where titulo = 'o principe';


