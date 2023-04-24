CREATE schema empresa;
 
 USE curso_sql;
 
 CREATE TABLE produto(
   codigo INT,
	nome VARCHAR(100),
	descricao VARCHAR(255)    
);

INSERT INTO produto (codigo, descricao, nome) 
VALUES (1, "Consul XPTO", "Geladeira");

CREATE TABLE atendimento( 
protocolo INT, situacao VARCHAR(20), 
data_atendimento DATETIME, 
titulo VARCHAR(100), 
descricao VARCHAR(255),
cliente_cpf CHAR(11) 
);

CREATE TABLE cliente(
    cpf CHAR(11),
    nome VARCHAR(100),
    end_estado CHAR(2),
    end_cidade VARCHAR(255),
    end_bairro VARCHAR(255),
    end_rua VARCHAR(255),
    end_num int
);

CREATE TABLE telefone (
    cliente_cpf CHAR(11),
    telefone CHAR(11)
);

INSERT INTO cliente (cpf, nome, end_estado, end_cidade, end_bairro, end_rua, end_num)
VALUES ("12345678900", "Ricardo Gomes", "CE", "Sobral", "Bairro do Sol", "Rua Jose Alves", 250);

INSERT INTO cliente (cpf, nome, end_estado, end_cidade, end_bairro, end_rua, end_num)
VALUES ("12345678900", "Ricardo Gomes", "CE", "Sobral", "Bairro do Sol", "Rua Jose Alves", 250);

INSERT INTO telefone
VALUE ("12345678900", "8599872322");

INSERT INTO atendimento (protocolo, situacao, data_atendimento, titulo, descricao, cliente_cpf)
VALUES ( 200 , "NOVO" ,  "2020-02-14", "Troca de geladeira",  "Defeito no termostato", "12345678900"),
( 201,"FINALIZADO"  ,"2020-02-15" ,"Problema Pagamento", "Cartao recusado", "12345678900");

select * from atendimento;
SELECT * FROM cliente;
SELECT * FROM produto;

create table cliente_produto(
	cliente_cpf varchar(11),
    produto_codigo int,
    data_compra DATETIME
);


INSERT INTO cliente_produto(cliente_cpf, produto_codigo, data_compra)
VALUES
("22222222222", 6732 , "2022-03-10"),
("11111111111", 4008 , "2022-01-22"),
("11111111111", 6732 , "2022-04-28"),
("33333333333", 4008 , "2021-12-22"),
("33333333333", 5120 , "2021-12-22");


INSERT INTO atendimento (protocolo, titulo, descricao, data_atendimento, situacao, cliente_cpf)
VALUES
( 201, "Devolucao", "Devolução de geladeira", "2022-04-10" ,"CONCLUIDO", "11111111111"),
( 202, "Duvida", "Duvida sobre garantia", "2022-05-13", "ANDAMENTO", "33333333333"),
( 203, "Pagamento", "Estorno de pagamento", "2022-05-19", "ANDAMENTO", "33333333333");


INSERT INTO cliente (cpf, nome, end_estado, end_cidade, end_bairro, end_num, end_rua)
VALUES
( 11111111111, "Bianca", "CE","CRATEUS","Rua Pedro", 500, "Venancios"),
( 22222222222,"Manoel","CE","SOBRAL","Rua Coronel Chico", 1233,"Jardins"),
( 33333333333, "Raquel","PI","PICOS","Rua Dr Pessoa",15,"Joquei");

INSERT INTO telefone ( cliente_cpf, telefone)
VALUE
("11111111111", "85999991111"),
("11111111111", "85988881111"),
("22222222222", "88989892222"),
("33333333333", "86983338833"),
("33333333333", "86999993333");

select * from atendimento;
SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM cliente_produto;

SET SQL_SAFE_UPDATES=0;
DELETE FROM cliente WHERE nome = "Ricardo Gomes";
 
INSERT INTO produto( codigo, nome, descricao)
VALUES
( 6732, "Geladeira Consul X3", "Geladeira - Consul Modelo X3 - Dual"),
( 5120, "Microondas LG Z4", "Microondas - LG Modelo Z4 - 20L - 2022"),
( 4008, "Playstation 5", "Sony - Playstation 5"); 