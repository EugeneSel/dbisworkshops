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

INSERT INTO Link(link_url, link_name)
    VALUES('https://kpi.ua/en', 'Igor Sikorsky Kyiv Polytechnic Institute | National Technical University of Ukraine'); 
INSERT INTO Link(link_url, link_name)
    VALUES('https://en.wikipedia.org/wiki/FPM', 'FPM - Wikipedia');
INSERT INTO Link(link_url, link_name)
    VALUES('https://github.com/', 'The world`s leading software development platform · GitHub');
INSERT INTO Link(link_url, link_name)
    VALUES('https://en.wikipedia.org/wiki/Amis', 'Amis - Wikipedia');
    
INSERT INTO "Search request"(user_login_fk, search_request_time, search_request_content)
    VALUES('EugeneSel', TIMESTAMP'2018-11-03 23:13:27', 'national technical university of ukraine');
INSERT INTO "Search request"(user_login_fk, search_request_time, search_request_content)
    VALUES('JohnElton', TIMESTAMP'2018-11-03 23:13:27', 'fpm');
INSERT INTO "Search request"(user_login_fk, search_request_time, search_request_content)
    VALUES('EugeneSel2', TIMESTAMP'2018-11-03 23:13:27', 'github');
INSERT INTO "Search request"(user_login_fk, search_request_time, search_request_content)
    VALUES('tamerlan', TIMESTAMP'2018-11-03 23:13:27', 'amis');
    
INSERT INTO "Link result of Search request"(link_url, user_login_fk, search_request_time)
    VALUES('https://kpi.ua/en', 'EugeneSel', TIMESTAMP'2018-11-03 23:13:27');
INSERT INTO "Link result of Search request"(link_url, user_login_fk, search_request_time)
    VALUES('https://en.wikipedia.org/wiki/FPM', 'JohnElton', TIMESTAMP'2018-11-03 23:13:27');
INSERT INTO "Link result of Search request"(link_url, user_login_fk, search_request_time)
    VALUES('https://github.com/', 'EugeneSel2', TIMESTAMP'2018-11-03 23:13:27');
INSERT INTO "Link result of Search request"(link_url, user_login_fk, search_request_time)
    VALUES('https://en.wikipedia.org/wiki/Amis', 'tamerlan', TIMESTAMP'2018-11-03 23:13:27');
    
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
    
INSERT INTO Data(data_address, excel_file_name, excel_file_path, link_url, database_name, database_path, data_type)
    VALUES('"User".user_login[3]', '', '', '', 'first', 'E:\', 'String');
INSERT INTO Data(data_address, excel_file_name, excel_file_path, link_url, database_name, database_path, data_type)
    VALUES('A1', 'first', 'C:\', '', '', '', 'Float');
INSERT INTO Data(data_address, excel_file_name, excel_file_path, link_url, database_name, database_path, data_type)
    VALUES('<div>[9]', '', '', 'https://kpi.ua/en', '', '', 'String');
INSERT INTO Data(data_address, excel_file_name, excel_file_path, link_url, database_name, database_path, data_type)
    VALUES('link.link_url[2]', '', '', '', 'third', 'E:\', 'String');

INSERT INTO Rule(rule_name, rule_content)
    VALUES('Float Transfer', 'Float values transfers pass without rounding off');
INSERT INTO Rule(rule_name, rule_content)
    VALUES('Boolean Transfer of 0 and 1', '1 transfers to True, 0 transfers to False');
INSERT INTO Rule(rule_name, rule_content)
    VALUES('Date Transfer format', 'Date values transfers in format DD.MM.YYYY');
INSERT INTO Rule(rule_name, rule_content)
    VALUES('Time Transfer format', 'Time values transfers in format HH24.MM.SS');
    
INSERT INTO "Database generation"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path)
    VALUES('EugeneSel', 'third', 'C:\', TIMESTAMP'2018-11-04 00:12:42', 'new_first', 'D:\');
INSERT INTO "Database generation"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path)
    VALUES('EugeneSel2', 'first', 'C:\', TIMESTAMP'2018-11-04 00:12:42', 'new_second', 'D:\');
INSERT INTO "Database generation"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path)
    VALUES('JohnElton', 'second', '\', TIMESTAMP'2018-11-04 00:12:42', 'new_second', 'E:\');
INSERT INTO "Database generation"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path)
    VALUES('tamerlan', 'first', '\', TIMESTAMP'2018-11-04 00:12:42', 'new_third', 'D:\');
    
INSERT INTO "Rule of Data Transfer"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path, rule_name)
    VALUES('tamerlan', 'first', '\', TIMESTAMP'2018-11-04 00:12:42', 'new_third', 'D:\', 'Float Transfer');
INSERT INTO "Rule of Data Transfer"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path, rule_name)
    VALUES('tamerlan', 'first', '\', TIMESTAMP'2018-11-04 00:12:42', 'new_third', 'D:\', 'Date Transfer format');
INSERT INTO "Rule of Data Transfer"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path, rule_name)
    VALUES('EugeneSel', 'third', 'C:\', TIMESTAMP'2018-11-04 00:12:42', 'new_first', 'D:\', 'Boolean Transfer of 0 and 1');
INSERT INTO "Rule of Data Transfer"(user_login_fk, excel_file_name_fk, excel_file_path_fk, database_generation_time, new_database_name, new_database_path, rule_name)
    VALUES('JohnElton', 'second', '\', TIMESTAMP'2018-11-04 00:12:42', 'new_second', 'E:\', 'Time Transfer format');