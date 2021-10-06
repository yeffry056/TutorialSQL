if object_id('agenda') is not null
  drop table agenda;

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(15)
 );

 exec sp_tables @table_owner='dbo';

 exec sp_columns agenda;

 -- insertamos elemento en nuestra tabla 
 insert into agenda (apellido, nombre, domicilio, telefono)
  values ('javier','yeffry','Colon 95362','829-964-7975');

 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('vasquez','boni','duerarte','829-369-7852');

  -- nos muestra la lista de la tabla
 select * from agenda;

 --borrando la tabla 
 drop table agenda;

 drop table agenda;