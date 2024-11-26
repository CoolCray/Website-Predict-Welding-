-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2024 pada 09.29
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `welding`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_component1`
--

CREATE TABLE `tbl_component1` (
  `component1` varchar(16) DEFAULT NULL,
  `endcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_component1`
--

INSERT INTO `tbl_component1` (`component1`, `endcode`) VALUES
('15 ELBOW', 0),
('20 ELBOW', 1),
('22.5 ELBOW', 2),
('25 ELBOW', 3),
('30 ELBOW', 4),
('30 ELBOW MITER', 5),
('45 ELBOW', 6),
('55 ELBOW', 7),
('60 ELBOW', 8),
('90 ELBOW', 9),
('ANCHOR FLANGE', 10),
('BALL VALVE', 11),
('BARRED TEE', 12),
('BLIND FLANGE', 13),
('BOX PIN', 14),
('CAP', 15),
('CHECK VALVE', 16),
('CON. REDUCER', 17),
('CON. SWAGE  NIPP', 18),
('CON. SWAGE NIPPL', 19),
('CONC. SWAGE NIPP', 20),
('COOPLER', 21),
('COUPLING', 22),
('DBB VALVE', 23),
('DRIP TRAY', 24),
('ECC. RED', 25),
('ECC. REDUCER', 26),
('ECC. SWAGE  NIPP', 27),
('ECC. SWAGE NIPPL', 28),
('ELBOW 45', 29),
('EQUIPMENT', 31),
('EXP. JOINT', 32),
('FLANGE', 33),
('FLANGE LAP JOINT', 34),
('FLANGE SO', 35),
('FULL COUPLING', 36),
('GATE VALVE', 37),
('GLOBE VALVE', 41),
('HALF COUPLING', 42),
('HOSE CONN.', 43),
('HOSE COUPLING', 44),
('HOTBEND 10', 45),
('HOTBEND 15', 46),
('HOTBEND 20', 47),
('HOTBEND 25', 48),
('HOTBEND 30', 49),
('HOTBEND 35', 50),
('HOTBEND 45', 51),
('HOTBEND 50', 52),
('HOTBEND 60', 53),
('HOTBEND 65', 54),
('HOTBEND 70', 55),
('HOTBEND 90', 56),
('IND', 57),
('INSTRUMENT', 58),
('INSTRUMENT ', 59),
('LATERAL RED. TEE', 60),
('LATERAL TEE', 61),
('LATROLET', 62),
('MIJ', 63),
('NEEDLE VALVE', 64),
('NIPPLE', 65),
('ORIFICE FLANGE', 66),
('PADLE PLATE', 67),
('PIN-PIN', 68),
('PIPE', 69),
('PIPE BEND', 70),
('PLATE', 71),
('PLUG', 72),
('QUICK COUPLING', 73),
('RED TEE', 74),
('RED. BUSHING', 75),
('RED. COUPLING', 76),
('RED. FLANGE', 77),
('SOCKOLET', 79),
('STRAINER', 80),
('T-STRAINER', 81),
('TEE', 82),
('THREADOLET', 83),
('THREDOLET', 84),
('UNION', 85),
('VALVE', 86),
('VENDOR', 87),
('WELDOFLANGE', 88),
('WELDOLET', 89);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_component2`
--

CREATE TABLE `tbl_component2` (
  `component2` varchar(16) DEFAULT NULL,
  `endcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_component2`
--

INSERT INTO `tbl_component2` (`component2`, `endcode`) VALUES
('15 ELBOW', 0),
('20 ELBOW', 1),
('22.5 ELBOW', 2),
('25 ELBOW', 3),
('30 ELBOW', 4),
('30 ELBOW MITER', 5),
('410-SP-SLR-0001', 6),
('45 ELBOW', 7),
('45 R.PAD', 8),
('45 STUB-IN', 9),
('55 ELBOW', 10),
('60 ELBOW', 11),
('710-SP-QC-9003', 12),
('90 ELBOW', 13),
('ANCHOR FLANGE', 14),
('BALL VALVE', 15),
('BARRED TEE', 16),
('BLIND FLANGE', 17),
('BOX PIN', 18),
('BUGS SCREEN', 19),
('CAP', 20),
('CHECK VALVE', 21),
('CON. REDUCER', 22),
('CON. SWAGE  NIPP', 23),
('CON. SWAGE NIPPL', 24),
('CONC. SWAGE NIPP', 25),
('COOPLER', 26),
('DRIP TRAY', 27),
('ECC. RED', 28),
('ECC. REDUCER', 29),
('ECC. SWAGE  NIPP', 30),
('ECC. SWAGE NIPPL', 31),
('EQUIPMENT', 33),
('EQUIPMENT GAS', 34),
('EXP. JOINT', 35),
('FLANGE', 36),
('FLANGE LAP JOINT', 37),
('FLANGE SO', 38),
('FULL 45 R.PAD', 39),
('FULL COUPLING', 40),
('FULL PAD 45', 41),
('GATE VALVE', 42),
('GLOBE VALVE', 44),
('HALF COUPLING', 45),
('HOSE CONN.', 46),
('HOSE COUPLING', 47),
('HOTBEND 10', 49),
('HOTBEND 15', 50),
('HOTBEND 20', 51),
('HOTBEND 25', 52),
('HOTBEND 30', 53),
('HOTBEND 35', 54),
('HOTBEND 45', 55),
('HOTBEND 50', 56),
('HOTBEND 65', 57),
('HOTBEND 70', 58),
('HOTBEND 90', 59),
('INSTRUMENT', 60),
('INSTRUMENT ', 61),
('LATERAL RED. TEE', 62),
('LATERAL TEE', 63),
('LATROLET', 64),
('MIJ', 65),
('NEEDLE VALVE', 66),
('NIPPLE', 67),
('ORIFICE FLANGE', 68),
('PADLE PLATE', 69),
('PIN-PIN', 70),
('PIPE', 71),
('PIPE BEND', 72),
('PLATE', 73),
('PLUG', 74),
('QUICK COUPLING', 75),
('QUICK COUPLING S', 76),
('R-PAD', 77),
('RED. BUSHING', 78),
('RED. COUPLING', 79),
('RED. FLANGE', 80),
('RED. TEE', 81),
('SOCKOLET', 82),
('SPRAY NOZZLE', 83),
('STRAINER', 84),
('STUB IN', 85),
('STUB VALVE', 86),
('T-STRAINER', 87),
('TEE', 88),
('THREADOLET', 89),
('THREDOLET', 90),
('UNION', 91),
('VALVE', 92),
('WELDOFLANGE', 93),
('WELDOLET', 94);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_schedule`
--

CREATE TABLE `tbl_schedule` (
  `schedule` varchar(16) DEFAULT NULL,
  `endcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_schedule`
--

INSERT INTO `tbl_schedule` (`schedule`, `endcode`) VALUES
('10', 1),
('100', 2),
('1034', 3),
('1034 kPag', 4),
('10S', 5),
('11.13', 6),
('12.7', 7),
('120', 8),
('14,27', 9),
('14.27', 10),
('15,88', 11),
('15.88', 12),
('160', 13),
('18.88', 14),
('19,05', 15),
('19.05', 16),
('190', 17),
('20', 18),
('22.05', 19),
('25,4', 20),
('25.4', 21),
('25.40', 22),
('26.33', 23),
('28,37', 24),
('28.37', 25),
('30', 26),
('345 kPag', 27),
('38,89', 28),
('38.89', 29),
('40', 30),
('40S', 31),
('46.02', 32),
('50.04', 33),
('6.02', 34),
('60', 35),
('60.08', 36),
('690 kPag', 37),
('80', 38),
('80S', 39),
('9.5', 40),
('9.53', 41),
('CL. 150', 42),
('CL. 1500', 43),
('CL. 300', 44),
('CL. 3000', 45),
('CL. 600', 46),
('CL. 6000', 47),
('CL. 800', 48),
('CL. 9000', 49),
('CL.150', 50),
('SDR 7', 51),
('SDR 7.4', 52),
('SDR 9', 53),
('STD', 54),
('VTA', 55),
('XS', 56),
('XXS', 57);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`username`, `password`) VALUES
('kresna', 'ikan'),
('1', '1'),
('2', '2'),
('2024-10-26', '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_welding`
--

CREATE TABLE `tb_welding` (
  `no` int(16) NOT NULL,
  `date` datetime DEFAULT NULL,
  `size` float DEFAULT NULL,
  `component1` varchar(16) DEFAULT NULL,
  `component2` varchar(16) DEFAULT NULL,
  `schedule` varchar(16) DEFAULT NULL,
  `predict` varchar(1) DEFAULT NULL,
  `S` float DEFAULT NULL,
  `F` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_welding`
--

INSERT INTO `tb_welding` (`no`, `date`, `size`, `component1`, `component2`, `schedule`, `predict`, `S`, `F`) VALUES
(35, '2024-11-08 01:29:45', 3, 'BOX PIN', 'ANCHOR FLANGE', '1034', 'F', 40.66, 59.34),
(36, '2024-11-08 01:32:10', 6, 'PIPE', 'FLANGE', '10S', 'S', 70.86, 29.14),
(37, '2024-11-08 01:32:18', 6, 'PIPE', 'FLANGE', '40S', 'S', 82.3, 17.7),
(38, '2024-11-08 01:32:34', 0.75, 'ANCHOR FLANGE', 'FLANGE SO', '1034 kPag', 'F', 33.62, 66.38),
(39, '2024-11-08 01:32:52', 1, '25 ELBOW', 'HOTBEND 70', '120', 'F', 27.88, 72.12),
(40, '2024-11-08 14:57:12', 3, 'BARRED TEE', 'BALL VALVE', '1034', 'F', 44.58, 55.42),
(41, '2024-11-11 15:02:53', 3, 'BOX PIN', 'BOX PIN', '10S', 'F', 38.19, 61.81),
(42, '2024-11-12 08:53:38', 0.75, '90 ELBOW', 'GATE VALVE', '10S', 'F', 16.64, 83.36),
(43, '2024-11-12 10:37:22', 6, 'PIPE', 'GATE VALVE', '80S', 'F', 44.9, 55.1),
(44, '2024-11-12 10:37:57', 6, 'PIPE', 'FLANGE', '40S', 'S', 82.3, 17.7),
(45, '2024-11-12 10:38:29', 0.75, 'FLANGE', 'PIPE', '40S', 'F', 0, 100),
(46, '2024-11-12 10:39:06', 6, 'PIPE', 'FLANGE', '80S', 'S', 80.12, 19.88),
(47, '2024-11-18 23:16:14', 6, '90 ELBOW', 'RED. TEE', '100', 'S', 63.63, 36.37),
(48, '2024-11-18 23:19:27', 3, '90 ELBOW', '45 STUB-IN', '9.5', 'F', 46.63, 53.37),
(49, '2024-11-19 08:45:34', 3, 'ANCHOR FLANGE', '45 R.PAD', '25,4', 'F', 41.26, 58.74),
(50, '2024-11-20 14:13:31', 1, 'FLANGE', 'EQUIPMENT', '80', 'F', 0.11, 99.89),
(51, '2024-11-21 15:14:32', 3, '60 ELBOW', '90 ELBOW', '1034 kPag', 'S', 78.55, 21.45),
(52, '2024-11-21 15:31:04', 3, 'BLIND FLANGE', '710-SP-QC-9003', '1034 kPag', 'S', 56.47, 43.53),
(53, '2024-11-21 15:35:53', 6, 'BOX PIN', '710-SP-QC-9003', '1034 kPag', 'S', 50.1, 49.9),
(54, '2024-11-21 15:36:06', 3, 'BOX PIN', '710-SP-QC-9003', '1034 kPag', 'S', 57.07, 42.93),
(55, '2024-11-21 15:42:19', 6, 'BARRED TEE', 'ANCHOR FLANGE', '1034 kPag', 'S', 55.77, 44.23),
(56, '2024-11-21 15:42:30', 6, 'BALL VALVE', '60 ELBOW', '1034 kPag', 'S', 53.77, 46.23),
(57, '2024-11-21 15:42:33', 6, 'BALL VALVE', '60 ELBOW', '1034 kPag', 'S', 53.77, 46.23),
(58, '2024-11-21 16:07:14', 3, 'BALL VALVE', '45 STUB-IN', '14.27', 'F', 44.58, 55.42),
(59, '2024-11-21 16:07:31', 3, 'BARRED TEE', '90 ELBOW', '14,27', 'S', 69.92, 30.08),
(60, '2024-11-21 16:07:41', 3, 'BARRED TEE', '90 ELBOW', '80', 'S', 79.6, 20.4),
(61, '2024-11-22 11:20:19', 3, 'BARRED TEE', '710-SP-QC-9003', '11.13', 'F', 44.23, 55.77);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_welding`
--
ALTER TABLE `tb_welding`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_welding`
--
ALTER TABLE `tb_welding`
  MODIFY `no` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
