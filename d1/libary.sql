CREATE TABLE kategori (
  id SERIAL PRIMARY KEY,
  nama_kategori VARCHAR(100) NOT NULL
);

CREATE TABLE rak_buku (
  id SERIAL PRIMARY KEY,
  id_kategori INT REFERENCES kategori(id)
);

CREATE TABLE buku (
  id SERIAL PRIMARY KEY,
  nama_buku VARCHAR(150) NOT NULL,
  kategori_id INT REFERENCES kategori(id),
  id_rak INT REFERENCES rak_buku(id)
);

CREATE TABLE petugas (
  id SERIAL PRIMARY KEY,
  nama_petugas VARCHAR(100) NOT NULL,
  noHp VARCHAR(20)
);

CREATE TABLE peminjam (
  id SERIAL PRIMARY KEY,
  nama_peminjam VARCHAR(100) NOT NULL,
  alamat TEXT,
  noHp VARCHAR(20)
);

CREATE TABLE peminjaman (
  id SERIAL PRIMARY KEY,
  id_buku INT REFERENCES buku(id),
  petugas_id INT REFERENCES petugas(id),
  id_peminjam INT REFERENCES peminjam(id),
  waktu_peminjaman TIMESTAMP default CURRENT_TIMESTAMP,
  waktu_pengembalian TIMESTAMP
);


INSERT INTO kategori (nama_kategori) VALUES
('Novel'), ('Teknologi'), ('Sains'), ('Sejarah'), ('Biografi'),
('Komik'), ('Filsafat'), ('Psikologi'), ('Fantasi'), ('Ekonomi');

INSERT INTO rak_buku (id_kategori) VALUES
(1),(2),(3),(4),(5),
(6),(7),(8),(9),(10);

INSERT INTO buku (nama_buku, kategori_id, id_rak) VALUES
('Laskar Pelangi', 1, 1),
('Dasar Pemrograman Go', 2, 2),
('Fisika Dasar', 3, 3),
('Perang Dunia II', 4, 4),
('Kisah Habibie', 5, 5),
('One Piece Vol.1', 6, 6),
('Sejarah Filsafat Barat', 7, 7),
('Psikologi Sosial', 8, 8),
('Harry Potter', 9, 9),
('Teori Ekonomi Mikro', 10, 10);

INSERT INTO petugas (nama_petugas, noHp) VALUES
('Cristian', '081234567890'),
('Yulma', '081234567891'),
('Wibowo', '081234567892'),
('Sidiq', '081234567893'),
('Yusuf', '081234567894'),
('Income', '081234567895'),
('Titus', '081234567896'),
('Lala', '081234567897'),
('Febri', '081234567898'),
('Farid', '081234567899');

INSERT INTO peminjam (nama_peminjam, alamat, noHp) VALUES
('Habib', 'Jakarta', '08912340001'),
('Oped', 'Bandung', '08912340002'),
('Radif', 'Surabaya', '08912340003'),
('Slamet', 'Medan', '08912340004'),
('Anggi', 'Semarang', '08912340005'),
('Ce', 'Yogyakarta', '08912340006'),
('Be', 'Malang', '08912340007'),
('De', 'Makassar', '08912340008'),
('Fe', 'Bali', '08912340009'),
('Ge', 'Padang', '08912340010');

INSERT INTO peminjaman (id_buku, petugas_id, id_peminjam) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);


