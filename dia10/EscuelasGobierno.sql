--Creacion de BD
CREATE DATABASE EscuelasGobierno

--Creacion de esquemas
CREATE SCHEMA Personas
CREATE SCHEMA Escuela

--Creacion de Tablas

--Alumnos
if EXISTS(select * from sysobjects where type = 'U' and name = 'Alumnos' )
	DROP TABLE [Personas].[Alumnos]
CREATE TABLE [Personas].[Alumnos](
	[id_alumno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[paterno] [varchar](50) NOT NULL,
	[materno] [varchar](50) NOT NULL,
	[matricula] [varchar](15) NOT NULL,
	[fecha_nacimiento] [date] NULL,
	[RFC] [char](13) NULL,
	[CURP] [char](18) NULL
 CONSTRAINT [PK_alumnos] PRIMARY KEY CLUSTERED 
(
	[id_alumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_compuesta_alumnos] UNIQUE NONCLUSTERED 
(
	[nombre] ASC,
	[paterno] ASC,
	[materno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_matricula_alumnos] UNIQUE NONCLUSTERED 
(
	[matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

 CONSTRAINT [UK_RFC_alumnos] UNIQUE NONCLUSTERED 
(
	[RFC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],

CONSTRAINT [UK_CURP_alumnos] UNIQUE NONCLUSTERED 
(
	[CURP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]

) ON [PRIMARY]
GO

--Escuelas
if EXISTS(select * from sysobjects where type = 'U' and name = 'Datos_Escuela' )
	DROP TABLE [Escuela].[Datos_Escuela]
CREATE TABLE [Escuela].[Datos_Escuela](
	id_escuela INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre VARCHAR(70) NOT NULL,
	ciudad VARCHAR(40) NULL,
	direccion VARCHAR(MAX) NULL,
)


--Licenciaturas
if EXISTS(select * from sysobjects where type = 'U' and name = 'Licenciaturas' )
	DROP TABLE [Escuela].[Licenciaturas]
CREATE TABLE [Escuela].[Licenciaturas](
	id_lic INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre VARCHAR(70) NOT NULL,
	area VARCHAR(30) NULL,
	fecha_plan DATE NULL,
	CHECK(area='sociales' OR area='ciencia' OR area='tecnologia')
)

--Semestres
if EXISTS(select * from sysobjects where type = 'U' and name = 'Semestres' )
	DROP TABLE [Escuela].[Semestres]
CREATE TABLE [Escuela].[Semestres](
	id_semestre INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	nombre VARCHAR(10) NOT NULL,
	id_lic INT CONSTRAINT FK_Semestres_Licenciaturas FOREIGN KEY (id_lic) REFERENCES [Escuela].[Licenciaturas](id_lic)
	CONSTRAINT [UK_compuesta_semestres] UNIQUE NONCLUSTERED 
	(
		[nombre] ASC,
		[id_lic] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
)
--Hasta aqui lo cree yo (Ivan)--Gruposif EXISTS(select * from sysobjects where type = 'U' and name = 'Grupos' )	DROP TABLE [Escuela].[Grupos]CREATE TABLE [Escuela].[Grupos](	id_grupo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,	nombre VARCHAR(30) NOT NULL)
--Materiasif EXISTS(select * from sysobjects where type = 'U' and name = 'Materias' )	DROP TABLE [Escuela].[Materias]CREATE TABLE [Escuela].[Materias](	id_materia INT IDENTITY(1,1) PRIMARY KEY NOT NULL,	id_semestre INT CONSTRAINT FK_Materias_Semestres FOREIGN KEY (id_semestre) REFERENCES [Escuela].[Semestres](id_semestre),	id_grupo INT CONSTRAINT FK_Materias_Grupos FOREIGN KEY (id_grupo) REFERENCES [Escuela].[Grupos](id_grupo),	nombre VARCHAR(20) NOT NULL)






