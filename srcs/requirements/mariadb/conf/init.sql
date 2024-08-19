CREATE DATABASE IF NOT EXISTS NAME;

GRANT ALL ON NAME.* TO 'USER'@'localhost' IDENTIFIED BY 'PASSWD';
GRANT ALL ON NAME.* TO 'USER'@'%' IDENTIFIED BY 'PASSWD';

FLUSH PRIVILEGES;

GRANT ALL ON NAME.* TO 'root'@'localhost' IDENTIFIED BY 'ROOTPW';
GRANT ALL ON NAME.* TO 'root'@'%' IDENTIFIED BY 'ROOTPW';

SET PASSWORD FOR 'root'@'localhost' = PASSWORD('ROOTPW');
SET PASSWORD FOR 'root'@'%'=PASSWORD('ROOTPW');

FLUSH PRIVILEGES;

