use sistema_padaria;

insert into produto(id_produto, nome, preco)
values (2, 'Jujuba', 10.50);

SELECT * FROM produto

create table podcast(
	id_podcast int primary key,
	nome varchar(10)
);

alter table podcast 
ALTER COLUMN nome int;


create table bate_papo(
	id_batepapo int primary key,
	id_podcast int
	foreign key (id_podcast) references podcast(id_podcast)
);

