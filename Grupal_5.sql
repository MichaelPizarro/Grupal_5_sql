Integrantes:  Michael Pizarro - Nelson Toledo - Gabriel Silva - Rebeca Gatica

/*Parte 1*/
create database telovendo_5;
use telovendo_5;
create user 'admintienda5'@'localhost'identified by '123';
grant all privileges on *.* to 'admintienda5'@'localhost';

/*Parte 2*/
create table usuario (
id_usuario integer primary key auto_increment,
nombre varchar (90) not null,
apellido varchar (90) not null,
contrasenia varchar (30) not null,
zona_horaria varchar (20) default 'UTC-3',
genero varchar (10) not null,
telefono_de_contacto varchar (20) not null
);

create table ingreso (
id_ingreso integer primary key,
id_usuario integer,
fecha_hora_ingreso datetime default now(),
foreign key (id_usuario) references usuario (id_usuario)
);

/*Parte 3*/
alter table usuario alter zona_horaria set default 'UTC-2';
select *from usuario;


/*Parte 4*/
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Pepe','Perez', '123', 'masculino', '+5698127310');
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Pepa','Perez', '122', 'femenino', '+5698127876');
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Elvis', 'Tec', '124', 'masculino', '+5691836916');
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Elsa', 'Pallo', '125', 'femenino', '+569268190');
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Ana', 'Torroja', '126', 'femenino', '+569152944');
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Laura', 'Sanabria', '127', 'femenino', '+576013271980');
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Caterin', 'Morales', '131', 'femenino', '+56940368955');
insert into usuario (nombre, apellido, contrasenia, genero, telefono_de_contacto) values ('Jessica', 'Montupil', '133', 'femenino', '+56982877474');

insert into ingreso (id_ingreso, id_usuario) values (1, 1);
insert into ingreso (id_ingreso, id_usuario) values (2, 2);
insert into ingreso (id_ingreso, id_usuario) values (3, 3);
insert into ingreso (id_ingreso, id_usuario) values (4, 4);
insert into ingreso (id_ingreso, id_usuario) values (5, 1);
insert into ingreso (id_ingreso, id_usuario) values (6, 5);
insert into ingreso (id_ingreso, id_usuario) values (7, 7);
insert into ingreso (id_ingreso, id_usuario) values (8, 8);

/*Actualizar columna fecha_hora_ingreso de la tabla ingreso*/
SET time_zone = "-03:00";
select now();

update ingreso set fecha_hora_ingreso = convert_tz(now(),"-03:00","-02:00");
select *from ingreso;

/*Parte 5*/
/*Justifique cada tipo de dato utilizado. ¿Es el optimo en cada caso?
En el id de cada tabla utilizamos integer que sirve para almacenar valores numericos, 
ya que hacemos referencia a la llave primaria que posee un carecter independiente, debido a que es lo mas optimo.
Luego, utilizamos varchar para los caracteres alfa-numericos definiendo su longitud y estableciendo not null para los campos obligatorios, 
ya que es coherente al nombre del campo (nombre, apellido, numero de telefono, etc.).
Tambien, usamos llaves foraneas para aquellas tablas que consideramos dependientes de las que asignamos primarias.
Finalmente, ocupamos la palabra reservada auto_increment en el id_usuario para optimizar el ingreso de datos.*/

/*Parte 6*/
create table contactos (
id_contacto integer primary key,
id_usuario integer,
numero_de_telefono varchar (20) not null,
correo_electronico varchar (50) not null,
foreign key (id_usuario) references usuario (id_usuario)
);

select *from contactos;

/*Parte 7*/
alter table usuario drop column telefono_de_contacto;

/*El ejercicio debe ser subido a github y al Nodo Virtual*/
/*https://github.com/MichaelPizarro/Grupal_5_sql*/

