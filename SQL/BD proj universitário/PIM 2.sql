--CRIA��O DA TABELA "Avalia��o"
CREATE TABLE TBavaliacao
(
id_avaliacao INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
descricao VARCHAR(50) NOT NULL
);

--INSER��O DE DADOS NA TABELA "Avalia��o"
INSERT INTO TBavaliacao(descricao)
VALUES
('Insatisfeito'),('Satisfeito'),('Muito satisfeito');

Select * from TBavaliacao;

--CRIA��O DA TABELA "Categorias"

CREATE TABLE TBcategorias
(
id_categoria INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
categoria VARCHAR(50) NOT NULL
);

--INSER��O DE DADOS NA TABELA "Categorias"
INSERT INTO TBcategorias(categoria)
VALUES
('Software'),('Hardware'),('Redes'),('Sistema interno'),('Acesso');

SELECT * FROM TBcategorias;

--CRIA��O DA TABELA "Status"
CREATE TABLE TBstatus
(
id_status INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
status VARCHAR(50) NOT NULL
);

--INSER��O DE DADOS NA TABELA "Status"
INSERT INTO TBstatus(status)
VALUES
('Aberto'),('Em andamento'),('Manuten��o'),('Finalizado');

SELECT * FROM TBstatus;

--CRIA��O DA TABELA "Chamados"
CREATE TABLE TBchamados
(
id_chamado INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
FK_usuario INT,
FK_categoria INT,
FK_prioridade INT,
FK_status INT,
FK_tecnico INT,
FK_avaliacao INT,
titulo VARCHAR(100) NOT NULL,
descricao TEXT NOT NULL,
Resolvido_IA BIT NOT NULL,
comentario_tecnico TEXT,
data_abertura DATETIME NOT NULL,
data_encerramento DATETIME NOT NULL,

--ESTABELECENDO RELACIONAMENTO COM A TABELA "Usu�rios"
CONSTRAINT FK_usuario_abertura FOREIGN KEY(FK_usuario) REFERENCES TBusuarios(id_usuario),

--ESTABELECENDO RELACIONAMENTO COM A TABELA "Categorias"
CONSTRAINT FK_categoria_chamado FOREIGN KEY(FK_categoria) REFERENCES TBcategorias(id_categoria),

--ESTABELECENDO RELACIONAMENTO COM A TABELA "N�veis de prioridade"
CONSTRAINT FK_prioridade_chamado FOREIGN KEY(FK_prioridade) REFERENCES TBniveis_prioridade(id_prioridade),

--ESTABELECENDO RELACIONAMENTO COM A TABELA "Status"
CONSTRAINT FK_status_chamado FOREIGN KEY(FK_status) REFERENCES TBstatus(id_status),

--ESTABELECENDO RELACIONAMENTO COM A TABELA "Usu�rios" para encontrar os t�cnicos
CONSTRAINT FK_tecnico_chamado FOREIGN KEY(FK_tecnico) REFERENCES TBusuarios(id_usuario),

--ESTABELECENDO RELACIONAMENTO COM A TABELA "Avalia��o"
CONSTRAINT FK_avaliacao_chamado FOREIGN KEY(FK_avaliacao) REFERENCES TBavaliacao(id_avaliacao)
);

Select * from TBchamados;

--INSER��O DE DADOS NA TABELA "Chamados"
INSERT INTO TBchamados(FK_usuario,FK_categoria,FK_prioridade,FK_status,FK_tecnico,FK_avaliacao,titulo,
descricao,Resolvido_IA,comentario_tecnico,data_abertura,data_encerramento)

VALUES(
2,2,2,4,3,2,
'Teste','Teste',0,'Teste',GETDATE(),GETDATE());

SELECT * FROM TBchamados;


--CRIA��O DA TABELA "Respostas IA"
CREATE TABLE TBrespostas_ia
(
id_resposta INT PRIMARY KEY IDENTITY (1,1) NOT NULL,
FK_chamado INT UNIQUE,
resposta TEXT NOT NULL,
data_resposta DATETIME NOT NULL

--ESTABELECENDO O RELACIONAMENTO COM A TABELA "Chamados"
CONSTRAINT FK_ia_chamado
FOREIGN KEY(FK_chamado)
REFERENCES TBchamados(id_chamado)
);

--INSER��O DE DADOS NA TABELA "Respostas IA"
INSERT INTO TBrespostas_ia(FK_chamado,resposta,data_resposta)
VALUES
(9,'Teste',GETDATE());

SELECT * FROM TBrespostas_ia;