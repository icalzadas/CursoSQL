
create table alumnos_log(
	alumnos_log_id int identity primary key,
	id_alumno int not null,
	created_at datetime not null,
	updated_at datetime not null,
	operacion char(3) not null,
	check(operacion = 'ins' or operacion = 'del')
) 


CREATE TRIGGER t_alumnos 
ON alumnos
AFTER INSERT,DELETE
AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO alumnos_log(id_alumno,created_at,updated_at,operacion)
	SELECT
        i.id_alumno,
        GETDATE(),
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.id_alumno,
        GETDATE(),
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END


select *
--delete
from alumnos
where id_alumno = 13

insert into alumnos
values ('Gabriel','perez','leon','gabipe05','2006-05-25')

select *
from alumnos_log
