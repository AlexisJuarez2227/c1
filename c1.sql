CREATE DATABASE DB_GAS;

USE DB_GAS;
select * from USERS;

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
    UNIQUE(phone)
    );
   


CREATE TABLE Permissions (
    id INT (10) primary key NOT null AUTO_INCREMENT,
    name VARCHAR (20) NOT NULL,
    UNIQUE(name)
);

 CREATE TABLE COMPANYS (
    id INT (6) not NULL primary key AUTO_INCREMENT,
    email VARCHAR (30) unique key not NULL,
    phone VARCHAR (10) unique key not NULL,
    rfc VARCHAR (13) unique key not NULL,
    ubicacion VARCHAR (50)
);

 
 CREATE TABLE SERVICE_STATIONS (
    id INT (6) unique key not NULL AUTO_INCREMENT,
    id_company INT  not NULL,
    id_buy INT (7) unique key not NULL,
    ubicacion VARCHAR (50) unique key not NULL,
    FOREIGN KEY (id_company) REFERENCES Companys(id)
);

CREATE TABLE Scores(
	id_user int not null,
    id_buy int ,
    points float (6) not null unique,
     FOREIGN KEY (id_user) REFERENCES USERS(id),
     FOREIGN KEY (id_buy) REFERENCES SERVICE_STATIONS(id_buy)
);

 CREATE TABLE CITY(
    id int  not NULL primary key AUTO_INCREMENT,
    nameCity VARCHAR (20) unique key not NULL,
    id_service_station INT,
    id_country INT,
    cp INT (5) unique key not NULL 
    
);

 CREATE TABLE Citys(
    id INT (10) primary key NOT null AUTO_INCREMENT,
    id_service_station INT (10) NOT null,
    id_country INT (10) NOT null,
    postal_code int (10) NOT null,
    name VARCHAR(20) NOT null,
    UNIQUE(postal_code),
    UNIQUE(name)
);

  CREATE TABLE COUNTRIES (
  id INT  NOT NULL PRIMARY KEY AUTO_INCREMENT,
  id_city INT NOT NULL ,
  id_service_station INT NOT NULL,
  cp INT (5) UNIQUE KEY NOT NULL,
  name VARCHAR (20) NOT NULL,
   FOREIGN KEY (id_city) REFERENCES CITY(id),
   FOREIGN KEY (id_service_station) REFERENCES SERVICE_STATIONS(id)
); 

CREATE TABLE FUEL(   
    id_service_station int not null PRIMARY KEY,
    name varchar(20)not null UNIQUE,
    price float(5) not null UNIQUE,
    stock float(10)not null
);

CREATE TABLE Roles(
    id_user int not null primary key,
    FOREIGN KEY (id_user) REFERENCES USERS(id),
    name VARCHAR(20) NOT NULL
    );
   
 
CREATE TABLE History(
   id_user int not null primary KEY,
   id_service_station int not null,
    FOREIGN KEY (id_service_station) REFERENCES SERVICE_STATIONS(id),
    FOREIGN KEY(id_user) REFERENCES USERS(id),
    date DATE NOT NULL,
    hour DATETIME(4) NOT NULL,
    quantity FLOAT(8) NOT NULL
);