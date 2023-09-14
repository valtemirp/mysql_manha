
# SGBD - Sistema de Gerenciamento de Banco de Dados

Um SGBD (Sistema de Gerenciamento de Banco de Dados) é um software com um conjunto de programas que permite armazenar, modificar e extrair informações de um banco de dados. Existem muitos SGBDs disponíveis, que variam amplamente em escalabilidade, funcionalidades e operações específicas.

---

## SGBDs Mais Utilizados nas Empresas

- **SQL Server**: Desenvolvido pela Microsoft, é amplamente utilizado em ambientes corporativos, especialmente para sistemas baseados em Windows.
- **Oracle**: Um dos sistemas de banco de dados mais robustos e amplamente utilizados em grandes corporações.
- **MySQL**: Um sistema de gerenciamento de banco de dados relacional de código aberto, adquirido pela Oracle.
- **PostgreSQL**: Um sistema avançado de código aberto para gerenciamento de banco de dados.
- **MongoDB**: Um banco de dados NoSQL, orientado a documentos, de código aberto.

---

## Instalação de um SGBD 

Vamos considerar a instalação do SQL Server como exemplo:

1. **Download**: Acesse o [site oficial da Microsoft](https://www.microsoft.com/sql-server/) e baixe a versão desejada do SQL Server.
2. **Instalação**: Execute o instalador e siga as instruções na tela.
3. **Configuração**: Após a instalação, configure o SQL Server de acordo com as necessidades da sua organização.

---

## Linguagens de SQL no Contexto do SQL Server


DDL - Data Definition Language - Linguagem de Definição de Dados.
São os comandos que interagem com os objetos do banco.

São comandos DDL no SQL Server: CREATE, ALTER e DROP

DML - Data Manipulation Language - Linguagem de Manipulação de Dados.
São os comandos que interagem com os dados dentro das tabelas.

São comandos DML no SQL Server: INSERT, DELETE, UPDATE e SELECT

DQL - Data Query Language - Linguagem de Consulta de dados (no contexto do SQL Server, o SELECT é frequentemente classificado como DML).

São comandos DQL no SQL Server: SELECT (é o comando de consulta)

DTL - Data Transaction Language - Linguagem de Transação de Dados.
São os comandos para controle de transação.

São comandos DTL no SQL Server: BEGIN TRANSACTION, COMMIT e ROLLBACK

DCL - Data Control Language - Linguagem de Controle de Dados.
São os comandos para controlar a parte de segurança do banco de dados.

São comandos DCL no SQL Server: GRANT e REVOKE.

### Exemplo de comandos para o banco de dados do Senac

#### Comandos DDL:
```sql

-- Criação da tabela Cursos
CREATE TABLE Cursos (
    CursoID INT PRIMARY KEY,
    Nome NVARCHAR(255),
    Duracao INT,
    Valor DECIMAL(10, 2)
);

-- Criação da tabela Alunos
CREATE TABLE Alunos (
    AlunoID INT PRIMARY KEY,
    Nome NVARCHAR(255),
    DataNascimento DATE,
    Email NVARCHAR(255)
);

-- Criação da tabela Matriculas
CREATE TABLE Matriculas (
    MatriculaID INT PRIMARY KEY,
    AlunoID INT FOREIGN KEY REFERENCES Alunos(AlunoID),
    CursoID INT FOREIGN KEY REFERENCES Cursos(CursoID),
    DataMatricula DATE
);

-- Alteração da tabela Cursos para adicionar uma nova coluna
ALTER TABLE Cursos ADD Descricao NVARCHAR(MAX);
```

#### Comandos DML:
```sql

-- Inserir dados na tabela Cursos
INSERT INTO Cursos (CursoID, Nome, Duracao, Valor) 
VALUES (1, 'Desenvolvimento Web', 180, 1500.50);

-- Atualizar dados na tabela Cursos
UPDATE Cursos 
SET Valor = 1600.00 
WHERE CursoID = 1;

-- Deletar dados da tabela Alunos
DELETE FROM Alunos 
WHERE AlunoID = 10;
```

#### Comandos DQL:
```sql

-- Selecionar todos os cursos com duração maior que 100 horas
SELECT * FROM Cursos 
WHERE Duracao > 100;

-- Selecionar os alunos matriculados no curso de Desenvolvimento Web
SELECT a.Nome 
FROM Alunos a
JOIN Matriculas m ON a.AlunoID = m.AlunoID
JOIN Cursos c ON m.CursoID = c.CursoID
WHERE c.Nome = 'Desenvolvimento Web';
```

#### Comandos DTL:
```sql

-- Iniciar uma transação
BEGIN TRANSACTION;

-- Atualizar a duração de um curso
UPDATE Cursos 
SET Duracao = 200 
WHERE Nome = 'Desenvolvimento Web';

-- Finalizar a transação
COMMIT;
```

#### Comandos DCL:
```sql

-- Conceder permissão de SELECT na tabela Cursos para o usuário 'user123'
GRANT SELECT ON Cursos TO user123;

-- Revogar permissão de DELETE na tabela Alunos para o usuário 'user123'
REVOKE DELETE ON Alunos FROM user123;
```

---

Esse documento visa oferecer uma visão geral dos SGBDs e como interagir com eles usando o SQL Server como exemplo. Para mais informações detalhadas, consulte a documentação oficial ou outros recursos didáticos.


### Exemplos Detalhados (SQL Server para a modelagem do Senac):

#### Exemplos de Consultas Específicas (DQL):
```sql

-- Selecionar o nome dos cursos e o número de alunos matriculados
SELECT c.Nome AS Curso, COUNT(m.AlunoID) AS NumeroDeAlunos
FROM Cursos c
JOIN Matriculas m ON c.CursoID = m.CursoID
GROUP BY c.Nome;

-- Selecionar os alunos que nasceram após o ano 2000 e estão matriculados em algum curso
SELECT a.Nome 
FROM Alunos a
JOIN Matriculas m ON a.AlunoID = m.AlunoID
WHERE YEAR(a.DataNascimento) > 2000;

```

#### Exemplos de Atualizações (DML):
```sql

-- Atualizar o valor do curso 'Desenvolvimento Web'
UPDATE Cursos 
SET Valor = 1700 
WHERE Nome = 'Desenvolvimento Web';

-- Atualizar o e-mail de um aluno específico
UPDATE Alunos 
SET Email = 'novo_email@example.com' 
WHERE AlunoID = 5;

```

#### Exemplos de Renomeação (DDL):
```sql

-- Renomear a coluna 'Descricao' para 'Detalhes' na tabela 'Cursos'
EXEC sp_rename 'Cursos.Descricao', 'Detalhes', 'COLUMN';

-- Renomear a tabela 'Matriculas' para 'Inscricoes'
EXEC sp_rename 'Matriculas', 'Inscricoes';

```

#### Exemplos de Alteração de Tipo (DDL):
```sql

-- Alterar o tipo da coluna 'Valor' de DECIMAL(10, 2) para DECIMAL(12, 2)
ALTER TABLE Cursos 
ALTER COLUMN Valor DECIMAL(12, 2);

```

#### Exemplos de Alteração de Chaves (DDL):
```sql

-- Remover a chave primária atual da tabela 'Cursos'
ALTER TABLE Cursos 
DROP CONSTRAINT PK_CursoID;

-- Adicionar uma nova chave primária na tabela 'Cursos'
ALTER TABLE Cursos 
ADD CONSTRAINT PK_CursoID PRIMARY KEY (CursoID);

-- Remover a chave estrangeira atual da tabela 'Matriculas' que referencia 'Alunos'
ALTER TABLE Matriculas 
DROP FOREIGN KEY FK_AlunoID;

-- Adicionar uma nova chave estrangeira na tabela 'Matriculas' que referencia 'Alunos'
ALTER TABLE Matriculas 
ADD CONSTRAINT FK_AlunoID FOREIGN KEY (AlunoID) REFERENCES Alunos(AlunoID);

```

### Tipos de Dados do SQL Server e Exemplos:

#### Tipos Numéricos:

- **INT**: Armazena números inteiros.
  ```sql
  CREATE TABLE ExemploINT (ID INT);
  ```

- **BIGINT**: Armazena números inteiros maiores.
  ```sql
  CREATE TABLE ExemploBIGINT (GrandeNumero BIGINT);
  ```

- **SMALLINT**: Armazena números inteiros menores.
  ```sql
  CREATE TABLE ExemploSMALLINT (PequenoNumero SMALLINT);
  ```

- **TINYINT**: Armazena números inteiros muito pequenos.
  ```sql
  CREATE TABLE ExemploTINYINT (NumeroMinimo TINYINT);
  ```

- **DECIMAL**: Armazena números com precisão decimal.
  ```sql
  CREATE TABLE ExemploDECIMAL (Preco DECIMAL(10,2));
  ```

- **NUMERIC**: Semelhante ao DECIMAL.
  ```sql
  CREATE TABLE ExemploNUMERIC (Valor NUMERIC(10,2));
  ```

- **FLOAT**: Armazena números de ponto flutuante.
  ```sql
  CREATE TABLE ExemploFLOAT (Medida FLOAT);
  ```

- **REAL**: Armazena números de ponto flutuante com menos precisão.
  ```sql
  CREATE TABLE ExemploREAL (MedidaReal REAL);
  ```

#### Tipos de Data e Hora:

- **DATE**: Armazena apenas datas.
  ```sql
  CREATE TABLE ExemploDATE (DataNascimento DATE);
  ```

- **DATETIME**: Armazena data e hora.
  ```sql
  CREATE TABLE ExemploDATETIME (DataHoraRegistro DATETIME);
  ```

- **DATETIME2**: Armazena data e hora com mais precisão.
  ```sql
  CREATE TABLE ExemploDATETIME2 (DataHoraPrecisa DATETIME2);
  ```

- **TIME**: Armazena apenas a hora.
  ```sql
  CREATE TABLE ExemploTIME (HoraRegistro TIME);
  ```

- **SMALLDATETIME**: Armazena data e hora com menos precisão.
  ```sql
  CREATE TABLE ExemploSMALLDATETIME (DataHoraSimples SMALLDATETIME);
  ```

- **DATETIMEOFFSET**: Armazena data, hora e o fuso horário.
  ```sql
  CREATE TABLE ExemploDATETIMEOFFSET (DataHoraFuso DATETIMEOFFSET);
  ```

#### Tipos de Caracteres:

- **CHAR**: Armazena caracteres fixos.
  ```sql
  CREATE TABLE ExemploCHAR (Codigo CHAR(5));
  ```

- **VARCHAR**: Armazena caracteres variáveis.
  ```sql
  CREATE TABLE ExemploVARCHAR (Nome VARCHAR(100));
  ```

- **TEXT**: Armazena texto longo.
  ```sql
  CREATE TABLE ExemploTEXT (Descricao TEXT);
  ```

- **NCHAR**: Armazena caracteres fixos em Unicode.
  ```sql
  CREATE TABLE ExemploNCHAR (CodigoNCHAR NCHAR(5));
  ```

- **NVARCHAR**: Armazena caracteres variáveis em Unicode.
  ```sql
  CREATE TABLE ExemploNVARCHAR (NomeUnicode NVARCHAR(100));
  ```

- **NTEXT**: Armazena texto longo em Unicode.
  ```sql
  CREATE TABLE ExemploNTEXT (DescricaoUnicode NTEXT);
  ```

#### Tipos Binários:

- **BINARY**: Armazena dados binários fixos.
  ```sql
  CREATE TABLE ExemploBINARY (DadosBinarios BINARY(10));
  ```

- **VARBINARY**: Armazena dados binários variáveis.
  ```sql
  CREATE TABLE ExemploVARBINARY (DadosVariaveis VARBINARY(MAX));
  ```

- **IMAGE**: Armazena imagens ou dados binários.
  ```sql
  CREATE TABLE ExemploIMAGE (Foto IMAGE);
  ```

#### Outros Tipos:

- **BIT**: Armazena valores booleanos (0 ou 1).
  ```sql
  CREATE TABLE ExemploBIT (Ativo BIT);
  ```

- **UNIQUEIDENTIFIER**: Armazena identificadores únicos (GUID).
  ```sql
  CREATE TABLE ExemploUNIQUEIDENTIFIER (Identificador UNIQUEIDENTIFIER);
  ```

- **XML**: Armazena dados XML.
  ```sql
  CREATE TABLE ExemploXML (DadosXML XML);
  ```

- **CURSOR**: Armazena uma referência a um cursor.
  (Geralmente usado em programação e não diretamente como tipo de coluna)

- **SQL_VARIANT**: Armazena valores de diversos tipos.
  ```sql
  CREATE TABLE ExemploSQL_VARIANT (Dado SQL_VARIANT);
  ```

- **TABLE**: Tipo especial usado para armazenar um resultado temporário.
  (Geralmente usado em programação e não diretamente como tipo de coluna)

### Exemplos de Inserção de Dados para Cada Tipo (SQL Server):

#### Inserção em Tipos Numéricos:

- **INT**:
  ```sql
  INSERT INTO ExemploINT (ID) VALUES (1);
  ```

- **BIGINT**:
  ```sql
  INSERT INTO ExemploBIGINT (GrandeNumero) VALUES (1234567890123);
  ```

- **SMALLINT**:
  ```sql
  INSERT INTO ExemploSMALLINT (PequenoNumero) VALUES (32767);
  ```

- **TINYINT**:
  ```sql
  INSERT INTO ExemploTINYINT (NumeroMinimo) VALUES (255);
  ```

- **DECIMAL**:
  ```sql
  INSERT INTO ExemploDECIMAL (Preco) VALUES (12345.67);
  ```

- **NUMERIC**:
  ```sql
  INSERT INTO ExemploNUMERIC (Valor) VALUES (12345.67);
  ```

- **FLOAT**:
  ```sql
  INSERT INTO ExemploFLOAT (Medida) VALUES (3.14159);
  ```

- **REAL**:
  ```sql
  INSERT INTO ExemploREAL (MedidaReal) VALUES (3.14159);
  ```

#### Inserção em Tipos de Data e Hora:

- **DATE**:
  ```sql
  INSERT INTO ExemploDATE (DataNascimento) VALUES ('2000-01-01');
  ```

- **DATETIME**:
  ```sql
  INSERT INTO ExemploDATETIME (DataHoraRegistro) VALUES ('2022-01-01 12:00:00');
  ```

- **DATETIME2**:
  ```sql
  INSERT INTO ExemploDATETIME2 (DataHoraPrecisa) VALUES ('2022-01-01 12:00:00.1234567');
  ```

- **TIME**:
  ```sql
  INSERT INTO ExemploTIME (HoraRegistro) VALUES ('12:00:00');
  ```

- **SMALLDATETIME**:
  ```sql
  INSERT INTO ExemploSMALLDATETIME (DataHoraSimples) VALUES ('2022-01-01 12:00');
  ```

- **DATETIMEOFFSET**:
  ```sql
  INSERT INTO ExemploDATETIMEOFFSET (DataHoraFuso) VALUES ('2022-01-01 12:00:00 -05:00');
  ```

#### Inserção em Tipos de Caracteres:

- **CHAR**:
  ```sql
  INSERT INTO ExemploCHAR (Codigo) VALUES ('ABCDE');
  ```

- **VARCHAR**:
  ```sql
  INSERT INTO ExemploVARCHAR (Nome) VALUES ('John Doe');
  ```

- **TEXT**:
  ```sql
  INSERT INTO ExemploTEXT (Descricao) VALUES ('Este é um exemplo de inserção em uma coluna de texto.');
  ```

- **NCHAR**:
  ```sql
  INSERT INTO ExemploNCHAR (CodigoNCHAR) VALUES (N'ABCDE');
  ```

- **NVARCHAR**:
  ```sql
  INSERT INTO ExemploNVARCHAR (NomeUnicode) VALUES (N'John Doe');
  ```

- **NTEXT**:
  ```sql
  INSERT INTO ExemploNTEXT (DescricaoUnicode) VALUES (N'Este é um exemplo de inserção em uma coluna Unicode de texto.');
  ```

#### Inserção em Tipos Binários:

- **BINARY**:
  (Para este exemplo, usaremos 0x seguido dos valores em hexadecimal)
  ```sql
  INSERT INTO ExemploBINARY (DadosBinarios) VALUES (0x1234ABCD);
  ```

- **VARBINARY**:
  (Para este exemplo, usaremos 0x seguido dos valores em hexadecimal)
  ```sql
  INSERT INTO ExemploVARBINARY (DadosVariaveis) VALUES (0x1234ABCD);
  ```

- **IMAGE**:
  (Normalmente, a inserção de imagens envolve ler o arquivo da imagem e inseri-lo na coluna. Aqui está um exemplo simplificado usando hexadecimal.)
  ```sql
  INSERT INTO ExemploIMAGE (Foto) VALUES (0x1234ABCD);
  ```

#### Inserção em Outros Tipos:

- **BIT**:
  ```sql
  INSERT INTO ExemploBIT (Ativo) VALUES (1);  -- 1 significa verdadeiro, 0 significa falso
  ```

- **UNIQUEIDENTIFIER**:
  (Para este exemplo, usaremos NEWID() para gerar um novo GUID)
  ```sql
  INSERT INTO ExemploUNIQUEIDENTIFIER (Identificador) VALUES (NEWID());
  ```

- **XML**:
  ```sql
  INSERT INTO ExemploXML (DadosXML) VALUES ('<root><elemento>Texto</elemento></root>');
  ```

- **SQL_VARIANT**:
  (Pode armazenar dados de diferentes tipos)
  ```sql
  INSERT INTO ExemploSQL_VARIANT (Dado) VALUES ('Texto');
  INSERT INTO ExemploSQL_VARIANT (Dado) VALUES (12345);
  ```
 
