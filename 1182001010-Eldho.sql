-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Nov 2020 pada 13.08
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstoredb`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `authors`
--

CREATE TABLE `authors` (
  `authorID` int(11) NOT NULL,
  `authorName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `authors`
--

INSERT INTO `authors` (`authorID`, `authorName`) VALUES
(1, 'Mikel Oyarzabal'),
(2, 'Rayan Cherki'),
(3, 'Pedro Gonzalez Lopez'),
(4, 'Rafael Leao'),
(5, 'Ansu Fati'),
(6, 'Alexis Saelemaeker');

-- --------------------------------------------------------

--
-- Struktur dari tabel `book`
--

CREATE TABLE `book` (
  `bookID` int(11) NOT NULL,
  `authorID` int(11) NOT NULL,
  `hargaBuku` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `book`
--

INSERT INTO `book` (`bookID`, `authorID`, `hargaBuku`) VALUES
(1010, 1, 40000),
(1011, 2, 50000),
(1012, 3, 35000),
(1013, 4, 25000),
(1014, 5, 75000),
(1015, 6, 40000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `pelangganID` int(11) NOT NULL,
  `pelangganName` varchar(100) NOT NULL,
  `nomorHP` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`pelangganID`, `pelangganName`, `nomorHP`) VALUES
(9101, 'Keanu Reeves', 2147483647),
(9102, 'Makoto Shinkai', 2147483647),
(9103, 'Agatha Christie', 2147483647),
(9104, 'Nancy Springer', 2147483647),
(9105, 'Sir Arthur Conan Doyle', 2147483647),
(9106, 'Yonezawa Honobu', 2147483647);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksiID` int(11) NOT NULL,
  `jumlahBuku` int(5) NOT NULL,
  `bookID` int(11) NOT NULL,
  `pelangganID` int(11) NOT NULL,
  `totalHarga` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksiID`, `jumlahBuku`, `bookID`, `pelangganID`, `totalHarga`) VALUES
(51101, 2, 1010, 9101, '80000.00'),
(51102, 1, 1011, 9102, '50000.00'),
(51103, 2, 1012, 9103, '70000.00'),
(51104, 3, 1013, 9104, '75000.00'),
(51105, 1, 1014, 9105, '75000.00'),
(51106, 1, 1015, 9106, '40000.00');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`authorID`);

--
-- Indeks untuk tabel `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`bookID`),
  ADD KEY `authorID` (`authorID`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`pelangganID`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksiID`),
  ADD KEY `bookID` (`bookID`),
  ADD KEY `pelangganID` (`pelangganID`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`authorID`) REFERENCES `authors` (`authorID`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookID`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`pelangganID`) REFERENCES `pelanggan` (`pelangganID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
