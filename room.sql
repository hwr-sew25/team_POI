-- Die Räume werden aufgeteilt in EG Ost, EG West, 1.OG Ost, 1.OG West usw

-- Erdgeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(1, 'B', '0.51', 'Rechenzentrumdienste', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(2, 'B', '0.52', 'Anwendungsunterstützung', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(3, 'B', '0.53', 'Info Anwendungsunterstützung', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(4, 'B', '0.54', 'Info Anwendungsunterstützung', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(5, 'B', '0.55', 'Informationstechnologie Anwendungsunterstützung', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(6, 'B', '0.56', 'Informationstechnologie Anwendungsunterstützung', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(7, 'B', '0.57', 'Informationstechnologie', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(8, 'B', '0.58', 'Informationstechnologie E-Learning Zentrum', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(9, 'B', '0.59', 'Informationstechnologie E-Learning Zentrum', 'EG', 1, 'Links', 'Büro', NULL, 0, NULL),
(10, 'B', 'WL0.1', 'WC Herren', 'EG', 1, 'Links', 'WC', 'Herren', 0, NULL),
(11, 'B', 'WL0.2', 'WC Damen', 'EG', 1, 'Links', 'WC', 'Damen', 0, NULL),
(12, 'B', 'ITO0.1', 'IT Service Point', 'EG', 1, 'Rechts', 'Service', NULL, 0, NULL);

--Erdgeschoss Westflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(13, 'B', '0.01', 'Studienbüro 1', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(14, 'B', '0.02', 'Studienbüro 1', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(15, 'B', '0.03', 'Fachbereich Ersti-Lotsen', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(16, 'B', '0.04', 'Studienbüro 1 (Vollzeit)', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(17, 'B', '0.05', 'Studienbüro 1 IBM', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(18, 'B', 'WR0.2', 'WC Damen', 'EG', 2, 'Rechts', 'WC', 'Damen', 0, NULL),
(19, 'B', 'WR0.1', 'WC Herren', 'EG', 2, 'Rechts', 'WC', 'Herren', 0, NULL),
(20, 'B', '0.06', 'Koordinatorin Studienwesen', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(21, 'B', '0.07', 'BBZI Leitung', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(22, 'B', '0.08', 'BBZI', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(23, 'B', '0.09', 'Studienbüro II / BBZI', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(24, 'B', '0.10', 'Poststelle', 'EG', 2, 'Links', 'Service', NULL, 0, NULL),
(25, 'B', '0.11', 'BBZI', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(26, 'B', '0.12', 'BBZI', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(27, 'B', '0.13', 'Lehrplanung', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(28, 'B', '0.14', 'Lehrplanung', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(29, 'B', '0.15', 'Teeküche', 'EG', 2, 'Links', 'Teeküc', NULL, 0, 'Nur für Personal'),
(30, 'B', '0.17', 'Studienbüro 1 / Frauenbeauftr.', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL);

-- 1. Obergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(31, 'B', '1.41', 'Kopierraum', '1', 1, 'Rechts', 'Service', NULL, 0, NULL),
(32, 'B', '1.42', 'Seminarraum', '1', 1, 'Rechts', 'Semina', NULL, 0, NULL),
(33, 'B', '1.43', 'PC-Raum', '1', 1, 'Rechts', 'PC-Rau', NULL, 0, NULL),
(34, 'B', '1.51', 'PC-Raum', '1', 1, 'Rechts', 'PC-Rau', NULL, 0, NULL),
(35, 'B', 'WL1.1', 'WC Herren', '1', 1, 'Links', 'WC', 'Herren', 0, NULL),
(36, 'B', 'WL1.2', 'WC Damen', '1', 1, 'Links', 'WC', 'Damen', 0, NULL),
(37, 'B', '1.52', 'Büro', '1', 1, 'Links', 'Büro', NULL, 0, NULL),
(38, 'B', '1.53', 'PC-Raum', '1', 1, 'Links', 'PC-Rau', NULL, 0, NULL),
(39, 'B', '1.55', 'Seminarraum', '1', 1, 'Links', 'Semina', NULL, 0, NULL),
(40, 'B', '1.56', 'Büro', '1', 1, 'Links', 'Büro', NULL, 0, NULL);


-- 1. Obergeschoss Westflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(41, 'B', 'WR1.2', 'WC Damen', '1', 2, 'Rechts', 'WC', 'Damen', 0, NULL),
(42, 'B', 'WR1.1', 'WC Herren', '1', 2, 'Rechts', 'WC', 'Herren', 0, NULL),
(43, 'B', '1.01', 'Sitzungsraum', '1', 2, 'Rechts', 'Sitzun', NULL, 0, NULL),
(44, 'B', '01.02', 'Professur BWL', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(45, 'B', '1.03', 'Professur VWL', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(46, 'B', '1.04', 'Professur Gesellschaftsw.', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(47, 'B', '1.15', 'Professur VWL', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(48, 'B', '1.16', 'Mitarbeiterinnen Dekanat', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(49, 'B', '1.05', 'Professur BWL Marketing', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(50, 'B', '1.06', 'Professur Wirtschaftsinf.', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(51, 'B', '1.07', 'Geschäftsführerin', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(52, 'B', '1.08', 'Dekanassistenz', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(53, 'B', '1.09', 'Dekanin', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(54, 'B', '1.10', 'Der Grüne Salon', '1', 2, 'Links', 'Aufent', NULL, 0, NULL),
(55, 'B', '1.11', 'Koordinatorin Lehrplanung', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(56, 'B', '1.12', 'Lehrplanung', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(57, 'B', '1.13', 'Küche', '1', 2, 'Links', 'Küche', NULL, 0, NULL);

-- 2. Obergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(58, 'B', 'A0.1', 'Aula', '2', 1, NULL, 'Aula', NULL, 0, NULL),
(59, 'B', 'W2.3', 'WC Unisex', '2', 1, NULL, 'WC', 'Unisex', 0, NULL),
(60, 'B', 'F2.1', 'Fahrstuhl', '2', 1, NULL, 'Fahrst', NULL, 0, NULL),
(61, 'B', '2.41', 'Seminarraum', '2', 1, 'Rechts', 'Semina', NULL, 0, NULL),
(62, 'B', '2.41b', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(63, 'B', '2.42', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(64, 'B', '2.43', 'Büro', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(65, 'B', '2.44', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(66, 'B', '2.45', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(67, 'B', '2.46', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(68, 'B', '2.47', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(69, 'B', '2.50', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(70, 'B', '2.51', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(71, 'B', '2.52', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(72, 'B', 'WL2.1', 'WC Herren', '2', 1, 'Links', 'WC', 'Herren', 0, NULL),
(73, 'B', '2.53', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(74, 'B', '2.54', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(75, 'B', '2.55', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(76, 'B', '2.56', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(77, 'B', '2.58', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(78, 'B', '2.59', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(79, 'B', '2.60', 'Küche', '2', 1, 'Links', 'Küche', NULL, 0, NULL);


--2. Obergeschoss Westflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(80, 'B', '2.01', 'Seminarraum', '2', 2, 'Rechts', 'Semina', NULL, 0, NULL),
(81, 'B', '2.02', 'Professur Arbeitsrecht', '2', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(82, 'B', '2.03', 'Seminarraum', '2', 2, 'Rechts', 'Semina', NULL, 0, NULL),
(83, 'B', '2.04', 'Seminarraum', '2', 2, 'Links', 'Semina', NULL, 0, NULL),
(84, 'B', '2.05', 'Seminarraum', '2', 2, 'Links', 'Semina', NULL, 0, NULL),
(85, 'B', '2.06', 'Seminarraum', '2', 2, 'Links', 'Semina', NULL, 0, NULL),
(86, 'B', '2.08', 'Professur Mathe/Statistik', '2', 2, 'Rechts', 'Büro', NULL, 0, NULL);


--3. Obergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(87, 'B', 'A3.1', 'Aula Galerie', '3', 1, NULL, 'Aula', NULL, 0, NULL),
(88, 'B', '3.22', 'Seminarraum', '3', 1, NULL, 'Semina', NULL, 0, NULL),
(89, 'B', '3.30', 'Seminarraum', '3', 1, 'Rechts', 'Semina', NULL, 0, NULL),
(90, 'B', '3.40', 'Seminarraum', '3', 1, 'Rechts', 'Semina', NULL, 0, NULL),
(91, 'B', '3.41', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(92, 'B', '3.42', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(93, 'B', '3.43', 'Familienzimmer', '3', 1, 'Rechts', 'Famili', NULL, 0, NULL),
(94, 'B', '3.44', 'Seminarraum', '3', 1, 'Rechts', 'Semina', NULL, 0, NULL),
(95, 'B', '3.45', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(96, 'B', '3.46', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(97, 'B', '3.47', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(98, 'B', '3.48', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(99, 'B', '3.49', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(100, 'B', 'WL 3.3', 'WC Unisex', '3', 1, 'Links', 'WC', 'Unisex', 0, NULL),
(101, 'B', '3.50', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(102, 'B', '3.51', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(103, 'B', '3.52', 'Seminarraum', '3', 1, 'Links', 'Semina', NULL, 0, NULL),
(104, 'B', '3.54', 'Seminarraum', '3', 1, 'Links', 'Semina', NULL, 0, NULL),
(105, 'B', '3.55', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL);


-- 3. Obergeschoss Westflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(106, 'B', '3.01', 'Seminarraum', '3', 2, 'Rechts', 'Semina', NULL, 0, NULL),
(107, 'B', '3.02', 'Professur Mathe', '3', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(108, 'B', '3.03', 'Professur Supply Chain', '3', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(109, 'B', '3.04', 'Professur BWL', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(110, 'B', '3.05', 'Seminarraum', '3', 2, 'Links', 'Semina', NULL, 0, NULL),
(111, 'B', '3.06', 'Professur VWL', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(112, 'B', '3.07', 'FB1 WiWi', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(113, 'B', '3.08', 'Professur Finanzierung', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(114, 'B', '3.09', 'Seminarraum', '3', 2, 'Links', 'Semina', NULL, 0, NULL);


--4. OBergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(115, 'B', '4.21', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(116, 'B', '4.22', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(117, 'B', '4.23', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(118, 'B', '4.24', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(119, 'B', '4.25', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(120, 'B', '4.26', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(121, 'B', '4.27', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(122, 'B', '4.28', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(123, 'B', '4.29', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(124, 'B', '4.30', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(125, 'B', '4.31', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(126, 'B', '4.32', 'Prof Raum', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(127, 'B', '4.33', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(128, 'B', '4.34', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(129, 'B', '4.35', 'Prof Raum', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(130, 'B', '4.37', 'Prof Raum', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(131, 'B', '4.39', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL),
(132, 'B', '4.41', 'Seminar', '4', 1, 'Rechts', 'Semina', NULL, 0, NULL),
(133, 'B', '4.42', 'Seminar', '4', 1, 'Rechts', 'Semina', NULL, 0, NULL),
(134, 'B', '4.43', 'Seminar', '4', 1, 'Links', 'Semina', NULL, 0, NULL),
(135, 'B', 'WL 4.3', 'WC Unisex', '4', 1, 'Links', 'WC', 'Unisex', 0, NULL),
(136, 'B', '4.44', 'Seminar', '4', 1, 'Links', 'Semina', NULL, 0, NULL),
(137, 'B', '4.48', 'Büro', '4', 1, 'Middle', 'Büro', NULL, 0, NULL);


--4. Obergeschoss West Flügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(138, 'B', '4.01', 'Seminarraum', '4', 2, 'Rechts', 'Semina', NULL, 0, NULL),
(139, 'B', '4.02', 'Seminarraum', '4', 2, 'Rechts', 'Semina', NULL, 0, NULL),
(140, 'B', '4.03', 'Seminarraum', '4', 2, 'Links', 'Semina', NULL, 0, NULL),
(141, 'B', '4.04', 'Seminarraum', '4', 2, 'Links', 'Semina', NULL, 0, NULL),
(142, 'B', '4.05', 'Büro', '4', 2, NULL, 'Büro', NULL, 0, NULL);


-- 5. Obergeschoss Westflügel (Side note: keine Räume im Ost 5.OG vorhanden)
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(143, 'B', '5.01', 'EMF Institut', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(144, 'B', '5.02', 'Professur Wirtschaftsrecht', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(145, 'B', '5.03', 'Professur Gesellschaftsrecht', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(146, 'B', '5.04', 'Professur Arbeitsrecht', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(147, 'B', '5.05', 'Professur Strat. Unternehm.', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(148, 'B', '5.06', 'Professur BWL KMU', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(149, 'B', '5.17', 'Professur BWL Controlling', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(150, 'B', '5.18', 'Gastprofessorin', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(151, 'B', '5.19', 'Professur ABWL', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(152, 'B', '5.20', 'EMF Institut', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(153, 'B', '5.07', 'Professur Int. Unternehm.', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(154, 'B', '5.08', 'Professur BIS', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(155, 'B', '5.09', 'Professur ABWL Mgmt', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(156, 'B', '5.10', 'Dept. Business Economics', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(157, 'B', '5.11', 'FB WiWi', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(158, 'B', '5.12', 'Seminarraum', '5', 2, 'Links', 'Semina', NULL, 0, NULL),
(159, 'B', '5.13', 'Studentenwerk', '5', 2, 'Links', 'Service', NULL, 0, NULL);

