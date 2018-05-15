Create DATABASE imobiliariadb;
USE imobiliariadb;

CREATE TABLE imobiliariadb.USUARIO(
	idUsuario      INTEGER NOT NULL AUTO_INCREMENT,
	nome           VARCHAR(255),
        email          VARCHAR(255),
	login          VARCHAR(30),
	senha          VARCHAR(28),
	grupoFilial    VARCHAR(50),
	departamento   VARCHAR(50),
	cargo          VARCHAR(50),
        enable         BOOLEAN,	
        CONSTRAINT PK_USUARIO PRIMARY KEY (idUsuario)
);


CREATE TABLE imobiliariadb.CLIENTE(
	idCliente      INTEGER NOT NULL AUTO_INCREMENT,
	nome           VARCHAR(255),
	dataNasc       DATE,
	cpf            VARCHAR(11),
	sexo           VARCHAR(15),
	cep            VARCHAR(8),
	rua            VARCHAR(255),
	num            VARCHAR(10),
	complemento    VARCHAR(255),
	bairro         VARCHAR(255),
	cidade         VARCHAR(255),
	uf             VARCHAR(2),	
	telefone       VARCHAR(15),
	celular        VARCHAR(15),
	email          VARCHAR(255),
        enable         BOOLEAN,
        CONSTRAINT PK_CLIENTE PRIMARY KEY (idCliente)
	
);


CREATE TABLE imobiliariadb.IMOVEL (
	idImovel       INTEGER NOT NULL AUTO_INCREMENT,
	idCliente      INTEGER NOT NULL,
	codImovel      VARCHAR(255) NOT NULL,
	dataCad        DATE NOT NULL,
	categoria      VARCHAR(255),
	tipo           VARCHAR(255),
	quartos        INTEGER,
	banheiros      INTEGER,
	suites         INTEGER,
	vagasGaragem   INTEGER,
	areaUtil       DOUBLE,
	areaTotal      DOUBLE,
	informacao     VARCHAR(255),
	cep            VARCHAR(8),
	rua            VARCHAR(255),
	num            VARCHAR(10),
	complemento    VARCHAR(255),
	bairro         VARCHAR(255),
	cidade         VARCHAR(255),
	uf             VARCHAR(2),
	valorVenda     DOUBLE,
        valorAluguel   DOUBLE,
	condominio     DOUBLE,
	iptu           DOUBLE,
	situacao       VARCHAR(255),
        servico        VARCHAR(50),
	enable         BOOLEAN,
	CONSTRAINT PK_IMOVEL PRIMARY KEY (idImovel),
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
);


CREATE TABLE imobiliariadb.CONTRATO (
	idContrato     INTEGER NOT NULL AUTO_INCREMENT,
	codContrato    VARCHAR(255) NOT NULL,
	idImovel       INTEGER NOT NULL,
	idCliente      INTEGER NOT NULL,
	dataContrato   DATE NOT NULL,	
	dataInicial    DATE,
	dataFinal      DATE,
	enable         BOOLEAN,
	CONSTRAINT PK_IMOVEL PRIMARY KEY (idContrato),
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente),
	FOREIGN KEY(idImovel) REFERENCES imovel(idImovel)
);



INSERT INTO imobiliariadb.USUARIO (nome,login,senha,email,grupoFilial,departamento,cargo,enable) VALUES
("Jonas Araujo","jonas.araujo","jonas","jonas@jonas.com","Sao Paulo","","",true),
("Bruna Sayuri","bruna.sayuri","bruna","bruna@bruna.com","Rio de Janeiro","","",true),
("Rodrigo Normando","rodrigo.normando","rodrigo","rodrigo@rodrigo.com","Sao Paulo","","",true);
INSERT INTO imobiliariadb.USUARIO (nome,login,senha,email,grupoFilial,departamento,cargo,enable) VALUES
("Luana Monteiro", "luana.monteiro", "luana","luana@monteiro.com", "Sao Paulo","","", true);

INSERT INTO imobiliariadb.CLIENTE(cpf,nome,dataNasc,sexo,telefone,celular,email,cep,rua,bairro,cidade,uf,num,complemento,enable) VALUES
("99991111111","kunieda aoi","1996-07-17","fem","1155554444","11944445555","aoi@aoi.com","04444000","","","","","","",true);

INSERT INTO imobiliariadb.IMOVEL(idCliente,codImovel,dataCad,categoria,tipo,
quartos,banheiros,suites,vagasGaragem,areaUtil,areaTotal,informacao,
cep,rua,num,bairro,cidade,uf,valorVenda,valorAluguel,iptu,situacao,enable)
VALUES (1,"codTeste","2018-05-08","residencial","casa",3,2,1,2,100,200,"aloaloaloalo",
"04444000","rua teste","20","bairrozin","sao paulo","sp",250000,2500,200,"livre",true);

select * from usuario;