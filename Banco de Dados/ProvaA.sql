drop database if exists estacionamento;
-- 1. Criar a base de dados para o esquema (valor: 0,1 pt)
create database estacionamento;
use estacionamento;

-- 2. Criar a estrutura do esquema, com as tabelas (considerando o uso adequado dos data types do MySQL para os
-- campos), implementando devidamente as restrições (constraints) (valor: 1,0 pt)
create table marca (
id int auto_increment primary key,
nome varchar(50) not null);

create table carro (
placa varchar(7) primary key,
marca_id int,
descricao varchar(50),
foreign key (marca_id) references marca(id)
);

create table permanencia (
id int auto_increment primary key,
carro_placa varchar(7),
entrada datetime,
saida datetime,
valorPago numeric(4,2),
foreign key (carro_placa) references carro(placa)
);

-- 3. Inserir os seguintes registros nas respectivas tabelas: (valor: 0,5 pt)
insert into marca
(nome)
values
('FIAT'),
('Volkswagen');

insert into carro
(placa, marca_id, descricao)
values
('ABC1234', 1, 'Argo'),
('DEF5678', 1, 'Palio'),
('GHI4321', 2, 'Gol'),
('JKL9999', 2, 'Polo');

insert into permanencia
(carro_placa, entrada, saida, valorPago)
values
('ABC1234',  '2022-10-14 12:00', '2022-10-14 12:50', 11.00),
('DEF5678', '2022-10-14 09:00', '2022-10-14 10:00', 11.00),
('GHI4321', '2023-10-14 08:30', '2023-10-14 18:00', 20.00),
('GHI4321', '2023-10-16 08:40', '2023-10-16 18:15', 20.00),
('DEF5678', '2023-10-20 09:30', '2023-10-20 10:30', 12.00),
('ABC1234', '2023-11-20 12:10', '2023-11-20 13:00', 12.00);

-- 4. Alterar a placa do carro Polo de JKL9999 para JKL8765 (valor: 0,2 pt)
update carro
set placa = 'JKL8765'
where placa = 'JKL9999';

-- 5. Listar todos os dados de todos os carros cadastrados (valor: 0,3 pt)
select *
from carro;

-- 6. Listar a descricao e a placa de todos os carros, ordenando pela descricao (valor: 0,5 pt)
select descricao, placa
from carro
order by descricao;

-- 7. Listar a marca, a descricao e a placa dos carros (valor: 0,6 pt)
select M.nome, C.descricao, C.placa
from marca M
inner join carro C
on C.marca_id = M.id;

-- 8. Listar a placa dos carros que não tiveram nenhuma permanencia (valor: 0,5 pt)
select C.placa
from carro C
where C.placa not in 
(select carro_placa
from permanencia);

-- 9. Listar a descricao e a placa de cada carro, contando quantas vezes (quantas) o carro permaneceu (valor: 0,6 pt)
select C.descricao, C.placa, count(P.id) as quantidade
from carro C
left join permanencia P
on C.placa = P.carro_placa
group by C.descricao, C.placa;


-- 10. Listar o ano de permanencia (considerando a entrada) e a soma dos valores pagos (totalPago), agrupando por ano (valor: 0,7 pt)
select date_format(entrada, '%Y') as ano, sum(valorPago) valor
from permanencia
WHERE entrada
group by ano;

