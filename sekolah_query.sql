CREATE DATABASE db_sekolah;
use db_sekolah;
CREATE TABLE siswa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(50),
    umur INT,
    alamat TEXT,
    date DATE
);

CREATE TABLE pelajaran (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelajaran VARCHAR(50),
);

CREATE TABLE nilai (
    id INT PRIMARY KEY AUTO_INCREMENT,
    siswa_id INT,
    pelajaran_id INT,
    nilai INT,
    date DATE,
    FOREIGN KEY(siswa_id) REFERENCES siswa(id),
    FOREIGN KEY(pelajaran_id) REFERENCES pelajaran(id)
);

INSERT INTO siswa (nama, umur, alamat, date) VALUES
    ('Arya Widnyana', 30, 'Karangasem', '2023-06-17'),
    ('Andika Purna', 25, 'Klungkung', '2023-06-16'),
    ('Surya Ajah', 20, 'Gianyar', '2023-06-13'),
    ('Muklis', 19, 'Badung', '2023-06-15'),
    ('Mbak Nana', 18, 'Denpasar', '2023-06-18');


INSERT INTO pelajaran (nama_pelajaran) VALUES
 ('IPA'),
 ('PENJAS'),
 ('AGAMA'),
 ('IPS'),
 ('MATEMATIKA'),
 ('TIK');

INSERT INTO nilai (siswa_id, pelajaran_id, nilai, date) VALUES
(1, 1, 80, '2023-06-16'),
(2, 2, 90, '2023-06-06'),
(3, 3, 100, '2023-06-05'),
(4, 4, 70, '2023-06-05'),
(5, 5, 95, '2023-06-04')


SELECT siswa.id, siswa.nama, siswa.alamat, siswa.umur, nilai.nilai, pelajaran.nama_pelajaran FROM siswa
JOIN nilai ON nilai.siswa_id = siswa.id
JOIN pelajaran ON pelajaran.id = nilai.pelajaran_id;

SELECT siswa.id, siswa.nama, siswa.alamat, siswa.umur, nilai.nilai, pelajaran.nama_pelajaran FROM siswa
JOIN nilai ON nilai.siswa_id = siswa.id
JOIN pelajaran ON pelajaran.id = nilai.pelajaran_id
WHERE nilai.nilai >90 AND nilai.nilai<100;

SELECT siswa.id, siswa.nama, siswa.alamat, siswa.umur, nilai.nilai, pelajaran.nama_pelajaran FROM siswa
JOIN nilai ON nilai.siswa_id = siswa.id
JOIN pelajaran ON pelajaran.id = nilai.pelajaran_id







