
--create database NombreEjemplo
--go
--use NombreEjemplo
--go
--Crear tabla alumnos
create table alumnos(
	id_alumno int identity(1,1) not null,
	nombre varchar(50) not null,
	paterno varchar(50) not null,
	materno varchar(50) not null,
	matricula varchar(15) not null,
	CONSTRAINT [PK_alumnos] PRIMARY KEY CLUSTERED 
	(
		[id_alumno] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	 
	CONSTRAINT [UK_matricula_alumnos] UNIQUE NONCLUSTERED 
	(
		[matricula] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	 
	CONSTRAINT [UK_compuesta_alumnos] UNIQUE NONCLUSTERED 
	(
		nombre,paterno,materno ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
)	ON [PRIMARY] 
GO


create table calificaciones(
	id_calificacion int PRIMARY KEY identity(1,1) not null,
	id_alumno int not null,
	materia varchar(50) not null,
	semestre varchar(15) not null,
	calificacion_p1 float,
	calificacion_p2 float
)

--original
ALTER TABLE calificaciones  WITH CHECK ADD CONSTRAINT [FK_alumnos_calificaciones] FOREIGN KEY([id_alumno])
REFERENCES alumnos ([id_alumno])
GO

--Inserts

--insert into alumnos
--values ('andy','algo','gomez','matric')

--select *
--from alumnos

--insert into calificaciones
--values (1,'matematicas','octavo',10,9)

--select *
--from calificaciones



