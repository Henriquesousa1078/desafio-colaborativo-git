-- criação das tabelas veiculos, clientes, vendedores e vendar

CREATE TABLE veiculos (
  id_veiculo INTEGER PRIMARY KEY,
  modelo_veiculo TEXT,
  marca_veiculo TEXT, 
  ano_veiculo integer,
  preco_veiculo integer
);
alter table veiculos add cor text;

CREATE TABLE clientes (
  id_cliente integer primary key,
  nome_cliente text,
  telefone bigint,
  cpf bigint
);

CREATE table vendedores (
  id_vendedor integer primary key,
  nome_vendedor text,
  comissao float
);

CREATE TABLE vendas (
  id_venda integer primary key,
  data_venda date,
  valor_final integer,

  veiculo_id integer,
  cliente_id integer,
  vendedor_id integer,

  foreign key (veiculo_id) references veiculos(id_veiculo),
  foreign key (cliente_id) references clientes(id_cliente),
  foreign key (vendedor_id) references vendedores(id_vendedor)
);

-- inserção dos atributos na tabela veiculos

insert into veiculos values (1,"Corola", "Toyota", 2022, 95000, "Preto"),
(2, "Civic", "Honda",2023, 105000, "Branco"),
(3, "Onix", "Chevrolet", 2021, 75000, "Prata");

-- inserção dos atributos na tabela clientes 

insert into clientes values (1,"Carlos Silva", 6198888777777),
(2,"Ana Souza", 61999996666666),
(3, "João Pereira", 6188888855555555);

update clientes set telefone = 61777774444 where id_cliente = 3;
-- inserção dos atributos na tabela vendedores

insert into vendedores values (1, "Fernanda LIma", 0.05),
(2,"Roberto Carlos", 0.04);

-- inserção dos atributos na tabela vendas

insert into vendas values (1, "2025-05-20", 93000,1,1,1),
(2, "2025-05-22", 102000,2,2,2),
(3, "2025-05-23", 74000, 3,3,1);

delete from  vendas where id_venda = 3;

select data_venda, 
valor_final, 
nome_vendedor as vendedor,
nome_cliente as cliente,
modelo_veiculo as modelo,
marca_veiculo as marca
from vendas
inner join vendedores on vendedor_id = vendedores.id_vendedor
inner join clientes  on cliente_id = clientes.id_cliente
inner join veiculos on veiculo_id = veiculos.id_veiculo;