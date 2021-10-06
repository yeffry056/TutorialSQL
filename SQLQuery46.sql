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

 if object_id ('RG_año') is not null
   drop rule RG_año;

 create rule RG_año
  as @año between 1990 and datepart(year,getdate());

 exec sp_bindrule RG_año, 'tipo_año', 'futureonly';

 exec sp_helpconstraint empleados;

 create table clientes(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 exec sp_helpconstraint clientes;

 insert into empleados values('11111111','Ana Acosta',2050);
 select * from empleados;

 insert into clientes values('22222222','Juan Perez',2050);

 exec sp_unbindrule 'tipo_año';

 exec sp_helpconstraint clientes;

 exec sp_bindrule RG_año, 'tipo_año';

 insert into empleados values('33333333','Romina Guzman',1900);

 exec sp_help tipo_año;

 if object_id ('RG_añonegativo') is not null
   drop rule RG_añonegativo;

 create rule RG_añonegativo
  as @año between -2000 and -1;

 exec sp_bindrule RG_añonegativo, 'clientes.añoingreso';

 exec sp_helpconstraint clientes;

 exec sp_help tipo_año;

 insert into empleados values('44444444','Pedro Perez',-1900);

 insert into clientes values('44444444','Pedro Perez',-1900);
 select * from clientes;