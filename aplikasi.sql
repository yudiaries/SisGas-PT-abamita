-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 11 Sep 2017 pada 18.36
-- Versi Server: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `barang_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`barang_id`, `kategori_id`, `nama_barang`, `harga`, `qty`) VALUES
(1, 1, 'Gas Elpigi 12 Kg', 100000, 10750),
(2, 1, 'Gas Elpigi 3 Kg', 127500, 7755);

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `barang_id` int(11) NOT NULL,
  `barang_masuk_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang_masuk`
--

INSERT INTO `barang_masuk` (`barang_id`, `barang_masuk_id`, `qty`) VALUES
(1, 1, 2000),
(2, 2, 2000);

--
-- Trigger `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `barang` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE barang SET qty=qty+NEW.qty
    WHERE barang_id=NEW.barang_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `kategori_id` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori_barang`
--

INSERT INTO `kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
(1, 'Gas Elpiji');

-- --------------------------------------------------------

--
-- Struktur dari tabel `operator`
--

CREATE TABLE `operator` (
  `operator_id` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `last_login` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `operator`
--

INSERT INTO `operator` (`operator_id`, `nama_lengkap`, `username`, `password`, `last_login`) VALUES
(8, 'abamita', 'abamita', 'f837fdbe1be08e982e12d626ddf8e8fb', '2017-09-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `Id_klien` int(2) NOT NULL,
  `Sub_Penyalur` varchar(19) DEFAULT NULL,
  `Type` varchar(17) DEFAULT NULL,
  `No_Registrasi` decimal(7,6) DEFAULT NULL,
  `Alamat` varchar(29) DEFAULT NULL,
  `Provinsi` varchar(50) DEFAULT NULL,
  `Kab` varchar(11) DEFAULT NULL,
  `Kecamatan` varchar(12) DEFAULT NULL,
  `Desa` varchar(12) DEFAULT NULL,
  `Tlp_Kantor` bigint(11) DEFAULT NULL,
  `Pemilik` varchar(17) DEFAULT NULL,
  `KTP_Pemilik` decimal(7,6) DEFAULT NULL,
  `HP_Pemilik` bigint(11) DEFAULT NULL,
  `Qty_Kontrak` int(4) DEFAULT NULL,
  `Kode_Pos` int(5) DEFAULT NULL,
  `Status` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`Id_klien`, `Sub_Penyalur`, `Type`, `No_Registrasi`, `Alamat`, `Provinsi`, `Kab`, `Kecamatan`, `Desa`, `Tlp_Kantor`, `Pemilik`, `KTP_Pemilik`, `HP_Pemilik`, `Qty_Kontrak`, `Kode_Pos`, `Status`) VALUES
(1, 'A. Bukhori', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 001 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 85292601833, 'Bukhori', '9.999999', 85292601833, 450, 59463, 'Active'),
(2, 'A. Jupri', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 07 / Rw 02', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 82329082859, 'A. Jupri', '9.999999', 82329082859, 270, 59463, 'Active'),
(3, 'Abdullah Nauval', 'Pangkalan LPG PSO', '9.999999', 'Klepu Rt.13 / Rw.01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KELING', 'KLEPU', 85225511006, 'Abdullah Nauval', '9.999999', 85225511006, 400, 59454, 'Active'),
(4, 'Adriyan Susanto', 'Pangkalan LPG PSO', '9.999999', 'Bugel Rt 01 / Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'BUGEL', 8532811736, 'Adriyan Susanto', '9.999999', 8532811736, 450, 59463, 'Active'),
(5, 'Ahmad Baidhowi', 'Pangkalan LPG PSO', '9.999999', 'Kriyan Rt 02 / Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KALINYAMATAN', 'KRIYAN', 8122851584, 'Ahmad Baidhowi', '9.999999', 8122851584, 450, 59462, 'Active'),
(6, 'Ahmad Mustakim', 'Pangkalan LPG PSO', '9.999999', 'Bawu Rt 01 / Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BATEALIT', 'BAWU', 8122823410, 'Ahmad Mustakim', '9.999999', 8122823410, 500, 59461, 'Active'),
(7, 'Ahmad Najib', 'Pangkalan LPG PSO', '9.999999', 'Bugel Rt 05 / Rw 02', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'BUGEL', 82322714245, 'Ahmad Najib', '9.999999', 82322714245, 450, 59463, 'Active'),
(8, 'Ali Imron', 'Pangkalan LPG PSO', '9.999999', 'Tulakan Rt 006 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'DONOROJO', 'TULAKAN', 85290323031, 'Ali Imron', '9.999999', 85290323031, 675, 59454, 'Active'),
(9, 'Arif Rahman Hakim', 'Pangkalan LPG PSO', '9.999999', 'Kelet 38 / Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KELING', 'KELET', 85290210001, 'Arif Rahman Hakim', '9.999999', 85290210001, 1900, 59454, 'Active'),
(10, 'Arni Utami', 'Pangkalan LPG PSO', '9.999999', 'Jondang Rt 002 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'JONDANG', 87831900027, 'Arni Utami', '9.999999', 87831900027, 360, 59463, 'Active'),
(11, 'Dewi Ningsih', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 16 / Rw 04', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 85225948318, 'Dewi Ningsih', '9.999999', 85225948318, 4050, 59463, 'Active'),
(12, 'Didik Sugiyatno', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt 03 / Rw 02', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 8290102112, 'Didik Sugiyatno', '9.999999', 8290102112, 240, 59463, 'Active'),
(13, 'Dlohiyah', 'Pangkalan LPG PSO', '9.999999', 'Surodadi Rt 01 / Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'SURODADI', 85326713622, 'Dlohiyah', '9.999999', 85326713622, 325, 59463, 'Active'),
(14, 'Eko Septantyorini', 'Pangkalan LPG PSO', '9.999999', 'Kali Garang rt 02 / Rw 05', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KELING', 'KALIGARANG', 82216102833, 'Eko Septantyorini', '9.999999', 82216102833, 360, 59454, 'Active'),
(15, 'Gudang PT. ABA MITA', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt.001 Rw.004', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 81390582555, 'Anwar Irsyad', '9.999999', 81390582555, 450, 59463, 'Active'),
(16, 'Hamdi', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 005 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 85640513814, 'Hamdi', '9.999999', 85640513814, 225, 59463, 'Active'),
(17, 'Ismail', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt 010 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 8122823569, 'Ismail', '9.999999', 8122823569, 450, 59463, 'Active'),
(18, 'Kumariyah', 'Pangkalan LPG PSO', '9.999999', 'Pekalongan Rt 001 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BATEALIT', 'PEKALONGAN', 85226320565, 'Kumariyah', '9.999999', 85226320565, 500, 59461, 'Active'),
(19, 'Linda Damayanti', 'Pangkalan LPG PSO', '9.999999', 'Randusari Rt 014  / Rw 005', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'SENENAN', 87733693653, 'Linda Damayanti', '9.999999', 87733693653, 150, 59426, 'Active'),
(20, 'Luluk Faizah', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 006 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 81390198540, 'Luluk Faizah', '9.999999', 81390198540, 350, 59463, 'Active'),
(21, 'M. Ali Ridlwan', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 09 / Rw 03', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 82322708338, 'M. Ali Ridlwan', '9.999999', 82322708338, 400, 59463, 'Active'),
(22, 'M. Fathoni Akbar', 'Pangkalan LPG PSO', '9.999999', 'Tahunan Rt 05 / Rw 03', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'TAHUNAN', 85292122237, 'M. Fathoni Akbar', '9.999999', 85292122237, 320, 59451, 'Active'),
(23, 'Makhin', 'Pangkalan LPG PSO', '9.999999', 'petekeyan Rt 020 / Rw 004', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'PETEKEYAN', 81326721320, 'Makhin', '9.999999', 81326721320, 450, 59423, 'Active'),
(24, 'Mas Adi', 'Pangkalan LPG PSO', '9.999999', 'Bangsri Rt 002 / Rw 009', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BANGSRI', 'BANGSRI', 82313251781, 'Mas Adi', '9.999999', 82313251781, 500, 59453, 'Active'),
(25, 'Mintiasih', 'Pangkalan LPG PSO', '9.999999', 'Petekeyan Rt 012 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'PETEKEYAN', 85227050439, 'Mintiasih', '9.999999', 85227050439, 450, 59423, 'Active'),
(26, 'Mu\'allim', 'Pangkalan LPG PSO', '9.999999', 'Rau Rt 001 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'RAU', 82323547866, 'Mu\'allim', '9.999999', 82323547866, 450, 59463, 'Active'),
(27, 'Muhammad Al Haq', 'Pangkalan LPG PSO', '9.999999', 'Tahunan Rt 002 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'TAHUNAN', 81390578865, 'Muhammad Al Haq', '9.999999', 81390578865, 250, 59451, 'Active'),
(28, 'Muhsin', 'Pangkalan LPG PSO', '9.999999', 'Petekeyan Rt 07 / Rw 02', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 8122837648, 'Muhsin', '9.999999', 8122837648, 450, 59423, 'Active'),
(29, 'Munasiroh', 'Pangkalan LPG PSO', '9.999999', 'Rau Rt 002 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'RAU', 82134258323, 'Munasiroh', '9.999999', 82134258323, 450, 59463, 'Active'),
(30, 'Muntioro', 'Pangkalan LPG PSO', '9.999999', 'Sowan Lor Rt 14 / Rw 04', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'SOWAN LOR', 85226425795, 'Muntioro', '9.999999', 85226425795, 4050, 59463, 'Active'),
(31, 'Muslim', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 017 / Rw 004', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 85227381320, 'Muslim', '9.999999', 85227381320, 450, 59463, 'Active'),
(32, 'Nikmatun', 'Pangkalan LPG PSO', '9.999999', 'Ngancar Rt 004 / Rw 005', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KELING', 'KELING', 81390220906, 'Nikmatun', '9.999999', 81390220906, 450, 59454, 'Active'),
(33, 'Nur Faizah', 'Pangkalan LPG PSO', '9.999999', 'Bugel Rt 013 / Rw 004', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'BUGEL', 85326711104, 'Nur Faizah', '9.999999', 85326711104, 450, 59463, 'Active'),
(34, 'Nur Khalimi', 'Pangkalan LPG PSO', '9.999999', 'Bangsri Rt 001 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BANGSRI', 'BANGSRI', 85290627635, 'Nur Khalimi', '9.999999', 85290627635, 450, 59453, 'Active'),
(35, 'Nursiyah', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt 02 / Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 85290450285, 'Nursiyah', '9.999999', 85290450285, 360, 59463, 'Active'),
(36, 'Nursoleh', 'Pangkalan LPG PSO', '9.999999', 'Tanggul Tlare Rt 001 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'TANGGULTLARE', 85325240497, 'Nursoleh', '9.999999', 85325240497, 240, 59463, 'Active'),
(37, 'Nusabella', 'Pangkalan LPG PSO', '9.999999', 'Sukodono Rt 10 / Rw 04', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'SUKODONO', 8122825655, 'Nusabella', '9.999999', 8122825655, 400, 59425, 'Active'),
(38, 'Rodliyah', 'Pangkalan LPG PSO', '9.999999', 'Bugel Rt 007 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'BUGEL', 85290134848, 'Rodliyah', '9.999999', 85290134848, 360, 59463, 'Active'),
(39, 'Rukanah', 'Pangkalan LPG PSO', '9.999999', 'Sukodono Rt 005 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'SUKODONO', 85226151681, 'Rukanah', '9.999999', 85226151681, 400, 59425, 'Active'),
(40, 'Sihatun Nadro', 'Pangkalan LPG PSO', '9.999999', 'Surodadi Rt 001 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'SURODADI', 85326860619, 'Sihatun Nadro', '9.999999', 85326860619, 325, 59463, 'Active'),
(41, 'Siti Hidayati', 'Pangkalan LPG PSO', '9.999999', 'Bulak Baru Rt 002 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'BULAKBARU', 82342408355, 'Siti Hidayati', '9.999999', 82342408355, 450, 59463, 'Active'),
(42, 'Siti Saidah', 'Pangkalan LPG PSO', '9.999999', 'Langon Rt 02/ Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'LANGON', 85226351385, 'Siti Saidah', '9.999999', 85226351385, 400, 59425, 'Active'),
(43, 'Sri Hidayah', 'Pangkalan LPG PSO', '9.999999', 'Sukosono Rt 017 / Rw 005', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'SUKOSONO', 82324301786, 'Sri Hidayah', '9.999999', 82324301786, 160, 59463, 'Active'),
(44, 'Sri Suharni', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt 03 / Rw 01', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 85326712227, 'Sri Suharni', '9.999999', 85326712227, 360, 59463, 'Active'),
(45, 'Subaidi', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt 04 / Rw 02', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 85335465319, 'Subaidi', '9.999999', 85335465319, 260, 59463, 'Active'),
(46, 'Sudiono', 'Pangkalan LPG PSO', '9.999999', 'Pekalongan Rt 005 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BATEALIT', 'PEKALONGAN', 85225684788, 'Sudiono', '9.999999', 85225684788, 350, 59461, 'Active'),
(47, 'Suharti', 'Pangkalan LPG PSO', '9.999999', 'Mindahan Rt 002 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BATEALIT', 'MINDAHAN', 81390109370, 'Suharti', '9.999999', 81390109370, 250, 59461, 'Active'),
(48, 'Sumiati', 'Pangkalan LPG PSO', '9.999999', 'Ngabul Rt 002 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'NGABUL', 85225052875, 'Sumiati', '9.999999', 85225052875, 500, 59428, 'Active'),
(49, 'Sunadah', 'Pangkalan LPG PSO', '9.999999', 'Sekacer Rt 026 / Rw 005', 'Jawa Tengah                                       ', 'Kab. Jepara', 'MLONGGO', 'SINANGGUL', 85290059237, 'Sunadah', '9.999999', 85290059237, 350, 59452, 'Active'),
(50, 'Sunnah', 'Pangkalan LPG PSO', '9.999999', 'Sukosono Rt 010 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'SUKOSONO', 85290498112, 'Sunnah', '9.999999', 85290498112, 450, 59463, 'Active'),
(51, 'Surahman', 'Pangkalan LPG PSO', '9.999999', 'Sowan Kidul Rt 003 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'SOWAN KIDUL', 82329680746, 'Surahman', '9.999999', 82329680746, 360, 59463, 'Active'),
(52, 'Suwignyo', 'Pangkalan LPG PSO', '9.999999', 'Bugel Rt 012 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'BUGEL', 81390490060, 'Suwignyo', '9.999999', 81390490060, 450, 59463, 'Active'),
(53, 'Tri Puji Hastuti', 'Pangkalan LPG PSO', '9.999999', 'Bangsri Rt 001 / Rw 003', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BANGSRI', 'BANGSRI', 81390994421, 'Tri Puji Hastuti', '9.999999', 81390994421, 1895, 59453, 'Active'),
(54, 'Tri Susyanti', 'Pangkalan LPG PSO', '9.999999', 'Mindahan Rt 002 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BATEALIT', 'MINDAHAN', 85226280485, 'Tri Susyanti', '9.999999', 85226280485, 250, 59461, 'Active'),
(55, 'Tugiyanto', 'Pangkalan LPG PSO', '9.999999', 'Dongos Rt 02 / Rw 04', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'DONGOS', 85225441129, 'Tugiyanto', '9.999999', 85225441129, 450, 59463, 'Active'),
(56, 'Utoyo', 'Pangkalan LPG PSO', '9.999999', 'Kedung Leper Rt 003 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'BANGSRI', 'KEDUNGLEPER', 81225256660, 'Utoyo', '9.999999', 81225256660, 450, 59453, 'Active'),
(57, 'Widiawati', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt 001 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 81325673666, 'Widiawati', '9.999999', 81325673666, 450, 59423, 'Active'),
(58, 'Wiwik Puspitarini', 'Pangkalan LPG PSO', '9.999999', 'Tulakan Rt 007 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'DONOROJO', 'TULAKAN', 82322488474, 'Wiwik Puspitarini', '9.999999', 82322488474, 410, 59454, 'Active'),
(59, 'Zahid Effendi', 'Pangkalan LPG PSO', '9.999999', 'Kerso Rt 001 / Rw 002', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'KERSO', 85226112805, 'Zahid Effendi', '9.999999', 85226112805, 270, 59463, 'Active'),
(60, 'Zainal Muttaqin', 'Pangkalan LPG PSO', '9.999999', 'Wanusobo Rt 003 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'WANUSOBO', 85225277040, 'Zainal Muttaqin', '9.999999', 85225277040, 200, 59463, 'Active'),
(61, 'Zulaikah', 'Pangkalan LPG PSO', '9.999999', 'Menganti Rt 08 / Rw 02', 'Jawa Tengah                                       ', 'Kab. Jepara', 'KEDUNG', 'MENGANTI', 85226303760, 'Zulaikah', '9.999999', 85226303760, 225, 59463, 'Active'),
(62, 'Zuzun Aqidah', 'Pangkalan LPG PSO', '9.999999', 'Taraman Rt 003 / Rw 001', 'Jawa Tengah                                       ', 'Kab. Jepara', 'TAHUNAN', 'MANTINGAN', 87831744420, 'Zuzun Aqidah', '9.999999', 87831744420, 320, 59421, 'Active');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `operator_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `tanggal_transaksi`, `operator_id`) VALUES
(1, '2017-09-04', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `t_detail_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `transaksi_id` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` enum('0','1') NOT NULL COMMENT '1= sudah diproses , 0 belum diproses'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`t_detail_id`, `barang_id`, `qty`, `transaksi_id`, `harga`, `status`) VALUES
(1, 1, 250, 1, 100000, '1'),
(2, 2, 245, 1, 127500, '1');

--
-- Trigger `transaksi_detail`
--
DELIMITER $$
CREATE TRIGGER `update_transaksi` AFTER INSERT ON `transaksi_detail` FOR EACH ROW BEGIN
	UPDATE barang SET qty=qty-NEW.qty
    WHERE barang_id=NEW.barang_id;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`barang_id`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`barang_masuk_id`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `operator`
--
ALTER TABLE `operator`
  ADD PRIMARY KEY (`operator_id`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`Id_klien`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`);

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`t_detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `barang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `barang_masuk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `operator`
--
ALTER TABLE `operator`
  MODIFY `operator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `t_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
