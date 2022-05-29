create database banco_igrejas
default character set utf8
default collate utf8_general_ci;
use banco_igrejas;

create table Igreja(
	id_igreja int auto_increment primary key,
	Nome_igreja varchar(50) unique not null,
	CNPJ varchar(15),
	Endereco varchar(150)
);

create table Pessoa(
	id_pessoa int auto_increment primary key,
    Nome varchar(50) not null,
	CPF varchar(14),
    Data_Nasc date,
    Sexo varchar(1),
    Endereco varchar(150),
    Telefone varchar(15),
    Data_Batismo date,
    Estado_civil varchar(15),
    igreja int not null,
    foreign key (igreja) references igreja(id_igreja)
);

create table Cargo(
id_cargo int auto_increment primary key,
Nome_cargo varchar(15)
);

create table Pessoa_Cargo(
Pessoa int not null, 
foreign key (Pessoa) references Pessoa(id_pessoa),
Cargo int not null,
foreign key (Cargo) references Cargo(id_cargo) 
);

create table dizimo(
Pessoa int not null,
foreign key (Pessoa) references Pessoa(id_Pessoa),
Valor_dizimo mediumint,
Data_dizimo date
);

create table Agendamento_Pastoral(
id_agendamento int auto_increment primary key,
Pessoa_Pastor int,
foreign key (Pessoa_Pastor) references Pessoa(id_pessoa),
Pessoa_aconselhada int,
foreign key (Pessoa_aconselhada) references Pessoa(id_pessoa) ,
Data_Aconselhamento date,
Hora_Inicio Time,
Hora_Fim Time,
Local_aconselhamento varchar(150) 
);

insert into igreja 
	(Nome, CNPJ, Endereco) 
values
	("Fogo_Do_Espirito", "19329800000189", "Rua Magalhães Couto, 690");

insert into igreja 
	(Nome, CNPJ, Endereco) 
values
	("Água_da_vida", "74899817000180", "Rua Argentina Reis, 745");
    
insert into igreja 
	(Nome, CNPJ, Endereco) 
values
	("Terra_Santa", "52483677000121", "Travessa Ozório Agostinho Rocancourt, 164");   
    
insert into pessoa    
    (Nome, CPF, Data_Nasc, Sexo, Endereco, Telefone, Data_Batismo, Estado_civil, igreja)
values
	("Celia Calixto Giacomini", "577.461.237-67", "1995-04-24", "F", "Rua Coronel José Fernando Bruno", "(21) 98086-1478", "2015-04-13", "Viuvo", 3),
    ("Ataíde Paes Albuquerque", "643.362.557-68", "1947-06-07", "M", "Rua Belmiro Braga", "(21) 98616-2430", "1993-04-06", "Viuvo", 1),
    ("Valdeli Farinha Nepomuceno", "604.525.347-71", "1968-02-02","M", "Adro de São Francisco", "(21) 96898-5832", "1997-01-10", "Casado", "2"),
    ("Luiza Trancoso Negris", "368.681.377-70", "1970-12-28", "F", "Rua Eva Araújo dos Santos", "(21) 97627-6584", "2002-04-13", "Casado", "3"),
    ("João Albuquerque Chaves", "476.655.767-02", "1954-08-01", "M", "Rua Dois - Volta Redonda", "(21) 98673-2414", "2007-05-08", "Casado", "1"),
    ("Cristiane Nazare Marques", "612.076.767-30", "2012-01-17", "F", "Praça Peri - Belford Roxo", "(21) 97626-4402", "2022-02-08", "Solteiro", "2"),
    ("Rodrigo Salomão Morais", "244.235.247-83", "1950-08-19", "M", "Rua Iracema", "(21) 98340-7188", "1997-07-05", "Casado", "3"),
    ("Reginaldo Terra Darmont", "454.468.087-54", "1994-08-29", "M", "Vila São Luís", "(21) 98980-2118", "2010-03-09", "Casado", "1"),
    ("Edmilson Chiles Correia", "837.511.487-10", "1972-03-08", "M", "Vale do Paraíba", "(21) 98961-1869", "2001-04-06", "Viuvo", "2"),
	("Herisomar Dutra Lucas", "548.684.837-49", "1958-09-12", "M", "Barra Mansa", "(21) 98131-6132", "1992-09-02", "Viuvo", "3"),
    ("Fabricio Marotti Paes", "076.357.437-67", "1992-12-20", "M", "Rua Lopo Saraiva", "(21) 99971-8274", "2005-03-07", "Solteiro", "1"),
    ("João Carvalheiro Schuenck", "500.512.477-20", "1982-10-12", "M", "Estrada do Cantagalo", "(21) 3256-7576", "2004-05-07", "Casado", "2"),
    ("Maria Beatriz Vasconcelos Prata", "893.434.737-61", "1989-09-28", "F", "Rua Veríssimo de Souza", "(21) 98497-3878", "2001-01-07", "Casado", "3"),
    ("Wellington Guzzo Luques", "458.456.477-97", "1951-09-09", "M", "Rua Humberto Augusto", "(21) 3242-4525", "1983-06-02", "Divorciado", "1"),
    ("Aledio Bragança Paulo", "513.687.417-11", "1966-04-23", "M", "Rua Pastor João Barreto", "(21) 97381-7649", "1994-03-01", "Casado", "2"),
    ("Lucy Furtunato Silveira", "611.640.577-07", "1982-06-05", "F", "Jardim Metrópole", "(21) 3841-7568", "2003-07-25", "Casada", "3"),
    ("João Goulart Costa", "447.307.417-06", "2001-10-07", "M", "São João de Meriti", "(21) 98336-6473", "2020-04-10", "Solteiro", "1"),
    ("Suenia Trancoso Caruso", "741.689.317-81", "2002-05-22", "F", "Barro Branco", "(21) 2458-2605", "2022-01-04", "Solteiro", "2"),
	("JOSE CAMPOS ALMEIDA","112.035.567-13", "1954-09-24", "M","Rua Beira-Rio","(21) 99567-2817", "2019-04-13", "Solteiro", 1),
	("Evelyn Falcão Knupp", "755.216.677-09", "1995-12-12", "F", "Vila Luisa", "(22) 98773-7412", "2020-05-12", "Casada", 2);

insert into cargo
(Nome_cargo)
values
("Pastor"),
 ("Diácono"), 
 ("Presbítero"), 
 ("Tesoureiro"), 
 ("Secretário");

insert into pessoa_cargo
(Pessoa, Cargo)
values
(9, 1);

insert into pessoa_cargo
(pessoa, Cargo)
values
(11, 1), (12, 1),
(13, 2), (4, 2),
(14, 3),(1, 3),(17, 3),
(16, 4),(17, 4),
(13, 5),(2, 5),(20, 5);

insert into agendamento_pastoral
(Pessoa_Pastor, Pessoa_aconselhada, Data_Aconselhamento, Hora_Inicio, Hora_Fim, Local_aconselhamento)
Values
(9, 3, "2022-06-03", "18:00", "19:00", "Igreja Terra Santa"),
(9, 18, "2022-06-06", "19:00", "20:00", "Igreja Terra Santa"),
(9, 6, "2022-06-08", "20:00", "21:00", "Igreja Terra Santa"),
(9, 15, "2022-06-10", "18:00", "19:00", "Igreja Terra Santa"),
(9, 18, "2022-06-13", "19:00", "20:00", "Igreja Terra Santa"),
(9, 15, "2022-06-15", "20:00", "21:00", "Igreja Terra Santa"),
(9, 6, "2022-06-17", "18:00", "19:00", "Igreja Terra Santa"),
(9, 18, "2022-06-20", "19:00", "20:00", "Igreja Terra Santa"),
(9, 3, "2022-06-22", "20:00", "21:00", "Igreja Terra Santa"),
(9, 6, "2022-06-26", "18:00", "19:00", "Igreja Terra Santa"),

(11, 17, "2022-06-03","17:00", "18:00",  "Igreja Água da Vida"),
(11, 8, "2022-06-06","18:00", "19:00",  "Igreja Água da Vida"),
(11, 2, "2022-06-08","16:00", "17:00",  "Igreja Água da Vida"),
(11, 14, "2022-06-10","17:00", "18:00",  "Igreja Água da Vida"),
(11, 20, "2022-06-13","18:00", "19:00",  "Igreja Água da Vida"),
(11, 5, "2022-06-15","16:00", "17:00",  "Igreja Água da Vida"),
(11, 2, "2022-06-17","17:00", "18:00",  "Igreja Água da Vida"),
(11, 20, "2022-06-20","18:00", "19:00",  "Igreja Água da Vida"),
(11, 14, "2022-06-22","16:00", "17:00",  "Igreja Água da Vida"),
(11, 8, "2022-06-26","17:00", "18:00",  "Igreja Água da Vida"),

(12, 7, "2022-06-03", "13:00", "14:00", "Igreja Fogo do Espírito"),
(12, 19, "2022-06-06", "14:00", "15:00", "Igreja Fogo do Espírito"),
(12, 10, "2022-06-08", "15:00", "16:00", "Igreja Fogo do Espírito"),
(12, 4, "2022-06-10", "13:00", "14:00", "Igreja Fogo do Espírito"),
(12, 13, "2022-06-13", "14:00", "15:00", "Igreja Fogo do Espírito"),
(12, 19, "2022-06-15", "15:00", "16:00", "Igreja Fogo do Espírito"),
(12, 1, "2022-06-17", "13:00", "14:00", "Igreja Fogo do Espírito"),
(12, 16, "2022-06-20", "14:00", "15:00", "Igreja Fogo do Espírito"),
(12, 7, "2022-06-22", "15:00", "16:00", "Igreja Fogo do Espírito"),
(12, 4, "2022-06-26", "13:00", "14:00", "Igreja Fogo do Espírito");

insert into dizimo
(Pessoa, Valor_dizimo, Data_dizimo)
values
(5, "200.00", "2022-02-01"),
(4, "350.00", "2022-03-15"),
(1, "400.00", "2022-03-06"),
(2, "500.00", "2022-03-13"),
(3, "320.00", "2022-03-20"),
(4, "1000.00", "2022-03-27"),
(6, "930.00", "2022-03-06"),
(7, "630.00", "2022-03-13"),
(9, "210.00", "2022-03-20"),
(10, "490.00", "2022-03-27"),
(11, "300.00", "2022-03-06"),
(12, "260.00", "2022-03-13"),
(13, "510.00", "2022-03-20"),
(14, "270.00","2022-03-27"),
(15, "330.00", "2022-03-06"),
(16, "630.00", "2022-03-13"),
(17, "780.00", "2022-03-20"),
(18, "8000.00", "2022-03-27"),
(20, "800.00", "2022-03-06"),
(1, "400.00", "2022-04-03"),
(2, "500.00", "2022-04-10"),
(3, "320.00", "2022-04-17"),
(4, "1500.00", "2022-04-24"),
(6, "930.00", "2022-04-03"),
(7, "630.00", "2022-04-10"),
(9, "210.00", "2022-04-17"),
(10, "490.00", "2022-04-24"),
(11, "300.00", "2022-04-03"),
(12, "260.00", "2022-04-10"),
(13, "510.00", "2022-04-17"),
(14, "270.00","2022-04-24"),
(15, "330.00", "2022-04-03"),
(16, "630.00", "2022-04-10"),
(17, "780.00", "2022-04-17"),
(18, "900.00", "2022-04-24"),
(20, "800.00", "2022-04-03"),
(1, "400.00", "2022-05-01"),
(2, "500.00", "2022-05-08"),
(3, "320.00", "2022-05-15"),
(4, "1000.00", "2022-05-22"),
(6, "930.00", "2022-05-29"),
(7, "630.00", "2022-05-01"),
(9, "210.00", "2022-05-08"),
(10, "490.00", "2022-05-15"),
(11, "300.00", "2022-05-22"),
(4,"1700.00", "2022-05-01"),
(12, "260.00", "2022-05-29"),
(13, "510.00", "2022-05-01"),
(14, "270.00","2022-05-08"),
(15, "330.00", "2022-05-15"),
(16, "630.00", "2022-05-22"),
(17, "780.00", "2022-05-29"),
(4,"1600.00", "2022-05-08"),
(18, "900.00", "2022-05-01"),
(20, "800.00", "2022-05-08"),
(1, "400.00", "2022-05-15")
;

#Relatório dos membros que possuem o nome “João”
select * from pessoa where nome like "%João%";

#Relatório com a quantidade de membros de uma igreja
select B.Nome, sum(igreja ) as Quantidade_Membros
from pessoa as A
inner join igreja as B
on A.igreja = B.Id_igreja
group by igreja;

#Relatório dos membros que dizimaram no mês de maio de 2022
select P.nome as Membro, D.Data_dizimo as Data
from pessoa as P
inner join dizimo as D
on P.id_pessoa = D.pessoa
where month(data_dizimo) = 05
group by membro;

#Relatório dos membros presbíteros
select Nome, Nome_cargo as Cargo
from pessoa
inner join pessoa_cargo
on pessoa.id_pessoa = pessoa_cargo.pessoa
inner join cargo
on cargo.id_cargo = pessoa_cargo.cargo
having (cargo) = "Presbítero";

#Relatório com os agendamentos pastorais de junho, contendo pessoas e horário do aconselhamento
select pastor.Nome as Pastor, aconselhada.Nome as Pessoa_aconselhada, Data_Aconselhamento, Hora_Inicio, Hora_Fim, Local_aconselhamento
from pessoa as pastor
inner join agendamento_pastoral as AP
on  pastor.id_pessoa = AP.Pessoa_Pastor
inner join pessoa as aconselhada
on aconselhada.id_pessoa = AP.Pessoa_aconselhada 
where month(Data_Aconselhamento) = 06;

#Pessoas que nunca dizimaram
select nome as Membros_que_nunca_dizimaram
from pessoa
left outer join dizimo 
on pessoa.id_pessoa = dizimo.pessoa
where dizimo.pessoa IS null; 

#Pessoa que mais dizimou no ano de 2022
select pessoa.nome, count(dizimo.Valor_dizimo) as Quantidade_de_dizimo
from pessoa
inner join dizimo
on pessoa.id_pessoa = dizimo.pessoa
where year (data_dizimo) = 2022
group by nome
order by Quantidade_de_dizimo desc;

