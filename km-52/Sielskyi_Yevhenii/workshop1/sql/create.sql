/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     04.11.2018 0:17:26                           */
/*==============================================================*/


alter table Data
   drop constraint FK_DATA_DATABASE;

alter table Data
   drop constraint FK_DATA_EXCEL_FILE;

alter table Data
   drop constraint FK_DATA_LINK;

alter table Database
   drop constraint FK_DATABASE_GENERATED_DATABASE;

alter table "Database generation"
   drop constraint FK_DB_GENERATION_EXCEL_FILE;

alter table "Database generation"
   drop constraint FK_DATABASE_GENERATION_USER;

alter table "Link result of Search request"
   drop constraint FK_LINK_SEARCH_REQUEST;

alter table "Link result of Search request"
   drop constraint FK_SEARCH_REQUEST_LINK;

alter table "Rule of Data Transfer"
   drop constraint FK_DATABASE_GENERATION_RULE;

alter table "Rule of Data Transfer"
   drop constraint FK_RULE_DATABASE_GENERATION;

alter table "Search request"
   drop constraint FK_SEARCH_REQUEST_USER;

alter table "User works with Database"
   drop constraint FK_DATABASE_USER;

alter table "User works with Database"
   drop constraint FK_USER_DATABASE;

alter table "User works with Excel file"
   drop constraint FK_EXCEL_FILE_USER;

alter table "User works with Excel file"
   drop constraint FK_USER_EXCEL_FILE;

drop index "Database has Data_FK";

drop index "Link contains Data_FK";

drop index "Excel file has Data_FK";

drop table Data cascade constraints;

drop index "Generated Database_FK";

drop table Database cascade constraints;

drop index "User generates Database_FK";

drop index "Excel file for Database_FK";

drop table "Database generation" cascade constraints;

drop table "Excel file" cascade constraints;

drop table Link cascade constraints;

drop index "Link result Search request_FK";

drop index "Link result Search request2_FK";

drop table "Link result of Search request" cascade constraints;

drop table Rule cascade constraints;

drop index "Rule of Data Transfer_FK";

drop index "Rule of Data Transfer2_FK";

drop table "Rule of Data Transfer" cascade constraints;

drop index "User creates Search request_FK";

drop table "Search request" cascade constraints;

drop table "User" cascade constraints;

drop index "User works with Database_FK";

drop index "User works with Database2_FK";

drop table "User works with Database" cascade constraints;

drop index "User works with Excel file_FK";

drop index "User works with Excel file2_FK";

drop table "User works with Excel file" cascade constraints;

/*==============================================================*/
/* Table: Data                                                  */
/*==============================================================*/
create table Data 
(
   data_address         VARCHAR2(100)        not null,
   excel_file_path      VARCHAR2(100),
   excel_file_name      VARCHAR2(20),
   link_url             VARCHAR2(100),
   database_name        VARCHAR2(20),
   database_path        VARCHAR2(100),
   data_type            VARCHAR2(20)         not null,
   constraint PK_DATA primary key (data_address)
);

/*==============================================================*/
/* Index: "Excel file has Data_FK"                              */
/*==============================================================*/
create index "Excel file has Data_FK" on Data (
   excel_file_path ASC,
   excel_file_name ASC
);

/*==============================================================*/
/* Index: "Link contains Data_FK"                               */
/*==============================================================*/
create index "Link contains Data_FK" on Data (
   link_url ASC
);

/*==============================================================*/
/* Index: "Database has Data_FK"                                */
/*==============================================================*/
create index "Database has Data_FK" on Data (
   database_name ASC,
   database_path ASC
);

/*==============================================================*/
/* Table: Database                                              */
/*==============================================================*/
create table Database 
(
   database_name        VARCHAR2(20)         not null,
   database_path        VARCHAR2(100)        not null,
   user_login           VARCHAR2(30),
   excel_file_path      VARCHAR2(100),
   excel_file_name      VARCHAR2(20),
   database_generation_time DATE,
   new_database_name    VARCHAR2(20),
   new_database_path    VARCHAR2(100),
   database_size        INTEGER              not null,
   database_time        DATE                 not null,
   constraint PK_DATABASE primary key (database_name, database_path)
);

/*==============================================================*/
/* Index: "Generated Database_FK"                               */
/*==============================================================*/
create index "Generated Database_FK" on Database (
   user_login ASC,
   excel_file_path ASC,
   excel_file_name ASC,
   database_generation_time ASC,
   new_database_name ASC,
   new_database_path ASC
);

/*==============================================================*/
/* Table: "Database generation"                                 */
/*==============================================================*/
create table "Database generation" 
(
   user_login_fk        VARCHAR2(30)         not null,
   excel_file_path_fk   VARCHAR2(100)        not null,
   excel_file_name_fk   VARCHAR2(20)         not null,
   database_generation_time DATE                 not null,
   new_database_name    VARCHAR2(20)         not null,
   new_database_path    VARCHAR2(100)        not null,
   constraint "PK_DATABASE GENERATION" primary key (user_login_fk, excel_file_path_fk, excel_file_name_fk, database_generation_time, new_database_name, new_database_path)
);

/*==============================================================*/
/* Index: "Excel file for Database_FK"                          */
/*==============================================================*/
create index "Excel file for Database_FK" on "Database generation" (
   excel_file_path_fk ASC,
   excel_file_name_fk ASC
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
/* Table: Link                                                  */
/*==============================================================*/
create table Link 
(
   link_url             VARCHAR2(100)        not null,
   link_name            VARCHAR2(100)        not null,
   constraint PK_LINK primary key (link_url)
);

/*==============================================================*/
/* Table: "Link result of Search request"                       */
/*==============================================================*/
create table "Link result of Search request" 
(
   link_url             VARCHAR2(100)        not null,
   user_login_fk        VARCHAR2(30)         not null,
   search_request_time  DATE                 not null,
   constraint "PK_LINK RESULT OF SEARCH REQUE" primary key (link_url, user_login_fk, search_request_time)
);

/*==============================================================*/
/* Index: "Link result Search request2_FK"                      */
/*==============================================================*/
create index "Link result Search request2_FK" on "Link result of Search request" (
   user_login_fk ASC,
   search_request_time ASC
);

/*==============================================================*/
/* Index: "Link result Search request_FK"                       */
/*==============================================================*/
create index "Link result Search request_FK" on "Link result of Search request" (
   link_url ASC
);

/*==============================================================*/
/* Table: Rule                                                  */
/*==============================================================*/
create table Rule 
(
   rule_name            VARCHAR2(50)         not null,
   rule_content         VARCHAR2(1000)       not null,
   constraint PK_RULE primary key (rule_name)
);

/*==============================================================*/
/* Table: "Rule of Data Transfer"                               */
/*==============================================================*/
create table "Rule of Data Transfer" 
(
   user_login_fk        VARCHAR2(30)         not null,
   excel_file_path_fk   VARCHAR2(100)        not null,
   excel_file_name_fk   VARCHAR2(20)         not null,
   database_generation_time DATE                 not null,
   new_database_name    VARCHAR2(20)         not null,
   new_database_path    VARCHAR2(100)        not null,
   rule_name            VARCHAR2(50)         not null,
   constraint "PK_RULE OF DATA TRANSFER" primary key (user_login_fk, excel_file_path_fk, excel_file_name_fk, database_generation_time, new_database_name, new_database_path, rule_name)
);

/*==============================================================*/
/* Index: "Rule of Data Transfer2_FK"                           */
/*==============================================================*/
create index "Rule of Data Transfer2_FK" on "Rule of Data Transfer" (
   rule_name ASC
);

/*==============================================================*/
/* Index: "Rule of Data Transfer_FK"                            */
/*==============================================================*/
create index "Rule of Data Transfer_FK" on "Rule of Data Transfer" (
   user_login_fk ASC,
   excel_file_path_fk ASC,
   excel_file_name_fk ASC,
   database_generation_time ASC,
   new_database_name ASC,
   new_database_path ASC
);

/*==============================================================*/
/* Table: "Search request"                                      */
/*==============================================================*/
create table "Search request" 
(
   user_login_fk        VARCHAR2(30)         not null,
   search_request_time  DATE                 not null,
   search_request_content VARCHAR2(150)        not null,
   constraint "PK_SEARCH REQUEST" primary key (user_login_fk, search_request_time)
);

/*==============================================================*/
/* Index: "User creates Search request_FK"                      */
/*==============================================================*/
create index "User creates Search request_FK" on "Search request" (
   user_login_fk ASC
);

/*==============================================================*/
/* Table: "User"                                                */
/*==============================================================*/
create table "User" 
(
   user_login           VARCHAR2(30)         not null,
   user_password        VARCHAR2(30)         not null,
   user_status          VARCHAR2(20)         not null,
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

alter table Data
   add constraint FK_DATA_DATABASE foreign key (database_name, database_path)
      references Database (database_name, database_path)
      on delete cascade;

alter table Data
   add constraint FK_DATA_EXCEL_FILE foreign key (excel_file_path, excel_file_name)
      references "Excel file" (excel_file_path, excel_file_name)
      on delete cascade;

alter table Data
   add constraint FK_DATA_LINK foreign key (link_url)
      references Link (link_url)
      on delete cascade;

alter table Database
   add constraint FK_DATABASE_GENERATED_DATABASE foreign key (user_login, excel_file_path, excel_file_name, database_generation_time, new_database_name, new_database_path)
      references "Database generation" (user_login_fk, excel_file_path_fk, excel_file_name_fk, database_generation_time, new_database_name, new_database_path);

alter table "Database generation"
   add constraint FK_DB_GENERATION_EXCEL_FILE foreign key (excel_file_path_fk, excel_file_name_fk)
      references "Excel file" (excel_file_path, excel_file_name);

alter table "Database generation"
   add constraint FK_DATABASE_GENERATION_USER foreign key (user_login_fk)
      references "User" (user_login)
      on delete cascade;

alter table "Link result of Search request"
   add constraint FK_LINK_SEARCH_REQUEST foreign key (link_url)
      references Link (link_url)
      on delete cascade;

alter table "Link result of Search request"
   add constraint FK_SEARCH_REQUEST_LINK foreign key (user_login_fk, search_request_time)
      references "Search request" (user_login_fk, search_request_time)
      on delete cascade;

alter table "Rule of Data Transfer"
   add constraint FK_DATABASE_GENERATION_RULE foreign key (user_login_fk, excel_file_path_fk, excel_file_name_fk, database_generation_time, new_database_name, new_database_path)
      references "Database generation" (user_login_fk, excel_file_path_fk, excel_file_name_fk, database_generation_time, new_database_name, new_database_path)
      on delete cascade;

alter table "Rule of Data Transfer"
   add constraint FK_RULE_DATABASE_GENERATION foreign key (rule_name)
      references Rule (rule_name)
      on delete cascade;

alter table "Search request"
   add constraint FK_SEARCH_REQUEST_USER foreign key (user_login_fk)
      references "User" (user_login);

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
    
alter table Data
    add constraint data_type_values check (data_type in ('Integer', 'Float', 'Boolean', 'Date', 'Time', 'String'));