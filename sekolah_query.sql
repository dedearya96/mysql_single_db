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

SELECT u.nama AS 'NAMA USER', n1.nilai AS 'Nilai IPA', n2.nilai AS 'NILAI IPS', n3.nilai AS 'NILAI PENJAS', n4.nilai AS 'Nilai AGAMA', n5.nilai AS 'Nilai MATEMATIKA'
FROM siswa u
LEFT JOIN nilai n1 ON u.id = n1.siswa_id AND n1.pelajaran_id =(SELECT id FROM pelajaran WHERE nama_pelajaran= 'IPA')
LEFT JOIN nilai n2 ON u.id = n2.siswa_id AND n2.pelajaran_id =(SELECT id FROM pelajaran WHERE nama_pelajaran= 'IPS')
LEFT JOIN nilai n3 ON u.id = n3.siswa_id AND n3.pelajaran_id =(SELECT id FROM pelajaran WHERE nama_pelajaran= 'PENJAS')
LEFT JOIN nilai n4 ON u.id = n4.siswa_id AND n4.pelajaran_id =(SELECT id FROM pelajaran WHERE nama_pelajaran= 'AGAMA')
LEFT JOIN nilai n5 ON u.id = n5.siswa_id AND n5.pelajaran_id =(SELECT id FROM pelajaran WHERE nama_pelajaran= 'MATEMATIKA')


SELECT
  u.nama AS 'NAMA USER',
  (SELECT nilai FROM nilai WHERE siswa_id = u.id AND pelajaran_id = (SELECT id FROM pelajaran WHERE nama_pelajaran = 'IPA')) AS 'NILAI IPA',
  (SELECT nilai FROM nilai WHERE siswa_id = u.id AND pelajaran_id = (SELECT id FROM pelajaran WHERE nama_pelajaran = 'IPS')) AS 'NILAI IPS',
  (SELECT nilai FROM nilai WHERE siswa_id = u.id AND pelajaran_id = (SELECT id FROM pelajaran WHERE nama_pelajaran = 'PENJAS')) AS 'NILAI PENJAS',
  (SELECT nilai FROM nilai WHERE siswa_id = u.id AND pelajaran_id = (SELECT id FROM pelajaran WHERE nama_pelajaran = 'AGAMA')) AS 'NILAI AGAMA',
  (SELECT nilai FROM nilai WHERE siswa_id = u.id AND pelajaran_id = (SELECT id FROM pelajaran WHERE nama_pelajaran = 'MATEMATIKA')) AS 'NILAI MATEMATIKA'
FROM siswa u;

SELECT
  u.nama AS 'NAMA USER',
  MAX(CASE WHEN p.nama_pelajaran = 'IPA' THEN n.nilai END) AS 'NILAI IPA',
  MAX(CASE WHEN p.nama_pelajaran = 'IPS' THEN n.nilai END) AS 'NILAI IPS',
  MAX(CASE WHEN p.nama_pelajaran = 'PENJAS' THEN n.nilai END) AS 'NILAI PENJAS',
  MAX(CASE WHEN p.nama_pelajaran = 'AGAMA' THEN n.nilai END) AS 'NILAI AGAMA',
  MAX(CASE WHEN p.nama_pelajaran = 'MATEMATIKA' THEN n.nilai END) AS 'NILAI MATEMATIKA'
FROM siswa u
LEFT JOIN nilai n ON u.id = n.siswa_id
JOIN pelajaran p ON n.pelajaran_id = p.id
GROUP BY u.id, u.nama;


SELECT
  u.nama AS 'NAMA USER',
  GROUP_CONCAT(CASE WHEN p.nama_pelajaran = 'IPA' THEN n.nilai END) AS 'NILAI IPA',
  GROUP_CONCAT(CASE WHEN p.nama_pelajaran = 'IPS' THEN n.nilai END) AS 'NILAI IPS',
  GROUP_CONCAT(CASE WHEN p.nama_pelajaran = 'PENJAS' THEN n.nilai END) AS 'NILAI PENJAS',
  GROUP_CONCAT(CASE WHEN p.nama_pelajaran = 'AGAMA' THEN n.nilai END) AS 'NILAI AGAMA',
  GROUP_CONCAT(CASE WHEN p.nama_pelajaran = 'MATEMATIKA' THEN n.nilai END) AS 'NILAI MATEMATIKA'
FROM siswa u
LEFT JOIN nilai n ON u.id = n.siswa_id
JOIN pelajaran p ON n.pelajaran_id = p.id
GROUP BY u.id, u.nama;