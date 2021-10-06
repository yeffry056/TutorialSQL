 if object_id ('empleados') is not null
  drop table empleados;

 if exists (select *from systypes
  where name = 'tipo_año')
  exec sp_droptype tipo_año;

 exec sp_addtype tipo_año, 'int','null';

 if object_id ('RG_año') is not null
   drop rule RG_año;

 create rule RG_año
  as @año between 1990 and datepart(year,getdate());

 exec sp_bindrule RG_año, 'tipo_año';

 create table empleados(
  documento char(8),
  nombre varchar(30),
  añoingreso tipo_año
 );

 insert into empleados values('22222222','Juan Lopez',1980);

 insert into empleados values('22222222','Juan Lopez',2000);

 drop rule RG_año;

 exec sp_unbindrule 'tipo_año';

 exec sp_helpconstraint empleados;
 exec sp_help tipo_año;

 drop rule RG_año;

 exec sp_help RG_año;

 insert into empleados values('22222222','Juan Lopez',1980);

 exec sp_droptype tipo_año;

 drop table empleados;

 exec sp_help tipo_año;

 exec sp_droptype tipo_año;

 exec sp_help tipo_año;