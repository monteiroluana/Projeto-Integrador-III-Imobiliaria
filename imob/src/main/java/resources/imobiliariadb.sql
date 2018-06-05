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
	cpf            VARCHAR(11) NOT NULL,	
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
        idUsuario      INTEGER NOT NULL,
	dataContrato   DATE NOT NULL,	
	dataInicial    DATE,
	dataFinal      DATE,
	CONSTRAINT PK_IMOVEL PRIMARY KEY (idContrato),
	FOREIGN KEY(idCliente) REFERENCES cliente(idCliente),
	FOREIGN KEY(idImovel) REFERENCES imovel(idImovel),
        FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario)
);


INSERT INTO imobiliariadb.USUARIO (nome,login,senha,email,grupoFilial,departamento,cargo,enable) VALUES
("Jonas Araujo","jonas.araujo","jonas","jonas@jonas.com","Sao Paulo","Diretoria","Diretor(a)",true),
("Bruna Sayuri","bruna.sayuri","bruna","bruna@bruna.com","Porto Alegre","TI","Suporte Técnico",true),
("Rodrigo Normando","rodrigo.normando","rodrigo","rodrigo@rodrigo.com","Sao Paulo","Vendas","Gerente",true),
("Luana Monteiro", "luana.monteiro", "luana","luana@monteiro.com", "Recife","TI","Gerente", true),
("Pedro Henrique", "pedro.henrique", "pedro","pedro@henrique.com", "Recife","Retaguarda","Backoffice", true);

INSERT INTO imobiliariadb.CLIENTE(cpf,nome,dataNasc,telefone,celular,email,cep,rua,bairro,cidade,uf,num,complemento,enable) VALUES
("99991111111","Kunieda Aoi","1996-07-17","1155554444","11944445555","aoi@aoi.com","04444000","rua aaa","Santo Amaro","São Paulo","SP","300","",true),
("12345678900","Joao da Silva","2000-05-01","556415967","95369874","joao@silva.com","08888000","rua bbb","Boa Viagem","Recife","PE","400","",true),
("80495398063","Maria Souza","1990-10-20","55988551","95487150","maria@souza.com","02222000","rua bbb","Santa Teresa","Porto Alegre","RS","500","",true);

INSERT INTO imobiliariadb.IMOVEL(idCliente,codImovel,dataCad,categoria,tipo,
quartos,banheiros,suites,vagasGaragem,areaUtil,areaTotal,informacao,
cep,rua,num,bairro,cidade,uf,valorVenda,valorAluguel,iptu,servico,enable) VALUES 
(1,"50","2018-05-08","Residencial","Casa",3,2,1,2,100,200,"aloaloaloalo",
"08962000","rua teste","20","bairrozin","São Paulo","SP",250000,0,1000,"Venda",true), 
(2,"70","2018-06-05","Comercial","Apartamento",3,2,1,2,100,200,"",
"07777000","avenida aleatoria","55","Boa Viagem","Recife","PE",0,2000,800,"Aluguel",true),
(3,"80","2018-10-20","Residencial","Terreno",0,0,0,0,0,250,"",
"06666000","estrada nenhuma","100","Santa Teresa","Porto Alegre","RS",200000,000,1500,"Venda",true),
(1,"90","2018-01-05","Comercial","Apartamento",3,2,1,2,100,200,"",
"07777000","avenida Santo Amaro","55","Santo Amaro","Sao Paulo","SP",0,10000,780,"Venda",true),
(3,"100","2018-11-20","Residencial","Terreno",0,0,0,0,0,250,"",
"06666000","av santa teresa","9","Santa Teresa","Porto Alegre","RS",150000,000,3000,"Aluguel",true);

INSERT INTO contrato (idContrato,codContrato,idImovel,idCliente,idUsuario,dataContrato, dataInicial, dataFinal) 
VALUES (1,111,1,1,1,'2018-06-05','2018-06-05','2019-06-05'),
(2,222,2,2,3,'2018-05-01','2018-05-01','2019-05-01'),
(3,333,3,3,5,'2018-09-15','2018-09-20','2019-09-20'),
(4,444,4,1,3,'2018-03-01','2018-03-01','2019-03-01'),
(5,555,5,3,5,'2018-12-15','2018-12-20','2019-12-20');  
