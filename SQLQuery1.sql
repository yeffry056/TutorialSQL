-- si la tabla existe la elimina
if object_id('agenda') is not null
  drop table agenda;

  --creando una tabla
 create table /agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );
 
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );
 --comando para ver todas las tablas 
 exec sp_tables @table_owner='dbo';

 -- comando para ver los elementos de una tabla 
 exec sp_columns agenda;

	--Comando para eliminar una tabla 
 drop table agenda;

 drop table agenda;
