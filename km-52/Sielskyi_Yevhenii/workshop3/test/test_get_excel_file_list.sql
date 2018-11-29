# output_for_user.get_excel_file_list function test

Declare
    Type rowExcel is record(
        excel_file_name "Excel file".excel_file_name%TYPE,
        user_login "Excel file".user_login_fk%TYPE,
        excel_file_size "Excel file".excel_file_size%TYPE,
        excel_file_time "Excel file".excel_file_time%TYPE
    );
    
    excel rowExcel;
Begin
    DBMS_OUTPUT.put_line('File name, Author`s login, File size, File time');
    for rec in (Select * into excel from table(output_for_user.get_excel_file_list()))
    Loop
        DBMS_OUTPUT.put_line(rec.excel_file_name || ' ' ||  rec.user_login || ' ' || rec.excel_file_size || ' ' || rec.excel_file_time);
    End Loop;
End;
