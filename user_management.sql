-- Creating Users
CREATE USER 'cate_admin'@'%' IDENTIFIED BY 'cate001';
GRANT ALL PRIVILEGES ON bookstore.* TO 'cate_admin'@'%' WITH GRANT OPTION;

CREATE USER 'pat_admin'@'%' IDENTIFIED BY 'pat002';
GRANT ALL PRIVILEGES ON bookstore.* TO 'pat_admin'@'%' WITH GRANT OPTION;

CREATE USER 'evan_admin'@'%' IDENTIFIED BY 'evan003';
GRANT ALL PRIVILEGES ON bookstore.* TO 'evan_admin'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;