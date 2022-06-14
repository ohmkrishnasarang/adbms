sudo mysql -u root -p
[sudo] password for student: 
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 34
Server version: 10.0.38-MariaDB-0ubuntu0.16.04.1 Ubuntu 16.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE USER 'user1'@localhost IDENTIFIED BY 'password1';
Query OK, 0 rows affected (0.01 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'user1'@localhost IDENTIFIED BY 'password1';
Query OK, 0 rows affected (0.01 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'user1'@localhost;
+-----------------------------------------------------------------------------------------------------------------------+
| Grants for user1@localhost                                                                                            |
+-----------------------------------------------------------------------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO 'user1'@'localhost' IDENTIFIED BY PASSWORD '*668425423DB5193AF921380129F465A6425216D0' |
+-----------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

MariaDB [(none)]> REVOKE INSERT ON *.* FROM 'user1'@'localhost';
Query OK, 0 rows affected (0.00 sec)

MariaDB [(none)]> SHOW GRANTS FOR 'user1'@'localhost';
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Grants for user1@localhost                                                                                                                                                                                                                                                                                                                                                                                                 |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| GRANT SELECT, UPDATE, DELETE, CREATE, DROP, RELOAD, SHUTDOWN, PROCESS, FILE, REFERENCES, INDEX, ALTER, SHOW DATABASES, SUPER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, CREATE TABLESPACE ON *.* TO 'user1'@'localhost' IDENTIFIED BY PASSWORD '*668425423DB5193AF921380129F465A6425216D0' |
+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

//create another database and create student table.Then perform insertion.


student@student-OptiPlex-3050:~$ sudo mysql -u user1 -p
[sudo] password for student: 
Enter password: 
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 34
Server version: 10.0.38-MariaDB-0ubuntu0.16.04.1 Ubuntu 16.04

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> use db3;
Database changed
MariaDB [db3]> create table student(rollno int,name varchar(30));
Query OK, 0 rows affected (0.20 sec)

MariaDB [db3]> insert into student values(1,'sarang');
ERROR 1142 (42000): INSERT command denied to user 'user1'@'localhost' for table 'student'




