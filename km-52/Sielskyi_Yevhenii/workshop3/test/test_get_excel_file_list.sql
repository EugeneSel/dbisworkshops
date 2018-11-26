# output_for_user.get_excel_file_list function test

Declare
Begin
    DBMS_OUTPUT.put_line('File name, Author`s login, File size, File time');
    for rec in (Select * into excel from table(output_for_user.get_excel_file_list()))
    Loop
        DBMS_OUTPUT.put_line(rec.excel_file_name || ' ' ||  rec.user_login || ' ' || rec.excel_file_size || ' ' || rec.excel_file_time);
    End Loop;
End;
