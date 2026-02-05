-- ===============================
-- DATABASE
-- ===============================
CREATE DATABASE store_handphone;
USE store_handphone;

-- ===============================
-- TABEL
-- ===============================
CREATE TABLE handphone (
    Kode_handphone CHAR(5) PRIMARY KEY,
    Merk VARCHAR(10),
    Model VARCHAR(15),
    Warna VARCHAR(15),
    Stok INT(3),
    Spesifikasi VARCHAR(75),
    Harga INT(10)
);

CREATE TABLE transaksi (
    Kode_transaksi CHAR(5) PRIMARY KEY,
    Kode_handphone CHAR(5),
    Nama_pelanggan VARCHAR(25),
    Tanggal_transaksi DATE,
    Harga INT(10),
    Jumlah_beli INT(5)
);

CREATE TABLE pelanggan (
    Kode_pelanggan CHAR(5) PRIMARY KEY,
    Nama_pelanggan VARCHAR(25),
    Alamat VARCHAR(30),
    No_telp VARCHAR(15),
    Email VARCHAR(20)
);

-- ===============================
-- INSERT DATA
-- ===============================
INSERT INTO handphone VALUES
('SH01','Samsung','Galaxy A05s','Silver',25,'Kamera 50MP, Baterai 5000Mah, Penyimpanan 6/128 GB',2099000),
('SH02','Samsung','Galaxy M54 5G','Hitam',40,'Kamera 108MP, Baterai 6000Mah, Penyimpanan 8/256 GB',4499000),
('SH03','Samsung','Galaxy A35 5G','Putih',30,'Kamera 50MP, Baterai 5000Mah, Penyimpanan 8/256 GB',4999000),
('SH04','Oppo','Reno 11F','Coral Purple',50,'Kamera 64MP, Baterai 5000Mah, Penyimpanan 8/256 GB',4399000),
('SH05','Oppo','Reno 11 Pro','Putih',50,'Kamera 50MP, Baterai 4600Mah, Penyimpanan 15/512 GB',8999000),
('SH06','Oppo','A60','Biru',70,'Kamera 50MP, Baterai 5000Mah, Penyimpanan 8/128 GB',2599000),
('SH07','Oppo','A18','Hitam',60,'Kamera 8MP, Baterai 5000Mah, Penyimpanan 4/128 GB',1498000),
('SH08','Xiaomi','Redmi 12','Silver',60,'Kamera 50MP, Baterai 5000Mah, Penyimpanan 8/128 GB',1999000),
('SH09','Xiaomi','Redmi Note 13','Gold',40,'Kamera 108MP, Baterai 5000Mah, Penyimpanan 8/256 GB',2399000),
('SH10','Xiaomi','Redmi 13C','Green',20,'Kamera 50MP, Baterai 5000Mah, Penyimpanan 8/256 GB',1799000);

INSERT INTO transaksi VALUES
('101','SH02','Jaegar Putra','2024-05-05',4999000,1),
('102','SH05','Fadil Hizbullah','2024-05-20',8999000,1),
('103','SH09','Nadya Tiara','2024-05-22',2399000,2),
('104','SH06','Karina Veronika','2024-05-27',2599000,3),
('105','SH03','Marka Rahardika','2024-06-01',4999000,1),
('106','SH01','Raka Ramadhan','2024-06-05',2099000,2),
('107','SH07','Malika Kamila','2024-06-10',1499000,1),
('108','SH04','Haikal Rahendra','2024-06-16',4399000,1),
('109','SH10','Dian Maharani','2024-06-22',1799000,1),
('110','SH08','Aulia Tamara','2024-06-28',1999000,2);

INSERT INTO pelanggan VALUES
('201','Karina Veronika','Depok','082311761223','karina01@gmail.com'),
('202','Raka Ramadhan','Bogor','082311761190','rakaa14@gmail.com'),
('203','Malika Kamila','Depok','082311761266','malikai@gmail.com'),
('204','Dian Maharani','Tanggerang','082311761167','dian199@gmail.com'),
('205','Marka Rahardika','Bekasi','082311761010','markaa@gmail.com'),
('206','Aulia Tamara','Sukabumi','082311761112','auliaa17@gmail.com'),
('207','Fadil Hizbullah','Bekasi','082311761225','fadil123@gmail.com'),
('208','Jaegar Putra','Bogor','082311761789','jaegar01@gmail.com'),
('209','Haikal Rahendra','Jakarta','082311761053','haikal55@gmail.com'),
('210','Nadya Tiara','Jakarta','082311761059','nadyaa69@gmail.com');

-- ===============================
-- ALTER
-- ===============================
ALTER TABLE handphone RENAME TO produk_handphone;

ALTER TABLE transaksi
CHANGE Tanggal_transaksi Tgl_transaksi DATE;

ALTER TABLE produk_handphone
ADD Garansi CHAR(10);

UPDATE produk_handphone
SET Garansi = '1 Tahun';

ALTER TABLE produk_handphone
DROP Garansi;

-- ===============================
-- QUERY
-- ===============================
SELECT * FROM pelanggan WHERE Alamat <> 'Depok';

SELECT Merk, Model, Warna
FROM produk_handphone
WHERE Merk = 'Oppo'
ORDER BY Merk DESC;

SELECT * FROM transaksi LIMIT 5;

SELECT * FROM transaksi LIMIT 1,5;

SELECT Harga FROM produk_handphone ORDER BY Harga DESC;

SELECT MIN(Harga) AS Harga_Terendah FROM produk_handphone;

SELECT SUM(Stok) AS Total_Stok FROM produk_handphone;

SELECT DISTINCT Alamat FROM pelanggan ORDER BY Alamat ASC;

SELECT Nama_pelanggan, Alamat, No_telp FROM pelanggan AS Pembeli;

SELECT Merk, Model, Spesifikasi AS `Deskripsi Produk` FROM produk_handphone;

SELECT MAX(Harga) AS `Harga termahal` FROM transaksi;

SELECT *, (Jumlah_beli * Harga) AS `Total Harga` FROM transaksi;

SELECT COUNT(*) AS Jumlah_Data FROM pelanggan;

SELECT CONCAT(
    Kode_handphone,
    ' Dengan Merk ',
    Merk,
    ' Dan Model Yaitu ',
    Model
) AS `Daftar Produk Handphone`
FROM produk_handphone;

SELECT *, Nama_pelanggan AS `Nama Pelanggan`
FROM pelanggan
ORDER BY `Nama Pelanggan` ASC;

UPDATE produk_handphone
SET Warna = 'Blue'
WHERE Warna = 'Silver';

SELECT 
produk_handphone.Kode_handphone,
transaksi.Nama_pelanggan,
transaksi.Harga,
transaksi.Jumlah_beli,
CASE
    WHEN transaksi.Jumlah_beli >= 2 THEN 'Earphone'
    ELSE 'No Bonus'
END AS Bonus_pembelian
FROM produk_handphone
INNER JOIN transaksi
ON produk_handphone.Kode_handphone = transaksi.Kode_handphone;
