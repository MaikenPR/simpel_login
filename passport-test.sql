-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Vært: 127.0.0.1
-- Genereringstid: 15. 06 2018 kl. 09:08:53
-- Serverversion: 10.1.26-MariaDB
-- PHP-version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `passport-test`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `facebookkeys`
--

CREATE TABLE `facebookkeys` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `fKey` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `googlekeys`
--

CREATE TABLE `googlekeys` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `gKey` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `key` varchar(77) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `passphrase` varchar(77) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Data dump for tabellen `users`
--

INSERT INTO `users` (`id`, `username`, `passphrase`) VALUES
(6, 'maikenpr@hotmail.com', '$2b$10$5nzPkWKy6Y3XBtk9NFTxQe5SxdNbSZ.jwUWiXwQdeo7/cGt8mn1G.'),
(7, 'julemanden@jul.com', '$2b$10$hHijeF1hZzD19IAu8QyFDepFZMWxpDLY1hcYyQ/XkFqV0/FKv0eDC');

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `facebookkeys`
--
ALTER TABLE `facebookkeys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indeks for tabel `googlekeys`
--
ALTER TABLE `googlekeys`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- Indeks for tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `facebookkeys`
--
ALTER TABLE `facebookkeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `googlekeys`
--
ALTER TABLE `googlekeys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `facebookkeys`
--
ALTER TABLE `facebookkeys`
  ADD CONSTRAINT `facebookkeys_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Begrænsninger for tabel `googlekeys`
--
ALTER TABLE `googlekeys`
  ADD CONSTRAINT `googlekeys_ibfk_1` FOREIGN KEY (`user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
