INSERT INTO "User"(user_login, user_password, user_status, user_email)
    VALUES('EugeneSel', 'anubis123', 'Admin', 'youdjin.sel15@gmail.com');
INSERT INTO "User"(user_login, user_password, user_status, user_email)
    VALUES('JohnElton', 'iamthebest', 'Prime', '');
INSERT INTO "User"(user_login, user_password, user_status, user_email)
    VALUES('vadimkakhd', '321sibuna', 'Banned', ''); 
INSERT INTO "User"(user_login, user_password, user_status, user_email)
    VALUES('tamerlan', 'rarestudent10', 'Guest', 'okay@gmail.com'); 
INSERT INTO "User"(user_login, user_password, user_status, user_email)
    VALUES('EugeneSel2', 'anubis1234', 'Default', 'youdjin.sel16@gmail.com'); 
    
INSERT INTO "Excel file"(excel_file_name, excel_file_path, excel_file_size, excel_file_time)
    VALUES('first', 'C:\', 132.0, '03.11.2018'); 
INSERT INTO "Excel file"(excel_file_name, excel_file_path, excel_file_size, excel_file_time)
    VALUES('second', '\', 122.0, '04.11.2018');  
INSERT INTO "Excel file"(excel_file_name, excel_file_path, excel_file_size, excel_file_time)
    VALUES('third', 'C:\', 142.0, '05.11.2018'); 
INSERT INTO "Excel file"(excel_file_name, excel_file_path, excel_file_size, excel_file_time)
    VALUES('first', '\', 152.0, '06.11.2018'); 
    
INSERT INTO Database(database_name, database_path, database_size, database_time)
    VALUES('first', 'E:\', 152.0, Sysdate); 
INSERT INTO Database(database_name, database_path, database_size, database_time)
    VALUES('second', 'E:\', 162.0, Sysdate); 
INSERT INTO Database(database_name, database_path, database_size, database_time)
    VALUES('third', 'E:\', 172.0, Sysdate); 
INSERT INTO Database(database_name, database_path, database_size, database_time)
    VALUES('first', 'D:\', 182.0, Sysdate); 

INSERT INTO "User works with Database"(database_name, database_path, user_login)
    VALUES('first', 'E:\', 'EugeneSel');    
INSERT INTO "User works with Database"(database_name, database_path, user_login)
    VALUES('first', 'D:\', 'EugeneSel');    
INSERT INTO "User works with Database"(database_name, database_path, user_login)
    VALUES('first', 'E:\', 'EugeneSel2');    
INSERT INTO "User works with Database"(database_name, database_path, user_login)
    VALUES('third', 'E:\', 'tamerlan');
    
INSERT INTO "User works with Excel file"(excel_file_name, excel_file_path, user_login)
    VALUES('first', 'C:\', 'JohnElton');
INSERT INTO "User works with Excel file"(excel_file_name, excel_file_path, user_login)
    VALUES('second', '\', 'tamerlan');
INSERT INTO "User works with Excel file"(excel_file_name, excel_file_path, user_login)
    VALUES('first', '\', 'EugeneSel');
INSERT INTO "User works with Excel file"(excel_file_name, excel_file_path, user_login)
    VALUES('first', '\', 'JohnElton');

INSERT INTO Rule(excel_file_name_fk, excel_file_path_fk, rule_data_address, rule_data_type)
    VALUES('third', 'C:\','[B4:C7]', 'Integer');
INSERT INTO Rule(excel_file_name_fk, excel_file_path_fk, rule_data_address, rule_data_type)
    VALUES('first', 'C:\', 'A1', 'Float');
INSERT INTO Rule(excel_file_name_fk, excel_file_path_fk, rule_data_address, rule_data_type)
    VALUES('second', '\', '[C11:C13]', 'String');
INSERT INTO Rule(excel_file_name_fk, excel_file_path_fk, rule_data_address, rule_data_type)
    VALUES('first', '\', 'E7', 'Boolean');
    
INSERT INTO "Database generation"(user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk)
    VALUES('EugeneSel', TIMESTAMP'2018-11-04 00:12:42', 'new_first', 'D:\', '', '');
INSERT INTO "Database generation"(user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk)
    VALUES('EugeneSel2', TIMESTAMP'2018-11-04 00:12:42', 'new_second', 'D:\', '', '');
INSERT INTO "Database generation"(user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk)
    VALUES('JohnElton', TIMESTAMP'2018-11-04 00:12:42', 'new_second', 'E:\', '', '');
INSERT INTO "Database generation"(user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk)
    VALUES('tamerlan', TIMESTAMP'2018-11-04 00:12:42', 'third', 'E:\', 'third', 'E:\');
    
INSERT INTO "Rule of Data Transfer"(excel_file_name_fk, excel_file_path_fk, user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk, rule_data_address)
    VALUES('third', 'C:\', 'tamerlan', TIMESTAMP'2018-11-04 00:12:42', 'third', 'E:\', 'third', 'E:\', '[B4:C7]');
INSERT INTO "Rule of Data Transfer"(excel_file_name_fk, excel_file_path_fk, user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk, rule_data_address)
    VALUES('first', 'C:\', 'tamerlan', TIMESTAMP'2018-11-04 00:12:42', 'third', 'E:\', 'third', 'E:\', 'A1');
INSERT INTO "Rule of Data Transfer"(excel_file_name_fk, excel_file_path_fk, user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk, rule_data_address)
    VALUES('second', '\', 'EugeneSel', TIMESTAMP'2018-11-04 00:12:42', 'new_first', 'D:\', '', '', '[C11:C13]');
INSERT INTO "Rule of Data Transfer"(excel_file_name_fk, excel_file_path_fk, user_login_fk, database_generation_time, new_database_name, new_database_path, database_name_fk, database_path_fk, rule_data_address)
    VALUES('first', '\', 'JohnElton', TIMESTAMP'2018-11-04 00:12:42', 'new_second', 'E:\', '', '', 'E7');