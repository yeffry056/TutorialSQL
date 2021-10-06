if object_id ('empleados') is not null
  drop table empleados;

 if exists (select name from systypes
  where name = 'tipo_legajo')
  exec sp_droptype tipo_legajo;

 exec sp_addtype tipo_legajo, 'char(4)','not null';

 exec sp_help tipo_legajo;

 create table empleados(
  legajo tipo_legajo,
  documento char(8),
  nombre varchar(30)
 );

 insert into empleados default values;

 insert into empleados values('A111','22222222','Juan Perez');