use sistema_padaria;

insert into produto(id_produto, nome, preco)
values (2, 'Jujuba', 10.50);

insert into cliente(id_cliente,cpf)
values (2,'12345678912');

values (2, 'Jujuba', 10.50);
select * from produto where nome = 'Caneta'
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

alter table emprestimo
add registro_livro nome varchar(10);

ALTER TABLE emprestimo
ADD registro_livro int DEFAULT 1;