# user_authorization.log_in() function test

Declare
    login "User".user_login%TYPE;
Begin
    login := user_authorization.log_in('EugeneSel', 'anubis123');
End;
