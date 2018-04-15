Create DATABASE imobiliariadb;
USE imobiliariadb;

CREATE TABLE imobiliariadb.USUARIO(
	idUsuario INTEGER NOT NULL AUTO_INCREMENT,
	nome varchar(255),
	login varchar(30),
	senha varchar (28),
        email varchar (30),
	grupoFilial varchar(50),
	departamento varchar(50),
	cargo varchar(50),	
        CONSTRAINT PK_USUARIO PRIMARY KEY (idUsuario)
);


CREATE TABLE imobiliariadb.CLIENTE(
	idCliente INTEGER NOT NULL AUTO_INCREMENT,
	cpf varchar(11),
	nome varchar(255),
	dataNasc date,
	sexo varchar(15),
	telefone varchar(15),
	celular varchar(15),
	email varchar(255),
	cep varchar(8),
	endereco varchar(255),
	bairro varchar(255),
	cidade varchar(255),
	uf varchar(20),
	num varchar(10),
	complemento varchar(255),
        CONSTRAINT PK_CLIENTE PRIMARY KEY (idCliente)
	
);


INSERT INTO imobiliariadb.USUARIO (nome,login,senha,grupoFilial,departamento,cargo) VALUES
("Jonas Araujo","jonas.araujo","jonas","SãoPaulo","",""),
("Bruna Sayuri","bruna.sayuri","bruna","RioDeJaneiro","","" ),
("Rodrigo Normando","rodrigo.normando","rodrigo","SãoPaulo","","");

INSERT INTO imobiliariadb.CLIENTE(cpf,nome,dataNasc,sexo,telefone,celular,email,cep,endereco,bairro,cidade,uf,num,complemento) VALUES
("111111111122","kunieda aoi","1996-07-17","fem","1155554444","11944445555","aoi@aoi.com","04444000","","","","","","");


SELECT * FROM USUARIO;

SELECT * FROM CLIENTE;