set serveroutput on

Create or replace Package output_for_user as
    Type rowExcel is record(
        excel_file_name "Excel file".excel_file_name%TYPE,
        excel_file_size "Excel file".excel_file_size%TYPE,
        excel_file_time "Excel file".excel_file_time%TYPE
    );
    
    Type tableExcel is table of rowExcel;
    
    Function get_excel_file(file_name in "Excel file".excel_file_name%TYPE)
        Return rowExcel;
        
    Function get_excel_file_list
        Return tableExcel;
        
    Type rowDB is record(
        db_name Database.database_name%TYPE,
        db_size Database.database_size%TYPE,
        db_time Database.database_time%TYPE
    );
    
    Type tableDB is table of rowDB;
    
    Function get_db(db_file_name in Database.database_name%TYPE)
        Return rowDB;
        
    Function get_db_list
        Return tableDB;
        
    Type rowUser is record(
        user_login "User".user_login%TYPE,
        user_password "User".user_password%TYPE,
        user_role "User".role_name_fk%TYPE,
        user_email "User".user_email%TYPE
    );
    
    Type tableUser is table of rowUser;
    
    Function get_user(login in "User".user_login%TYPE)
        Return rowUser;
    
    Function get_user_list
        Return tableUser;
End output_for_user;
/
Create or replace package body output_for_user as
    Function get_excel_file(file_name in "Excel file".excel_file_name%TYPE)
        return rowExcel
        is
            file_info rowExcel;
        begin
            Select * into file_info
            from "Excel file"
            where excel_file_name = file_name;
            
            If file_name not in (Select excel_file_name from "Excel file") Then
                DBMS_OUTPUT.put_line('\nExcel file with current name does not exist');
                return NULL;
            End if;
            
            return file_info;
        end get_excel_file;
        
    Function get_excel_file_list
        return tableExcel
        is
            file_list tableExcel;
        begin
            Select * Into file_list
            from "Excel file";
            
            return file_list;
        end get_excel_file_list;
        
    Function get_db(db_file_name in Database.database_name%TYPE)
        return rowDB
        is
            db_info rowDB;
        begin
            Select * into db_info
            from Database
            where database_name = db_file_name;
            
            If db_file_name not in (Select database_name from Database) Then
                DBMS_OUTPUT.put_line('\nDatabase with current name does not exist');
                return NULL;
            End if;
            
            return db_info;
        end get_db;
        
    Function get_db_list
        return tableDB
        is
            db_list tableDB;
        begin
            Select * Into db_list
            from Database;
            
            return db_list;
        end get_db_list;
        
    Function get_user(login in "User".user_login%TYPE)
        return rowUser
        is
            user_info rowUser;
        begin
            Select * into user_info
            from "User"
            where user_login = login;
            
            If login not in (Select user_login from "User") Then
                DBMS_OUTPUT.put_line('\nUser with current login does not exist');
                return NULL;
            End if;
            
            return user_info;
        end get_user;
        
    Function get_user_list
        return tableUser
        is
            user_list tableUser;
        begin
            Select * Into user_list
            from "User";
            
            return user_list;
        end get_user_list;
end;
/

Create or replace Package work_with_excel_file as
    Type rowRule is record(
        data_address Rule.rule_data_address%TYPE
    );
    
    Type tableRule is table of rowRule;
    
    Procedure update_data(file_name in "Excel file".excel_file_name%TYPE, chosen_cell in Rule.rule_data_address%TYPE, new_data in Rule.rule_data_content%TYPE);
    
    Procedure delete_data(file_name in "Excel file".excel_file_name%TYPE, chosen_cell in Rule.rule_data_address%TYPE);
    
    Procedure add_data(file_name in "Excel file".excel_file_name%TYPE, cell_address in Rule.rule_data_address%TYPE, cell_content in Rule.rule_data_content%TYPE, cell_type in Rule.rule_data_type%TYPE);
End work_with_excel_file;
/
Create or replace package body work_with_excel_file as
    Procedure update_data(file_name in "Excel file".excel_file_name%TYPE, chosen_cell in Rule.rule_data_address%TYPE, new_data in Rule.rule_data_content%TYPE) is
            rule_list tableRule;
        begin
            If file_name in (Select excel_file_name From "Excel file") Then
                Select rule_data_address into rule_list
                From Rule
                Where excel_file_name_fk = file_name;
        
                If chosen_cell in (Select rule_data_address From Rule) Then
                    Update Rule
                    Set rule_data_content = new_data
                    Where excel_file_name_fk = file_name and rule_data_address = chosen_cell;
                Else
                    DBMS_OUTPUT.put_line('\nCurrent cell is empty');
                End if;
            Else
                DBMS_OUTPUT.put_line('\nCurrent excel file does not exist');
            End if;
        end update_data;
        
    Procedure delete_data(file_name in "Excel file".excel_file_name%TYPE, chosen_cell in Rule.rule_data_address%TYPE) is
            rule_list tableRule;
        begin
            If file_name in (Select excel_file_name From "Excel file") Then
                Select rule_data_address into rule_list
                From Rule
                Where excel_file_name_fk = file_name;
        
                If chosen_cell in (Select rule_data_address From Rule) Then
                    Delete from Rule
                    Where excel_file_name_fk = file_name and rule_data_address = chosen_cell;
                Else
                    DBMS_OUTPUT.put_line('\nCurrent cell is already empty');
                End if;
            Else
                DBMS_OUTPUT.put_line('\nCurrent excel file does not exist');
            End if;
        end delete_data;
        
    Procedure add_data(file_name in "Excel file".excel_file_name%TYPE, cell_address in Rule.rule_data_address%TYPE, cell_content in Rule.rule_data_content%TYPE, cell_type in Rule.rule_data_type%TYPE) is
            rule_list tableRule;
            current_user_login Rule.user_login_fk%TYPE;
        begin
            If file_name in (Select excel_file_name From "Excel file") Then
                Select user_login_fk into current_user_login
                From "Excel file"
                Where excel_file_name = file_name;
            
                Select rule_data_address into rule_list
                From Rule
                Where excel_file_name_fk = file_name;
        
                If chosen_cell not in (Select rule_data_address From Rule) Then
                    Insert Into Rule (excel_file_name_fk, user_login_fk, rule_data_address, rule_data_content, rule_data_type)
                        Values(file_name, current_user_login, cell_address, cell_content, cell_type);
                Else
                    DBMS_OUTPUT.put_line('\nCurrent cell is not empty');
                End if;
            Else
                DBMS_OUTPUT.put_line('\nCurrent excel file does not exist');
            End if;
        end add_data;
end;
/

Create or replace package db_generation as
    Type rowRule is record(
        data_address Rule.rule_data_address%TYPE
    );
    
    Type tableRule is table of rowRule;
    
    Type array_of_addresses is varray(100) of Rule.rule_data_address%TYPE;
    
    Function choose_data(file_name in "Excel file".excel_file_name%TYPE, addresses in array_of_addresses)
        Return tableRule;
    
    Procedure create_new_db(file_name in "Excel file".excel_file_name%TYPE, new_db_name "Database generation".new_database_name%TYPE, addresses in array_of_addresses);
End db_generation;
/
Create or replace package body db_generation as
    Function choose_data(file_name in "Excel file".excel_file_name%TYPE, addresses in array_of_addresses)
    Return tableRule
    is
        rule_list tableRule;
    begin
        If file_name in (Select * From "Excel file") Then
            Select rule_address into rule_list
            From Rule
            Where excel_file_name_fk = file_name and rule_address in array_of_addresses;
            Return rule_list;
        Else
            DBMS_OUTPUT.put_line('\nCurrent excel file does not exist');
            Return NULL;
        End if;
    end choose_data;
    
    Procedure create_new_db(file_name in "Excel file".excel_file_name%TYPE, new_db_name "Database generation".new_database_name%TYPE, addresses in array_of_addresses)
    is
        chosen_data tableRule;
        current_user_login Rule.user_login_fk%TYPE;
    begin
        chosen_data := choose_data(file_name, addresses);
        If chosen_data is not NULL then
            Select user_login_fk into current_user_login
            From "Excel file"
            Where excel_file_name = file_name;
            
            If new_db_name not in (Select database_name from Database) Then
                For adr in chosen_data
                LOOP
                    Insert into "Database generation"(excel_file_name_fk, user_login_fk, rule_data_address_fk, database_generation_time, new_database_name, database_name_fk)
                        Values(file_name, current_user_login, adr.data_address, CURRENT_TIMESTAMP, new_db_name, '');
                END LOOP;
            Else
                For adr in chosen_data
                LOOP
                    Insert into "Database generation"(excel_file_name_fk, user_login_fk, rule_data_address_fk, database_generation_time, new_database_name, database_name_fk)
                        Values(file_name, current_user_login, adr.data_address, CURRENT_TIMESTAMP, new_db_name, new_db_name);
                END LOOP;
            End if;
        Else
            DBMS_OUTPUT.put_line('\nYou entered wrong excel file');
        End if;
    end create_new_db;
end;
/