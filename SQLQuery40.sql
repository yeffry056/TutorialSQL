if object_id('clientes') is not null
  drop table clientes;

 create table clientes(
  codigo int not null,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  referenciadopor int,
  primary key(codigo)
 );

 insert into clientes values (50,'Juan Perez','Sucre 123','Cordoba',null);
 insert into clientes values(90,'Marta Juarez','Colon 345','Carlos Paz',null);
 insert into clientes values(110,'Fabian Torres','San Martin 987','Cordoba',50);
 insert into clientes values(125,'Susana Garcia','Colon 122','Carlos Paz',90);
 insert into clientes values(140,'Ana Herrero','Colon 890','Carlos Paz',9);

 alter table clientes
  add constraint FK_clientes_referenciadopor
  foreign key (referenciadopor)
  references clientes (codigo);

 update clientes set referenciadopor=90 where referenciadopor=9;

 alter table clientes
  add constraint FK_clientes_referenciadopor
  foreign key (referenciadopor)
  references clientes (codigo);

 exec sp_helpconstraint clientes;

 insert into clientes values(150,'Karina Gomez','Caseros 444','Cruz del Eje',8);

 update clientes set codigo=180 where codigo=90;

 delete from clientes where nombre='Marta Juarez';

 update clientes set codigo=180 where codigo=125;

 delete from clientes where codigo=110;