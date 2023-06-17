CREATE DATABASE users;
use users;
CREATE TABLE tbl_user(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    date DATE
)

CREATE TABLE tbl_transaksi(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    qty INT,
    date DATE,
    FOREIGN KEY (user_id) REFERENCES tbl_user(id)
);

INSERT INTO tbl_user (name, age, date)
VALUES('Jhon',34, '2023-01-1'),
	('Saga',24, '2023-03-5'),
        ('Sana',34, '2023-03-9'),
        ('Jhon',34, '2023-04-18'),
        ('Jony',34, '2023-05-10'),
        ('Agung',34, '2023-07-1');

SELECT * FROM `tbl_user` WHERE date = '2023/01/01' OR age = 20;

SELECT name as nama, age as umur, date as tanggal,
	CASE
    	WHEN age>32 THEN 'TUA'
        WHEN age>24 THEN 'DEWASA'
        ELSE 'MUDA'
    END AS status_umur
FROM `tbl_user`;

SELECT name as nama, age as umur, date as tanggal,
	CASE
    	WHEN age>32 THEN 'TUA'
        WHEN age>24 THEN 'DEWASA'
        ELSE 'MUDA'
    END AS status_umur,
    DATE_SUB(CURRENT_DATE(), INTERVAL age YEAR) as tanggal_lahir
FROM `tbl_user`;

SELECT tbl_user.name, tbl_user.age, tbl_transaksi.qty
FROM tbl_transaksi
JOIN tbl_user ON tbl_transaksi.user_id =tbl_user.id;

SELECT tbl_user.name, tbl_user.age, SUM(tbl_transaksi.qty) AS qty
FROM tbl_transaksi
JOIN tbl_user ON tbl_transaksi.user_id =tbl_user.id
GROUP BY tbl_user.name;

SELECT tbl_user.name, tbl_user.age, SUM(tbl_transaksi.qty) AS qty
FROM tbl_transaksi
JOIN tbl_user ON tbl_transaksi.user_id =tbl_user.id GROUP BY tbl_user.name
HAVING SUM(tbl_transaksi.qty)>=6;

SELECT tbl_user.name, tbl_user.age, SUM(tbl_transaksi.qty) AS qty
FROM tbl_transaksi
JOIN tbl_user ON tbl_transaksi.user_id =tbl_user.id 
WHERE tbl_user.age >20
GROUP BY tbl_user.name
HAVING SUM(tbl_transaksi.qty)>=1;



