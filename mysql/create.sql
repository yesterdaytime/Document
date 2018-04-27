-- mysql --user=root mysql
CREATE USER 'finley'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'finley'@'localhost' WITH GRANT OPTION;

CREATE USER 'finley'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'finley'@'%' WITH GRANT OPTION;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'password';
GRANT RELOAD,PROCESS ON *.* TO 'admin'@'localhost';
CREATE USER 'dummy'@'localhost';

SHOW GRANTS FOR 'admin'@'localhost';
-- *********  this is not only sql ****
-- mysql -u user_name -p || -p database 
CREATE DATABASE menagerie;
SHOW databases;
USE menagerie;



