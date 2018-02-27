CREATE DATABASE agendadb;

USE agendadb;

CREATE TABLE agendadb.PESSOA(
id bigint not null auto_increment,
nome varchar (100) not null,
dtnasc date null,
constraint PK_PESSOA primary key (id)
);

CREATE TABLE agendadb.CONTATO(
id bigint not null auto_increment,
tipo smallint null,
valor varchar (100) not null,
idpessoa bigint not null,
constraint PK_CONTATO primary key (id),
constraint FK_PESSOA foreign key (idpessoa) references agendadb.PESSOA(id)
);

INSERT INTO agendadb.PESSOA (nome,dtnasc) VALUES ('Luana Monteiro','1995-10-06'),('Jeferson Monteiro','1998-11-05');
INSERT INTO agendadb.PESSOA (nome,dtnasc) VALUES ('Jonas Araujo','1995-09-25');