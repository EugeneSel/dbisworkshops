/* 
task 2
Видалити користувача, який робив пошуковий запит
*/

Delete from "User"
    Where user_login = 'tamerlan' and
    user_login in (select user_login_fk from "Search request")
