/* 
task 2
Додати e-mail існуючому користувачу без e-mail`а. Вивести змінену таблицю "User"
*/      

Update "User"
    Set user_email = 'johntop1@gmail.com'
    Where user_login = 'JohnElton'

Select * from "User"
