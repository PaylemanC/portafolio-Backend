create database portfolio;

use portfolio;


-- Tablas para el USUARIO:
create table pais (
id_pais int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nombre_pais varchar (35)
);

create table ocupacion (
id_ocupacion int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nombre_ocupacion varchar (110) NOT NULL
);

create table ciudad (
id_ciudad int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre_ciudad varchar (180) NOT NULL,
id_pais int NOT NULL
);
alter table ciudad
add FOREIGN KEY (id_pais) references pais (id_pais); 

create table usuario (
dni int PRIMARY KEY NOT NULL,
contrasena varchar (18) NOT NULL,
email varchar (254) unique NOT NULL,
nombre varchar (50) NOT NULL,
apellido varchar (45) NOT NULL,
foto varchar (180), 
perfil_prof text,
id_ciudad int NOT NULL, 
linkedin text,
github text,
cv text
);
alter table usuario
add FOREIGN KEY (id_ciudad) references ciudad (id_ciudad); 

create table usuario_ocupacion (
dni_usuario1 int NOT NULL, 
id_ocupacion1 int NOT NULL
);
alter table usuario_ocupacion
add FOREIGN KEY (dni_usuario1) references usuario (dni),
add FOREIGN KEY (id_ocupacion1) references ocupacion (id_ocupacion); 


-- Tablas previas necesarias para las siguientes. 
create table periodo (
id_period int PRIMARY KEY NOT NULL AUTO_INCREMENT,
inicio_period date NOT NULL, 
final_period date
);

-- "En curso" o "Finalizado" los únicos válidos.
create table estado (
id_estado int PRIMARY KEY NOT NULL,
nombre_estado char (10) NOT NULL 
);
select * from estado; 

-- Tablas para la EXPERIENCIA LABORAL.
create table empresa (
id_emp int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre_emp varchar (200) NOT NULL
);

create table exp_laboral (
id_lab int PRIMARY KEY NOT NULL AUTO_INCREMENT,
dni_usuario int NOT NULL,
id_emp int, 
puesto varchar (140) NOT NULL,
desc_puesto text, 
id_estado_lab int NOT NULL,
id_per_lab int NOT NULL
);
alter table exp_laboral
add FOREIGN KEY (dni_usuario) references usuario (dni),
add FOREIGN KEY (id_emp) references empresa (id_emp),
add FOREIGN KEY (id_estado_lab) references estado (id_estado),
add FOREIGN KEY (id_per_lab) references periodo (id_period); 


-- Tablas para la EDUCACIÓN.
create table instituto (
id_inst int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre_inst varchar (230) NOT NULL
);

create table formacion (
id_form int PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_inst int NOT NULL,
titulo_form varchar (110) NOT NULL,
info_form text
);
alter table formacion
add FOREIGN KEY (id_inst) references instituto (id_inst);

create table educacion (
id_edu int PRIMARY KEY NOT NULL AUTO_INCREMENT,
dni_usuario int NOT NULL,
id_form int NOT NULL,
id_estado_edu int NOT NULL,
id_per_edu int NOT NULL
);
alter table educacion
add FOREIGN KEY (dni_usuario) references usuario (dni),
add FOREIGN KEY (id_form) references formacion (id_form),
add FOREIGN KEY (id_estado_edu) references estado (id_estado),
add FOREIGN KEY (id_per_edu) references periodo (id_period); 


-- Tablas para SOFT & HARD SKILLS.
create table soft_skill (
id_skill int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre_skill varchar (40) NOT NULL
);

create table usuario_skill (
dni_usuario2 int NOT NULL, 
id_skill1 int NOT NULL
);
alter table usuario_skill
add FOREIGN KEY (dni_usuario2) references usuario (dni),
add FOREIGN KEY (id_skill1) references soft_skill (id_skill); 

create table tecnologia (
id_tec int PRIMARY KEY NOT NULL AUTO_INCREMENT,
nombre_tec varchar (65) NOT NULL
);

create table usuario_tec (
dni_usuario3 int NOT NULL, 
id_tec1 int NOT NULL
);
alter table usuario_tec
add FOREIGN KEY (dni_usuario3) references usuario (dni),
add FOREIGN KEY (id_tec1) references tecnologia (id_tec); 


-- Tabla para PROYECTOS.
create table proyecto (
id_proy int PRIMARY KEY NOT NULL AUTO_INCREMENT, 
dni_usuario int, 
nombre_proy varchar (150) NOT NULL,
desc_proy text, 
portada varchar (180),
id_estado_proy int NOT NULL,
id_per_proy int NOT NULL,
link_proy text 
);
alter table proyecto
add FOREIGN KEY (dni_usuario) references usuario (dni),
add FOREIGN KEY (id_estado_proy) references estado (id_estado),
add FOREIGN KEY (id_per_proy) references periodo (id_period); 

-- Pruebas con sentencias DML:
insert into estado values (0, 'En curso');
insert into estado values (1, 'Finalizado');
select * from estado;

insert into pais values (1, 'Argentina');
select * from pais;
insert into ciudad values (1, 'Córdoba', 1), (2, 'Bialet Massé', 1);

insert into ocupacion (nombre_ocupacion) values ('Full Stack Developer'), ('Diseñador UX/UI');
select * from ocupacion;

insert into soft_skill (nombre_skill) values ('Trabajo en equipo'), ('Liderazgo'), ('Comunicación asertiva');
select * from soft_skill;

insert into tecnologia (nombre_tec) values ('JAVASCRIPT'), ('HTML'), ('CSS');
select * from tecnologia;