if object_id('clientes') is not null
  drop table clientes;
 if object_id('provincias') is not null
  drop table provincias;

 create table clientes (
  codigo int identity,
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(20),
  codigoprovincia tinyint,
  primary key(codigo)
 );

 create table provincias(
  codigo tinyint,
  nombre varchar(20),
  primary key (codigo)
 );

 insert into provincias values(1,'Cordoba');
 insert into provincias values(2,'Santa Fe');
 insert into provincias values(3,'Misiones');
 insert into provincias values(4,'Rio Negro');

 insert into clientes values('Perez Juan','San Martin 123','Carlos Paz',1);
 insert into clientes values('Moreno Marcos','Colon 234','Rosario',2);
 insert into clientes values('Garcia Juan','Sucre 345','Cordoba',1);
 insert into clientes values('Lopez Susana','Caseros 998','Posadas',3);
 insert into clientes values('Marcelo Moreno','Peru 876','Viedma',4);
 insert into clientes values('Lopez Sergio','Avellaneda 333','La Plata',5);

 alter table clientes
  add constraint FK_clientes_codigoprovincia
  foreign key (codigoprovincia)
  references provincias(codigo)
  on update cascade
  on delete cascade;

 alter table clientes
  with nocheck
  add constraint FK_clientes_codigoprovincia
  foreign key (codigoprovincia)
  references provincias(codigo)
  on update cascade
  on delete cascade;

 exec sp_helpconstraint clientes;

 exec sp_helpconstraint provincias;

 alter table clientes
  nocheck constraint FK_clientes_codigoprovincia;

 exec sp_helpconstraint clientes;

 exec sp_helpconstraint provincias;

 insert into clientes values('Garcia Omar','San Martin 100','La Pampa',6);

 delete from provincias where codigo=2;

 select * from clientes;
 select * from provincias;

 update provincias set codigo=9 where codigo=3;

 select * from clientes;
 select * from provincias;

 drop table provincias;

 alter table clientes
  check constraint FK_clientes_codigoprovincia;

 insert into clientes values('Hector Ludueña','Paso 123','La Plata',8);

 update provincias set codigo=20 where codigo=4;

 select * from clientes;
 select * from provincias;

 delete from provincias where codigo=1;

 select * from clientes;
 select * from provincias;

 alter table clientes
  drop constraint FK_clientes_codigoprovincia;

 exec sp_helpconstraint provincias;

 drop table provincias;