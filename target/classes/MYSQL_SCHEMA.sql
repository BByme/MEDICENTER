
#####################################################
# CREATE SCHEMA IF NOT EXISTS
#####################################################
CREATE SCHEMA IF NOT EXISTS  MEDICENTER;


#####################################################
# CAUTION  -> SEQUENCES CREATION ARE NOT SUPPORTED
#####################################################
# CREATE SEQUENCE 'USER_ACCOUNT_ID_SEQ' IF NOT EXISTS
# CREATE OR REPLACE  MEDICENTER.USER_ACCOUNT_ID_SEQ START WITH 1 INCREMENT BY 1;
#
# -- CREATE SEQUENCE 'NAV_SYSTEM_ID_SEQ' IF NOT EXISTS
# CREATE SEQUENCE IF NOT EXISTS 'MEDICENTER'.'NAV_SYSTEM_ID_SEQ';
#
# -- CREATE SEQUENCE 'CONTACT_ID_SEQ' IF NOT EXISTS
# CREATE SEQUENCE IF NOT EXISTS 'MEDICENTER'.'CONTACT_ID_SEQ';
#
# -- CREATE SEQUENCE 'PASSENGER_ID_SEQ' IF NOT EXISTS
# CREATE SEQUENCE IF NOT EXISTS 'MEDICENTER'.'PASSENGER_ID_SEQ';
#
# -- CREATE SEQUENCE 'DRIVER_ID_SEQ' IF NOT EXISTS
# CREATE SEQUENCE IF NOT EXISTS 'MEDICENTER'.'DRIVER_ID_SEQ';
#
# -- CREATE SEQUENCE 'DOCTOR_ID_SEQ' IF NOT EXISTS
# CREATE SEQUENCE IF NOT EXISTS 'MEDICENTER'.'DOCTOR_ID_SEQ';
#
# -- CREATE SEQUENCE 'MEDICAL_FILE_ID_SEQ' IF NOT EXISTS
# CREATE SEQUENCE IF NOT EXISTS 'MEDICENTER'.'MEDICAL_FILE_ID_SEQ';

##############################################################
#    DROP FOREIGN KEY IF THERE ARE MODIFICATION ON TABLES
##############################################################

ALTER TABLE MEDICENTER.USER_ACCOUNT DROP FOREIGN KEY fk_useraccount_nav;
ALTER TABLE MEDICENTER.NAV_SYSTEM DROP FOREIGN KEY fk_navsystem_useraccount;
ALTER TABLE MEDICENTER.CONTACT DROP FOREIGN KEY fk_contact_passenger;
ALTER TABLE MEDICENTER.CONTACT DROP FOREIGN KEY fk_contact_driver;
ALTER TABLE MEDICENTER.PASSENGER DROP FOREIGN KEY fk_passenger_contact;
ALTER TABLE MEDICENTER.PASSENGER DROP FOREIGN KEY fk_passenger_doctor;
ALTER TABLE MEDICENTER.DRIVER DROP FOREIGN KEY fk_driver_contact;
ALTER TABLE MEDICENTER.DRIVER DROP FOREIGN KEY fk_driver_doctor;
ALTER TABLE MEDICENTER.DOCTOR DROP FOREIGN KEY fk_doctor_contact;
ALTER TABLE MEDICENTER.USER_LINK DROP FOREIGN KEY fk_userlinks_account;
ALTER TABLE MEDICENTER.USER_LINK DROP FOREIGN KEY fk_userlinks_medifile;
ALTER TABLE MEDICENTER.USER_LINK DROP FOREIGN KEY fk_userlink_passenger;
ALTER TABLE MEDICENTER.USER_LINK DROP FOREIGN KEY fk_userlink_driver;
ALTER TABLE MEDICENTER.MEDICAL_FILE DROP FOREIGN KEY fk_medifile_owner;

##############################################################
#    DROP TABLES FOR RECREATE GOOD TABLES
##############################################################
DROP TABLE MEDICENTER.USER_ACCOUNT;
DROP TABLE MEDICENTER.NAV_SYSTEM;
DROP TABLE MEDICENTER.CONTACT;
DROP TABLE MEDICENTER.PASSENGER;
DROP TABLE MEDICENTER.DRIVER;
DROP TABLE MEDICENTER.DOCTOR;
DROP TABLE MEDICENTER.USER_LINK;
DROP TABLE MEDICENTER.MEDICAL_FILE;


##############################################################
#    CREATE DIFFERENT TABLES
##############################################################
# CREATE TABLE MEDICENTER.USER_ACCOUNT IF NOT EXISTS

CREATE TABLE IF NOT EXISTS  MEDICENTER.USER_ACCOUNT
(id integer not null auto_increment primary key,
 login varchar(40) ,
 password varchar(60),
 Creation_time timestamp,
 update_time timestamp,
 Nav_id integer

);

# CREATE TABLE MEDICENTER.NAV_SYSTEM IF NOT EXISTS
CREATE TABLE  IF NOT EXISTS MEDICENTER.NAV_SYSTEM
( id integer not null auto_increment primary key,
  nav_id varchar(100) not null unique,
  nom varchar (60),
  car_model varchar(60),
  id_user integer

);

# CREATE TABLE MEDICENTER.CONTACT IF NOT EXISTS
CREATE TABLE IF NOT EXISTS MEDICENTER.CONTACT
(id integer not null  auto_increment primary key,
 nom varchar(40),
 prenom varchar(40),
 email varchar(30),
 tel varchar(30),
 id_passenger integer,
 id_driver integer

);

# CREATE TABLE MEDICENTER.PASSENGERT IF NOT EXISTS
CREATE TABLE IF NOT EXISTS MEDICENTER.PASSENGER
(id integer not null auto_increment primary key,
 nom varchar(40),
 prenom varchar(40),
 email varchar(40),
 id_contact integer,
 id_doctor integer
);

# CREATE TABLE MEDICENTER.DRIVER IF NOT EXISTS
CREATE TABLE IF NOT EXISTS MEDICENTER.DRIVER
(id integer not null  auto_increment primary key,
 nom varchar(40),
 prenom varchar(40),
 email varchar(40),
 id_contact integer,
 id_doctor integer

);

# CREATE TABLE MEDICENTER.DOCTOR IF NOT EXISTS
CREATE TABLE IF NOT EXISTS MEDICENTER.DOCTOR
(id integer not null  auto_increment primary key,
 nom varchar(40),
 prenom varchar(40),
 email varchar(40),
 id_contact integer

);

# CREATE TABLE MEDICENTER.USER_LINK IF NOT EXISTS
CREATE TABLE IF NOT EXISTS MEDICENTER.USER_LINK
(
  user_account_id integer,
  driver_id integer,
  passenger_id integer,
  medical_file_id integer,
  constraint pk_users_link
  primary key
    (user_account_id,driver_id, passenger_id,medical_file_id)
);

# CREATE TABLE MEDICENTER.MEDICAL_FILE IF NOT EXISTS
CREATE TABLE IF NOT EXISTS MEDICENTER.MEDICAL_FILE
(id integer not null  auto_increment primary key,
 owner integer ,
 tension double,
 Glycémie double,
 Vision double,
 Seuil_alert varchar(30),
 message_alert varchar(100)
);

###############################################
# CREATE LIKN BETWEEN TABLES WITH FOREIGN KEYS
###############################################

#LINK BETEWEEN USER_ACCOUNT AND NAV_SYSTEM TABLES
alter  table MEDICENTER.USER_ACCOUNT add constraint foreign key fk_useraccount_nav (id)
references NAV_SYSTEM(id)
  on delete cascade;

#LINK BETEWEEN NAV_SYSTEM AND USER_ACCOUNT TABLES
alter  table MEDICENTER.NAV_SYSTEM add constraint foreign key fk_navsystem_useraccount (id_user)
references USER_ACCOUNT(id)
  on delete cascade;

#LINK BETEWEEN CONTACT AND PASSENGER TABLES
alter  table MEDICENTER.CONTACT add constraint foreign key fk_contact_passenger (id_passenger)
references PASSENGER(id)
  on delete cascade;

#LINK BETEWEEN CONTACT AND DRIVER TABLES
alter  table MEDICENTER.CONTACT add constraint foreign key fk_contact_driver (id_driver)
references DRIVER(id)
  on delete cascade;

alter  table MEDICENTER.PASSENGER add constraint foreign key fk_passenger_contact (id_contact)
references CONTACT(id)
  on delete cascade;

#LINK BETEWEEN PASSENGER AND DOCTOR TABLES
alter  table MEDICENTER.PASSENGER add constraint foreign key fk_passenger_doctor (id_doctor)
references DOCTOR(id)
  on delete cascade;

#LINK BETEWEEN DRIVER AND CONTACT TABLES
alter  table MEDICENTER.DRIVER add constraint foreign key fk_driver_contact (id_contact)
references CONTACT(id)
  on delete cascade;

#LINK BETEWEEN DRIVER AND DOCTOR TABLES
alter  table MEDICENTER.DRIVER add constraint foreign key fk_driver_doctor (id_doctor)
references DOCTOR(id)
  on delete cascade;

#LINK BETEWEEN DOCTOR AND CONTACT TABLES
alter  table MEDICENTER.DOCTOR add constraint foreign key fk_doctor_contact (id_contact)
    references CONTACT(id)
    on delete cascade;

#LINK BETEWEEN USER_LINK AND USER_ACCOUNT TABLES
alter  table MEDICENTER.USER_LINK add constraint foreign key fk_userlinks_account (user_account_id)
    references USER_ACCOUNT(id)
    on delete cascade;

#LINK BETEWEEN USER_LINK AND MEDICAL_FILE TABLES
alter table MEDICENTER.USER_LINK add constraint foreign key fk_userlinks_medifile(medical_file_id)
 references MEDICAL_FILE(id)
  on DELETE cascade ;

#LINK BETEWEEN USER_LINK AND PASSENGER TABLES
alter table MEDICENTER.USER_LINK add constraint foreign key fk_userlink_passenger(passenger_id)
references PASSENGER(id)
  on DELETE cascade ;

#LINK BETEWEEN USER_LINK AND DRIVER TABLES
alter table MEDICENTER.USER_LINK add constraint foreign key fk_userlink_driver(driver_id)
  references DRIVER(id)
on DELETE cascade ;

#LINK BETEWEEN MEDICAL_FILE AND USER_LINK TABLES
alter  table MEDICENTER.MEDICAL_FILE add constraint foreign key
fk_medifile_owner (owner) references USER_LINK(user_account_id)
on delete cascade;


#############################################################
# CREATE TRIGGER FOR MANAGE USER ACCOUNT CREATION/UPDATE DATE
#############################################################

CREATE TRIGGER MEDICENTER.user_account_date_creation BEFORE INSERT
  ON MEDICENTER.USER_ACCOUNT
  FOR EACH ROW set NEW.Creation_time = now();

CREATE TRIGGER MEDICENTER.user_account_date_update BEFORE UPDATE
  ON MEDICENTER.USER_ACCOUNT
  FOR EACH ROW set NEW.update_time = now();