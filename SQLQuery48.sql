 if object_id ('empleados') is not null
  drop table empleados;

 if exists (select *from systypes
  where name = 'tipo_a�o')
  exec sp_droptype tipo_a�o;

 exec sp_addtype tipo_a�o, 'int','null';

 if object_id ('RG_a�o') is not null
   drop rule RG_a�o;

 create rule RG_a�o
  as @a�o between 1990 and datepart(year,getdate());

 exec sp_bindrule RG_a�o, 'tipo_a�o';

 create table empleados(
  documento char(8),
  nombre varchar(30),
  a�oingreso tipo_a�o
 );

 insert into empleados values('22222222','Juan Lopez',1980);

 insert into empleados values('22222222','Juan Lopez',2000);

 drop rule RG_a�o;

 exec sp_unbindrule 'tipo_a�o';

 exec sp_helpconstraint empleados;
 exec sp_help tipo_a�o;

 drop rule RG_a�o;

 exec sp_help RG_a�o;

 insert into empleados values('22222222','Juan Lopez',1980);

 exec sp_droptype tipo_a�o;

 drop table empleados;

 exec sp_help tipo_a�o;

 exec sp_droptype tipo_a�o;

 exec sp_help tipo_a�o;