use universidad;

select apellido1, apellido2, nombre from persona where tipo = 'alumno' order by apellido1 asc, apellido2 asc, nombre asc;
select apellido1, apellido2, nombre from persona where tipo = 'alumno' and telefono is null;
select * from persona where tipo = 'alumno' and year(fecha_nacimiento) = 1999;
select * from persona where tipo = 'profesor' and nif like '%K';
select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado = 7;
select p.apellido1, p.apellido2, p.nombre, d.nombre from persona p join profesor pd on p.id = pd.id_profesor join departamento d on pd.id_departamento = d.id order by p.apellido1 asc, p.apellido2 asc, p.nombre asc;
select a.nombre, c.anyo_inicio, c.anyo_fin from persona p join alumno_se_matricula_asignatura am on p.id = am.id_alumno join curso_escolar c on am.id_curso_escolar = c.id join asignatura a on am.id_asignatura = a.id where p.nif = '26902806M';
select distinct d.nombre from grado g join asignatura a on g.id = a.id_grado join profesor p on p.id_profesor = a.id_profesor join departamento d on d.id = p.id_departamento where g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
select distinct p.apellido1, p.apellido2, p.nombre from curso_escolar c join alumno_se_matricula_asignatura am on am.id_curso_escolar = c.id join persona p on p.id = am.id_alumno where c.anyo_inicio = 2018 and c.anyo_fin = 2019;

select d.nombre as department, p.apellido1, p.apellido2, p.nombre as professor from persona p left join profesor pr on pr.id_profesor = p.id left join departamento d on pr.id_departamento = d.id where p.tipo = 'profesor' order by d.nombre asc, p.apellido1 asc, p.apellido2 asc, p.nombre asc;
select p.apellido1, p.apellido2, p.nombre as professor from persona p left join profesor pr on pr.id_profesor = p.id where p.tipo = 'profesor' and pr.id_profesor is null;
select d.nombre from departamento d left join profesor pr on pr.id_departamento = d.id where pr.id_departamento is null;
select p.apellido1, p.apellido2, p.nombre as professor from persona p left join profesor pr on pr.id_profesor = p.id left join asignatura a on pr.id_profesor = a.id_profesor where a.id_profesor is null and p.tipo = 'profesor';
select a.nombre as course from asignatura a left join profesor pr on a.id_profesor = pr.id_profesor where pr.id_profesor is null;
select d.nombre as department from departamento d left join profesor pr on pr.id_departamento = d.id left join asignatura a on a.id_profesor = pr.id_profesor left join alumno_se_matricula_asignatura am on am.id_asignatura = a.id  group by d.nombre having count(am.id_asignatura) = 0;

select count(*) as total_students from persona where tipo = 'alumno';
select count(*) as students_1999 from persona where tipo = 'alumno' and year(fecha_nacimiento) = 1999;
select d.nombre as department, count(*) as num_professors from profesor pr join departamento d on pr.id_departamento = d.id group by d.nombre order by num_professors desc;
select d.nombre as department, count(pr.id_profesor) as num_professors from departamento d left join profesor pr on pr.id_departamento = d.id group by d.nombre order by num_professors desc;
select g.nombre as degree, count(a.id) as num_courses from grado g left join asignatura a on a.id_grado = g.id group by g.nombre order by num_courses desc;
select g.nombre as degree, count(a.id) as num_courses from grado g left join asignatura a on a.id_grado = g.id group by g.nombre having count(a.id) > 40;
select g.nombre as degree, a.tipo as type_course, sum(a.creditos) as total_credits from grado g join asignatura a on a.id_grado = g.id group by g.nombre, a.tipo;
select c.anyo_inicio, count(distinct am.id_alumno) as num_students from curso_escolar c join alumno_se_matricula_asignatura am on am.id_curso_escolar = c.id group by c.anyo_inicio;
select pr.id_profesor, p.nombre, p.apellido1, p.apellido2, count(a.id) as num_courses from profesor pr join persona p on pr.id_profesor = p.id left join asignatura a on a.id_profesor = pr.id_profesor group by pr.id_profesor, p.nombre, p.apellido1, p.apellido2 order by num_courses desc;
select * from persona where tipo = 'alumno' order by fecha_nacimiento desc limit 1;
select p.nombre, p.apellido1, p.apellido2, d.nombre as department from profesor pr join persona p on pr.id_profesor = p.id join departamento d on pr.id_departamento = d.id left join asignatura a on a.id_profesor = pr.id_profesor where a.id_profesor is null;



