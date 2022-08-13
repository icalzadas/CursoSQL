
create function calculaRFC(@id_alumno int)
RETURNS [nvarchar](16) 
AS 
BEGIN
	DECLARE @rfc as varchar(12)
	select @rfc = UPPER(SUBSTRING(paterno,1,2)) + UPPER(SUBSTRING(materno,1,1)) + UPPER(SUBSTRING(nombre,1,1)) + 
		SUBSTRING(CONVERT(VARCHAR(10),fecha_nacimiento),3,2) + SUBSTRING(CONVERT(VARCHAR(10),fecha_nacimiento),6,2) + 
		SUBSTRING(CONVERT(VARCHAR(10),fecha_nacimiento),9,2)
	from alumnos
	where id_alumno = @id_alumno
	return @rfc
END

SELECT nombre,paterno,materno,fecha_nacimiento,dbo.calculaRFC(3)
FROM alumnos
where id_alumno = 3

select * from alumnos
