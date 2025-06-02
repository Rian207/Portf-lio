--Cria��o do Banco de Dados
CREATE DATABASE PIM_TERCEIRO_SEMESTRE;

USE PIM_TERCEIRO_SEMESTRE;

--CRIA��O DA TABELA "Tipos de usu�rio"
CREATE TABLE TBtipos_usuario
(
id_tipo_usuario INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
tipo_usuario VARCHAR(50) NOT NULL
);


--INSER��O DE DADOS NA TABELA "Tipos de usu�rio"
INSERT INTO TBtipos_usuario(tipo_usuario)
VALUES 
('Colaborador'),
('T�cnico');

SELECT * FROM TBtipos_usuario;

--CRIA��O DA TABELA "Usu�rios"
CREATE TABLE TBusuarios
(
id_usuario INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
FK_tipo_usuario INT,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
senha VARCHAR(100) NOT NULL

--ESTABELECENDO O RELACIONAMENTO COM A TABELA "Tipos de usu�rio"
CONSTRAINT FK_usuario_tipo
FOREIGN KEY(FK_tipo_usuario)
REFERENCES TBtipos_usuario(id_tipo_usuario)
);

--INSER��O DE DADOS NA TABELA "Usu�rios"
INSERT INTO TBusuarios(FK_tipo_usuario,nome,email,senha)
VALUES
(1,'Rian','rian@teste.com','1234'),
(2,'Daniel','daniel@teste.com','1234');


SELECT * FROM TBusuarios;

--CRIA��O DA TABELA "Relat�rios"

CREATE TABLE TBrelatorios
(
id_relatorio INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
FK_usuario INT,
data_emissao DATETIME NOT NULL

--ESTABELECENDO O RELACIONAMENTO COM A TABELA "Usu�rios"
CONSTRAINT FK_usuario_emissor
FOREIGN KEY(FK_usuario)
REFERENCES TBusuarios(id_usuario)
);

--INSER��O DE DADOS NA TABELA "Relat�rios"
INSERT INTO TBrelatorios(FK_usuario,data_emissao)
VALUES
(3,GETDATE());


SELECT * FROM TBrelatorios;

--CRIA��O DA TABELA "N�veis de prioridade"

CREATE TABLE TBniveis_prioridade
(
id_prioridade INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
prioridade VARCHAR(50)NOT NULL
);

--INSER��O DE DADOS NA TABELA "N�veis de prioridade"
INSERT INTO TBniveis_prioridade(prioridade)
VALUES
('Alta'),('M�dia'),('Baixa');

SELECT * FROM TBniveis_prioridade;



