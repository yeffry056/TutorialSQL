if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('clientes') is not null
  drop table clientes;

 if exists (select *from systypes
  where name = 'tipo_a�o')
   exec sp_droptype tipo_a�o;

 exec sp_addtype tipo_a�o, 'int','null';

 exec sp_help tipo_a�o;

 create table empleados(
  documento char(8),
  nombre varchar(30),
  a�oingreso tipo_a�o
 );

 if object_id ('VP_a�oactual') is not null
   drop default VP_a�oactual;

 create default VP_a�oactual
  as datepart(year,getdate());

 exec sp_bindefault VP_a�oactual, 'tipo_a�o', 'futureonly';

 exec sp_helpconstraint empleados;

 create table clientes(
  documento char(8),
  nombre varchar(30),
  a�oingreso tipo_a�o
 );

 exec sp_helpconstraint clientes;

 insert into empleados default values;
 select * from empleados;

 insert into clientes default values;
 select * from clientes;

 if object_id ('VP_a�o2000') is not null
   drop default Vp_a�o2000;

 create default VP_a�o2000
  as 2000;

 exec sp_bindefault VP_a�o2000, 'tipo_a�o';

 exec sp_helpconstraint empleados;

 exec sp_helpconstraint clientes;

 insert into empleados default values;
 select * from empleados;
 insert into clientes default values;
 select * from clientes;

 exec sp_help tipo_a�o;

 alter table empleados
 add constraint DF_empleados_a�o
 default 1990
 for a�oingreso;

 exec sp_unbindefault 'tipo_a�o';

 alter table empleados
 add constraint DF_empleados_a�o
 default 1990
 for a�oingreso;

 exec sp_bindefault VP_a�oactual, 'tipo_a�o';

 exec sp_help tipo_a�o;

 exec sp_helpconstraint clientes;

 exec sp_helpconstraint empleados;