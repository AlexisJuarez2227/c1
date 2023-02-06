CREATE DATABASE DB_GAS;
use DB_GAS;

SELECT * FROM permissions;

CREATE TABLE Permissions (
    `id` INT primary key NOT null AUTO_INCREMENT,
    `name` VARCHAR (20) NOT NULL,
    UNIQUE(name),
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

select * from Citys;
CREATE TABLE Citys(
    `id` INT primary key NOT null AUTO_INCREMENT,
    `id_service_station` INT (10) NOT null,
    `id_country` INT (10) NOT null,
    `postal_code` int (10) NOT null,
    `name` VARCHAR(20) NOT null,
    UNIQUE(postal_code),
    UNIQUE(name),
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

USE DB_GAS;
select * from USERS;

CREATE TABLE COUNTRIES (
  id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_city INT NOT NULL ,
  id_service_station INT NOT NULL,
  cp INT (5) UNIQUE KEY NOT NULL,
  name VARCHAR (20) NOT NULL,
   FOREIGN KEY (id) REFERENCES citys(id),
   FOREIGN KEY (id_service_station) REFERENCES SERVICE_STATIONS(id),
   create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE USERS(
    id INT not NULL AUTO_INCREMENT,
    address VARCHAR(50) NULL,
    email VARCHAR (30) not NULL,
    id_rol int,
    name VARCHAR(20),
    password varchar(30) not NULL,
    phone VARCHAR(10) not NULL,
    primary key(id), 
    UNIQUE(email),
    UNIQUE(phone),
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );


   
 CREATE TABLE COMPANYS (
    id INT not NULL primary key AUTO_INCREMENT,
    email VARCHAR (30) unique key not NULL,
    phone VARCHAR (10) unique key not NULL,
    rfc VARCHAR (13) unique key not NULL,
    ubicacion VARCHAR (50),
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

 
 CREATE TABLE SERVICE_STATIONS (
    id INT (6) unique key not NULL AUTO_INCREMENT,
    id_company INT  not NULL,
    id_buy INT (7) unique key not NULL,
    ubicacion VARCHAR (50) unique key not NULL,
    FOREIGN KEY (id_company) REFERENCES Companys(id),
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE SCORES(
    id int not null primary key auto_increment,
	id_user int not null,
    id_buy int ,
    points float (6) not null unique,
     FOREIGN KEY (id_user) REFERENCES USERS(id),
     FOREIGN KEY (id_buy) REFERENCES SERVICE_STATIONS(id_buy),
     create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE FUEL(   
	id int not null primary key auto_increment,
    id_service_station int not null ,
    name varchar(20)not null UNIQUE,
    price float(5) not null UNIQUE,
    stock float(10)not null,
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE ROLES(
    id int not null primary key auto_increment,
    id_user int not null ,
    FOREIGN KEY (id_user) REFERENCES USERS(id),
    name VARCHAR(20) NOT NULL,
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    );
   
use db_gas;
CREATE TABLE HISTORYS(
   id int not null primary key auto_increment,
   id_service_station int not null,
    FOREIGN KEY (id_service_station) REFERENCES SERVICE_STATIONS(id),
    FOREIGN KEY(id) REFERENCES USERS(id),
	quantity float not null,
    create_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ,
    update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

select * from citys;
select * from countries; 
select * from db_gas.historys;
select * from companys;
select * from users;
select * from roles;
select * from permissions;
select * from scores;
select * from fuel;
select * from historys;
select * from service_stations;


select users.id, users.`name`, scores.points from users inner join scores on users.id=scores.id where users.id=2;

select users.id, users.`name`, scores.points from users inner join scores on users.id=scores.id where users.id=2;

select users.id, users.`name`, roles.`name` from users inner join roles on users.id=roles.id;


INSERT INTO `db_gas`.`citys` (`id`, `id_service_station`, `id_country`, `postal_code`, `name`) VALUES ('1', '1', '1', '29100', 'los pinguis');



insert into users(id, address, email, id_rol, name, password, phone) value (1,"SAN FRANCISCO AV NORT", "brandon@gmial.com", 1, "Brandon", "password", 9681512145 );