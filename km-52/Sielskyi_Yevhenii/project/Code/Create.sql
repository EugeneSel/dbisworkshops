/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     10.11.2018 21:51:02                          */
/*==============================================================*/


alter table "Database generation"
   drop constraint FK_DB_GENERATION_DB;

alter table "Database generation"
   drop constraint FK_DATABASE_GENERATION_USER;

alter table Rule
   drop constraint FK_RULE_EXCEL_FILE;

alter table "Rule of Data Transfer"
   drop constraint FK_DATABASE_GENERATION_RULE;

alter table "Rule of Data Transfer"
   drop constraint FK_RULE_DATABASE_GENERATION;

alter table "User works with Database"
   drop constraint FK_DATABASE_USER;

alter table "User works with Database"
   drop constraint FK_USER_DATABASE;

alter table "User works with Excel file"
   drop constraint FK_EXCEL_FILE_USER;

alter table "User works with Excel file"
   drop constraint FK_USER_EXCEL_FILE;

drop table Database cascade constraints;

drop index "User generates Database_FK";

drop index "Generated Database_FK";

drop table "Database generation" cascade constraints;

drop table "Excel file" cascade constraints;

drop index "Excel file data Rule_FK";

drop table Rule cascade constraints;

drop index "Rule of Data Transfer_FK";

drop index "Rule of Data Transfer2_FK";

drop table "Rule of Data Transfer" cascade constraints;

drop table "User" cascade constraints;

drop index "User works with Database_FK";

drop index "User works with Database2_FK";

drop table "User works with Database" cascade constraints;

drop index "User works with Excel file_FK";

drop index "User works with Excel file2_FK";

drop table "User works with Excel file" cascade constraints;

/*==============================================================*/
/* Table: Database                                              */
/*==============================================================*/
create table Database 
(
   database_name        VARCHAR2(20)         not null,
   database_path        VARCHAR2(100)        not null,
   database_size        INTEGER              not null,
   database_time        DATE                 not null,
   constraint PK_DATABASE primary key (database_name, database_path)
);

/*==============================================================*/
/* Table: "Database generation"                                 */
/*==============================================================*/
create table "Database generation" 
(
   user_login_fk        VARCHAR2(30)         not null,
   database_generation_time DATE                 not null,
   new_database_name    VARCHAR2(20)         not null,
   new_database_path    VARCHAR2(100)        not null,
   database_name_fk     VARCHAR2(20),
   database_path_fk     VARCHAR2(100),
   constraint "PK_DATABASE GENERATION" primary key (user_login_fk, database_generation_time, new_database_name, new_database_path)
);

/*==============================================================*/
/* Index: "Generated Database_FK"                               */
/*==============================================================*/
create index "Generated Database_FK" on "Database generation" (
   database_name_fk ASC,
   database_path_fk ASC
);

/*==============================================================*/
/* Index: "User generates Database_FK"                          */
/*==============================================================*/
create index "User generates Database_FK" on "Database generation" (
   user_login_fk ASC
);

/*==============================================================*/
/* Table: "Excel file"                                          */
/*==============================================================*/
create table "Excel file" 
(
   excel_file_name      VARCHAR2(20)         not null,
   excel_file_path      VARCHAR2(100)        not null,
   excel_file_size      INTEGER              not null,
   excel_file_time      DATE                 not null,
   constraint "PK_EXCEL FILE" primary key (excel_file_path, excel_file_name)
);

/*==============================================================*/
/* Table: Rule                                                  */
/*==============================================================*/
create table Rule 
(
   excel_file_path_fk   VARCHAR2(100)        not null,
   excel_file_name_fk   VARCHAR2(20)         not null,
   rule_data_address    VARCHAR2(50)         not null,
   rule_data_type       VARCHAR2(30)         not null,
   constraint PK_RULE primary key (excel_file_path_fk, excel_file_name_fk, rule_data_address)
);

/*==============================================================*/
/* Index: "Excel file data Rule_FK"                             */
/*==============================================================*/
create index "Excel file data Rule_FK" on Rule (
   excel_file_path_fk ASC,
   excel_file_name_fk ASC
);

/*==============================================================*/
/* Table: "Rule of Data Transfer"                               */
/*==============================================================*/
create table "Rule of Data Transfer" 
(
   new_database_name    VARCHAR2(20)         not null,
   new_database_path    VARCHAR2(100)        not null,
   excel_file_path_fk   VARCHAR2(100)        not null,
   excel_file_name_fk   VARCHAR2(20)         not null,
   user_login_fk        VARCHAR2(30)         not null,
   database_generation_time DATE                 not null,
   database_name_fk     VARCHAR2(20),
   database_path_fk     VARCHAR2(100),
   rule_data_address    VARCHAR2(50)         not null,
   constraint "PK_RULE OF DATA TRANSFER" primary key (user_login_fk, database_generation_time, new_database_name, new_database_path, excel_file_path_fk, excel_file_name_fk, rule_data_address)
);

/*==============================================================*/
/* Index: "Rule of Data Transfer2_FK"                           */
/*==============================================================*/
create index "Rule of Data Transfer2_FK" on "Rule of Data Transfer" (
   excel_file_path_fk ASC,
   excel_file_name_fk ASC,
   rule_data_address ASC
);

/*==============================================================*/
/* Index: "Rule of Data Transfer_FK"                            */
/*==============================================================*/
create index "Rule of Data Transfer_FK" on "Rule of Data Transfer" (
   user_login_fk ASC,
   database_generation_time ASC,
   new_database_name ASC,
   new_database_path ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_login           VARCHAR2(30)         not null,
   user_password        VARCHAR2(30)         not null,
   user_status          VARCHAR2(30)         not null,
   user_email           VARCHAR2(30),
   constraint PK_USER primary key (user_login)
);

/*==============================================================*/
/* Table: "User works with Database"                            */
/*==============================================================*/
create table "User works with Database" 
(
   database_name        VARCHAR2(20)         not null,
   database_path        VARCHAR2(100)        not null,
   user_login           VARCHAR2(30)         not null,
   constraint "PK_USER WORKS WITH DATABASE" primary key (database_name, database_path, user_login)
);

/*==============================================================*/
/* Index: "User works with Database2_FK"                        */
/*==============================================================*/
create index "User works with Database2_FK" on "User works with Database" (
   user_login ASC
);

/*==============================================================*/
/* Index: "User works with Database_FK"                         */
/*==============================================================*/
create index "User works with Database_FK" on "User works with Database" (
   database_name ASC,
   database_path ASC
);

/*==============================================================*/
/* Table: "User works with Excel file"                          */
/*==============================================================*/
create table "User works with Excel file" 
(
   excel_file_path      VARCHAR2(100)        not null,
   excel_file_name      VARCHAR2(20)         not null,
   user_login           VARCHAR2(30)         not null,
   constraint "PK_USER WORKS WITH EXCEL FILE" primary key (excel_file_path, excel_file_name, user_login)
);

/*==============================================================*/
/* Index: "User works with Excel file2_FK"                      */
/*==============================================================*/
create index "User works with Excel file2_FK" on "User works with Excel file" (
   user_login ASC
);

/*==============================================================*/
/* Index: "User works with Excel file_FK"                       */
/*==============================================================*/
create index "User works with Excel file_FK" on "User works with Excel file" (
   excel_file_path ASC,
   excel_file_name ASC
);

alter table "Database generation"
   add constraint FK_DB_GENERATION_DB foreign key (database_name_fk, database_path_fk)
      references Database (database_name, database_path)
      on delete cascade;

alter table "Database generation"
   add constraint FK_DATABASE_GENERATION_USER foreign key (user_login_fk)
      references "User" (user_login)
      on delete cascade;

alter table Rule
   add constraint FK_RULE_EXCEL_FILE foreign key (excel_file_path_fk, excel_file_name_fk)
      references "Excel file" (excel_file_path, excel_file_name);

alter table "Rule of Data Transfer"
   add constraint FK_DATABASE_GENERATION_RULE foreign key (user_login_fk, database_generation_time, new_database_name, new_database_path)
      references "Database generation" (user_login_fk, database_generation_time, new_database_name, new_database_path)
      on delete cascade;

alter table "Rule of Data Transfer"
   add constraint FK_RULE_DATABASE_GENERATION foreign key (excel_file_path_fk, excel_file_name_fk, rule_data_address)
      references Rule (excel_file_path_fk, excel_file_name_fk, rule_data_address)
      on delete cascade;

alter table "User works with Database"
   add constraint FK_DATABASE_USER foreign key (database_name, database_path)
      references Database (database_name, database_path)
      on delete cascade;

alter table "User works with Database"
   add constraint FK_USER_DATABASE foreign key (user_login)
      references "User" (user_login)
      on delete cascade;

alter table "User works with Excel file"
   add constraint FK_EXCEL_FILE_USER foreign key (excel_file_path, excel_file_name)
      references "Excel file" (excel_file_path, excel_file_name)
      on delete cascade;

alter table "User works with Excel file"
   add constraint FK_USER_EXCEL_FILE foreign key (user_login)
      references "User" (user_login)
      on delete cascade;

alter table "User"
    add constraint user_password_unique unique (user_password);
    
alter table "User"
    add constraint user_password_length check (length(user_password) >= 8);
    
alter table "User"
    add constraint user_email_unique UNIQUE (user_email);
    
alter table "Excel file"
    add constraint excel_file_size_positive check (excel_file_size >= 0);
    
alter table Database
    add constraint database_size_positive check (database_size >= 0);
    
alter table "User"
    add constraint user_login_length check (length(user_login) >= 8);

alter table "User"
    add constraint user_login_content check (Regexp_like(user_login, '[A-Za-z0-9_]'));
    
alter table "User"
    add constraint user_password_content check (Regexp_like(user_password, '[A-Za-z0-9]'));
    
alter table "User"
    add constraint user_email_content check (Regexp_like(user_email, '[a-z0-9.@]'));
    
alter table "User"
    add constraint user_status_values check (user_status in ('Banned', 'Admin', 'Prime', 'Default', 'Guest'));
    
alter table Rule
    add constraint data_type_values check (rule_data_type in ('Integer', 'Float', 'Boolean', 'Date', 'Time', 'String'));
    
alter table "Database generation"
    add constraint new_database_name_path_match check (new_database_name = database_name_fk and new_database_path = database_path_fk);