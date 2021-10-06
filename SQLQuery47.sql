if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('clientes') is not null
  drop table clientes;

 if exists (select *from systypes
  where name = 'tipo_año')
   exec sp_droptype tipo_año;

 exec sp_addtype tipo_año, 'int','null';

 exec sp_help tipo_año;

 create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 if object_id ('VP_añoactual') is not null
   drop default VP_añoactual;

 create default VP_añoactual
  as datepart(year,getdate());

 exec sp_bindefault VP_añoactual, 'tipo_año', 'futureonly';

 exec sp_helpconstraint empleados;

 create table clientes(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 exec sp_helpconstraint clientes;

 insert into empleados default values;
 select * from empleados;

 insert into clientes default values;
 select * from clientes;

 if object_id ('VP_año2000') is not null
   drop default Vp_año2000;

 create default VP_año2000
  as 2000;

 exec sp_bindefault VP_año2000, 'tipo_año';

 exec sp_helpconstraint empleados;

 exec sp_helpconstraint clientes;

 insert into empleados default values;
 select * from empleados;
 insert into clientes default values;
 select * from clientes;

 exec sp_help tipo_año;

 alter table empleados
 add constraint DF_empleados_año
 default 1990
 for añoingreso;

 exec sp_unbindefault 'tipo_año';

 alter table empleados
 add constraint DF_empleados_año
 default 1990
 for añoingreso;

 exec sp_bindefault VP_añoactual, 'tipo_año';

 exec sp_help tipo_año;

 exec sp_helpconstraint clientes;

 exec sp_helpconstraint empleados;