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

 if object_id ('RG_a�o') is not null
   drop rule RG_a�o;

 create rule RG_a�o
  as @a�o between 1990 and datepart(year,getdate());

 exec sp_bindrule RG_a�o, 'tipo_a�o', 'futureonly';

 exec sp_helpconstraint empleados;

 create table clientes(
  documento char(8),
  nombre varchar(30),
  a�oingreso tipo_a�o
 );

 exec sp_helpconstraint clientes;

 insert into empleados values('11111111','Ana Acosta',2050);
 select * from empleados;

 insert into clientes values('22222222','Juan Perez',2050);

 exec sp_unbindrule 'tipo_a�o';

 exec sp_helpconstraint clientes;

 exec sp_bindrule RG_a�o, 'tipo_a�o';

 insert into empleados values('33333333','Romina Guzman',1900);

 exec sp_help tipo_a�o;

 if object_id ('RG_a�onegativo') is not null
   drop rule RG_a�onegativo;

 create rule RG_a�onegativo
  as @a�o between -2000 and -1;

 exec sp_bindrule RG_a�onegativo, 'clientes.a�oingreso';

 exec sp_helpconstraint clientes;

 exec sp_help tipo_a�o;

 insert into empleados values('44444444','Pedro Perez',-1900);

 insert into clientes values('44444444','Pedro Perez',-1900);
 select * from clientes;