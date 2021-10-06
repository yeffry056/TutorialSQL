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
 insert into clientes values('Acosta Ana','Avellaneda 333','Posadas',3);

 alter table clientes
 add constraint FK_clientes_codigoprovincia
  foreign key (codigoprovincia)
  references provincias(codigo)
  on update cascade
  on delete no action;

 delete from provincias where codigo=3;

 update provincias set codigo=9 where codigo=3;

 select * from provincias;
 select * from clientes;

 alter table clientes
 add constraint FK_clientes_codigoprovincia
  foreign key (codigoprovincia)
  references provincias(codigo)
  on update cascade,
  on delete cascade;

 drop table provincias;

 --SEGUNDOPROBLEMA
 if object_id('inscripciones') is not null
  drop table inscripciones;
 if object_id('deportes') is not null
  drop table deportes;
 if object_id('socios') is not null
  drop table socios;

 create table deportes(
  codigo tinyint,
  nombre varchar(20),
  primary key(codigo)
 );

 create table socios(
  documento char(8),
  nombre varchar(30),
  primary key(documento)
 );

 create table inscripciones(
  documento char(8), 
  codigodeporte tinyint,
  matricula char(1),-- 's' si está paga, 'n' si no está paga
  primary key(documento,codigodeporte)
 );

 alter table inscripciones
  add constraint FK_inscripciones_codigodeporte
  foreign key (codigodeporte)
  references deportes(codigo)
  on update cascade;

 alter table inscripciones
  add constraint FK_inscripciones_documento
  foreign key (documento)
  references socios(documento)
  on delete cascade;

 insert into deportes values(1,'basquet');
 insert into deportes values(2,'futbol');
 insert into deportes values(3,'natacion');
 insert into deportes values(4,'tenis');

 insert into socios values('30000111','Juan Lopez');
 insert into socios values('31111222','Ana Garcia');
 insert into socios values('32222333','Mario Molina');
 insert into socios values('33333444','Julieta Herrero');

 insert into inscripciones values ('30000111',1,'s');
 insert into inscripciones values ('30000111',2,'s');
 insert into inscripciones values ('31111222',1,'s');
 insert into inscripciones values ('32222333',3,'n');

 insert into inscripciones values('30000111',6,'s');

 insert into inscripciones values('40111222',1,'s');

 delete from deportes where nombre='tenis';

 delete from deportes where nombre='natacion';

 update deportes set codigo=5 where nombre='natacion';

 select * from deportes;
 select * from inscripciones;

 delete from socios where documento='32222333'; 

 select * from socios;
 select * from inscripciones;

 update socios set documento='35555555' where documento='30000111';

 drop table deportes;

 exec sp_helpconstraint socios;

 exec sp_helpconstraint deportes;

 exec sp_helpconstraint inscripciones;