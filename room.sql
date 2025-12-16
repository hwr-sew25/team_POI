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
(13, 'B' ,'0.01', 'Studienbüro 1 Business Administration / Volkswirtschaftslehre / Economics / Unternehmensgründung und -Nachfolge', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(14, 'B' ,'0.02', 'Studienbüro 1 Business Administration / Volkswirtschaftslehre / Economics / Unternehmensgründung und -Nachfolge', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(15, 'B' ,'0.03', 'Fachbereich Wirtschaftswissenschaften Ersti-Lotsen - Fabienne Schwarz / Ruman Fidow', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(16, 'B' ,'0.04', 'Studienbüro 1 Business Administration (Vollzeit) - Ines Steinbach', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(17, 'B' ,'0.05', 'Studienbüro 1 International Business Management / Unternehmensgründung und -Nachfolge / Volkswirtschaftslehre / Economics - Christian Pepe / Studienbüro 1 Business Administration (Teilzeit) / International Digital Business / International Sustainability Management - Christin Wallek', 'EG', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(18, 'B' ,'WR0.2', 'WC Damen', 'EG', 2, 'Rechts', 'WC', 'Damen', 0, NULL),
(19, 'B' ,'WR0.1', 'WC Herren', 'EG', 2, 'Rechts', 'WC', 'Herren', 0, NULL),
(20, 'B' ,'0.06', 'Koordinatorin Studien- und Prüfungswesen Fachbereich 1 - Kathleen Schüttler-Janikulla', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(21, 'B' ,'0.07', 'Büro für Bewerbung Zulassung und Immatrikulation (BBZI) - Dave Schnelle - Leitung Standort Schöneberg und Lichtenberg', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(22, 'B' ,'0.08', 'Büro für Bewerbung Zulassung und Immatrikulation (BBZI) - Sebastian Krüger / Maksym Vovk', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(23, 'B' ,'0.09', 'Studienbüro II Wirtschaftsrecht / Büro für Bewerbung Zulassung und Immatrikulation (BBZI) - Christiane Walczak', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(24, 'B' ,'0.10', 'Poststelle', 'EG', 2, 'Links', 'Service', NULL, 0, NULL),
(25, 'B' ,'0.11', 'Büro für Bewerbung Zulassung und Immatrikulation (BBZI) - Charleen Hengst / Jessica Schäfer', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(26, 'B' ,'0.12', 'Büro für Bewerbung Zulassung und Immatrikulation (BBZI) - Manuela Ghobadloo / Tanja Gott / Claudia Wiesner', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(27, 'B' ,'0.13', 'Fachbereich 1 Lehrplanung und Dozentenbetreuung - Gökce Metinbas / Sabine Bednorz', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(28, 'B' ,'0.14', 'Fachbereich 1 Büro für Lehrplanung und Dozentenbetreuung - Radoslawa Kochan', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL),
(29, 'B' ,'0.15', 'Teeküche', 'EG', 2, 'Links', 'Teeküche', NULL, 0, 'Nur für Personal des FB1'),
(30, 'B' ,'0.17', 'Studienbüro 1 / Büro für Lehrplanung / Dezentrale Frauen- und Gleichstellungsbeauftragte - Anika Kixmüller', 'EG', 2, 'Links', 'Büro', NULL, 0, NULL);


-- 1. Obergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(31, 'B' ,'1.41', 'Kopierraum', '1', 1, 'Rechts', 'Service', NULL, 0, NULL),
(32, 'B' ,'1.42', 'Seminarraum', '1', 1, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(33, 'B' ,'1.43', 'PC-Raum', '1', 1, 'Rechts', 'PC-Raum', NULL, 0, NULL),
(34, 'B' ,'1.51', 'PC-Raum', '1', 1, 'Rechts', 'PC-Raum', NULL, 0, NULL),
(35, 'B' ,'WL1.1', 'WC Herren', '1', 1, 'Links', 'WC', 'Herren', 0, NULL),
(36, 'B' ,'WL1.2', 'WC Damen', '1', 1, 'Links', 'WC', 'Damen', 0, NULL),
(37, 'B' ,'1.52', 'Büro', '1', 1, 'Links', 'Büro', NULL, 0, NULL),
(38, 'B' ,'1.53', 'PC-Raum', '1', 1, 'Links', 'PC-Raum', NULL, 0, NULL),
(39, 'B' ,'1.55', 'Seminarraum', '1', 1, 'Links', 'Seminarraum', NULL, 0, NULL),
(40, 'B' ,'1.56', 'Büro', '1', 1, 'Links', 'Büro', NULL, 0, NULL),
(160, 'B' ,'1.29', 'Büro', '1', 1, 'Mittlerergang', 'Büro', NULL, 0, 'Fahrstuhl links'),
(161, 'B' ,'1.30', 'Büro', '1', 1, 'Mittlerergang', 'Büro', NULL, 0, 'Fahrstuhl links'),
(162, 'B' ,'1.31', 'Büro', '1', 1, 'Mittlerergang', 'Büro', NULL, 0, 'Fahrstuhl links'),
(163, 'B' ,'1.32', 'Büro', '1', 1, 'Mittlerergang', 'Büro', NULL, 0, 'Fahrstuhl links');



-- 1. Obergeschoss Westflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(41, 'B' ,'WR1.2', 'WC Damen', '1', 2, 'Rechts', 'WC', 'Damen', 0, NULL),
(42, 'B' ,'WR1.1', 'WC Herren', '1', 2, 'Rechts', 'WC', 'Herren', 0, NULL),
(43, 'B' ,'1.01', 'Sitzungsraum', '1', 2, 'Rechts', 'Sitzungsraum', NULL, 0, NULL),
(44, 'B' ,'1.02', 'Fachbereich 1 Professur für allgemeine Betriebswirtschaftslehre insbesondere Controlling / Professur für internationales Personalmanagement - Prof. Dr. Katrin Böttcher', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(45, 'B' ,'1.03', 'Professur für Volkswirtschaftslehre insbesondere Welthandel und internationale Produktion', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(46, 'B' ,'1.04', 'Professur für Gesellschaftswissenschaften Schwerpunkt Arbeits- und Organisationssoziologie', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(47, 'B' ,'1.15', 'Professur für allgemeine Volkswirtschaftslehre insb. Finanzwissenschaften - Prof. Dr. Beate Jochimsen', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(48, 'B' ,'1.16', 'Fachbereich 1 Wirtschaftswissenschaften Wissenschaftliche Mitarbeiterinnen am Dekanat - Susanne Föhse-Hiltmann / Marie Glasemann', '1', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(49, 'B' ,'1.05', 'FB1 Wirtschaftswissenschaften Professorin für allgemeine BWL und Marketing - Prof. Dr. Andrea Rumler', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(50, 'B' ,'1.06', 'Professorin für Wirtschaftsinformatik - Prof. Dr. Sandy Eggert', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(51, 'B' ,'1.07', 'Fachbereich 1 Wirtschaftswissenschaften Geschäftsführerin - Sabine Kysselli', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(52, 'B' ,'1.08', 'FB1 Wirtschaftswissenschaften Dekanassistenz - Franziska Brandt', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(53, 'B' ,'1.09', 'FB1 Wirtschaftswissenschaften Dekanin - Prof. Dr. Ursula Walther', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(54, 'B' ,'1.10', 'Fachbereich 1 Wirtschaftswissenschaften Der Grüne Salon - Aufenthaltsraum für Mitarbeiter*innen', '1', 2, 'Links', 'Aufenthaltsraum', NULL, 0, NULL),
(55, 'B' ,'1.11', 'Koordinatorin Büro für Lehrplanung und Dozentenbetreuung - Antje Marggraff', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(56, 'B' ,'1.12', 'Fachbereich 1 Lehrplanung und Dozentenbetreuung - Kathrin Wehr / Nina Prüfer', '1', 2, 'Links', 'Büro', NULL, 0, NULL),
(57, 'B' ,'1.13', 'Küche', '1', 2, 'Links', 'Küche', NULL, 0, NULL),
(164, 'B' ,'1.21', 'Allgemeiner Studierendenausschuss (AStA)', '1', 2, 'Mittlerergang', 'Service', NULL, 0, 'Fahrstuhl rechts'),
(165, 'B' ,'1.22', 'Service', '1', 2, 'Mittlerergang', 'Service', NULL, 0, 'Fahrstuhl rechts'),
(166, 'B' ,'1.24', 'Masterstudiengänge', '1', 2, 'Mittlerergang', 'Service', NULL, 0, 'Fahrstuhl rechts'),
(167, 'B' ,'1.25', 'Service', '1', 2, 'Mittlerergang', 'Service', NULL, 0, 'Fahrstuhl rechts'),
(168, 'B' ,'1.26', 'Masterstudiengänge', '1', 2, 'Mittlerergang', 'Service', NULL, 0, 'Fahrstuhl rechts'),
(169, 'B' ,'1.27', 'International Business Management', '1', 2, 'Mittlerergang', 'Service', NULL, 0, 'Fahrstuhl rechts'),
(170, 'B' ,'1.28', 'Masterbüro / Master Office', '1', 2, 'Mittlerergang', 'Service', NULL, 0, 'Fahrstuhl rechts');


-- 2. Obergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(58, 'B' ,'A0.1', 'Aula', '2', 1, '', 'Aula', NULL, 0, NULL),
(59, 'B' ,'W2.3', 'WC Unisex', '2', 1, '', 'WC', 'Unisex', 0, 'WC für alle (Ost)'),
(60, 'B' ,'F2.1', 'Fahrstuhl', '2', 1, '', 'Fahrstuhl', NULL, 0, NULL),
(61, 'B' ,'2.41', 'Seminarraum', '2', 1, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(62, 'B' ,'2.41b', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(63, 'B' ,'2.42', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(64, 'B' ,'2.43', 'Büro', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(65, 'B' ,'2.44', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(66, 'B' ,'2.45', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(67, 'B' ,'2.46', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(68, 'B' ,'2.47', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(69, 'B' ,'2.50', 'Prof Raum', '2', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(70, 'B' ,'2.51', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(71, 'B' ,'2.52', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(72, 'B' ,'WL2.1', ' WC Herren', '2', 1, 'Links', 'WC', 'Herren', 0, NULL),
(73, 'B' ,'2.53', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(74, 'B' ,'2.54', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(75, 'B' ,'2.55', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(76, 'B' ,'2.56', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(77, 'B' ,'2.58', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(78, 'B' ,'2.59', 'Prof Raum', '2', 1, 'Links', 'Büro', NULL, 0, NULL),
(79, 'B' ,'2.60', 'Küche', '2', 1, 'Links', 'Küche', NULL, 0, NULL);


--2. Obergeschoss Westflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(80, 'B' ,'2.01', 'Seminarraum', '2', 2, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(81, 'B' ,'2.02', 'Professur für Arbeitsrecht', '2', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(82, 'B' ,'2.03', 'Fachbereich 1 Seminarraum', '2', 2, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(83, 'B' ,'2.04', 'Fachbereich 1 Seminarraum', '2', 2, 'Links', 'Seminarraum', NULL, 0, NULL),
(84, 'B' ,'2.05', 'Seminarraum', '2', 2, 'Links', 'Seminarraum', NULL, 0, NULL),
(85, 'B' ,'2.06', 'Seminarraum', '2', 2, 'Links', 'Seminarraum', NULL, 0, NULL),
(86, 'B' ,'2.08', 'Professur für Wirtschaftsmathematik und Statistik', '2', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(171, 'B' ,'2.21B', 'Toilette für alle (barrierefrei)', '2', 2, 'Rechts', 'WC', 'Unisex', 1, 'Fahrstuhl rechts'),
(172, 'B' ,'2.20H', 'Herren WC', '2', 2, 'Rechts', 'WC', 'Herren', 0, 'Fahrstuhl rechts');


--3. Obergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(87, 'B' ,'A3.1', 'Aula Galerie', '3', 1, '', 'Aula', NULL, 0, NULL),
(88, 'B' ,'3.22', 'Seminarraum', '3', 1, '', 'Seminarraum', NULL, 0, NULL),
(89, 'B' ,'3.30', 'Seminarraum', '3', 1, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(90, 'B' ,'3.40', 'Seminarraum', '3', 1, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(91, 'B' ,'3.41', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(92, 'B' ,'3.42', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(93, 'B' ,'3.43', 'Familienzimmer', '3', 1, 'Rechts', 'Familienzimmer', NULL, 0, NULL),
(94, 'B' ,'3.44', 'Seminarraum', '3', 1, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(95, 'B' ,'3.45', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(96, 'B' ,'3.46', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(97, 'B' ,'3.47', 'Prof Raum', '3', 1, 'Rechts', 'Büro', NULL, 0, NULL),
(98, 'B' ,'3.48', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(99, 'B' ,'3.49', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(100, 'B' ,'WL 3.3', 'WC Unisex', '3', 1, 'Links', 'WC', 'Unisex', 0, NULL),
(101, 'B' ,'3.50', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(102, 'B' ,'3.51', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(103, 'B' ,'3.52', 'Seminarraum', '3', 1, 'Links', 'Seminarraum', NULL, 0, NULL),
(104, 'B' ,'3.54', 'Seminarraum', '3', 1, 'Links', 'Seminarraum', NULL, 0, NULL),
(105, 'B' ,'3.55', 'Prof Raum', '3', 1, 'Links', 'Büro', NULL, 0, NULL),
(173, 'B' ,'3.32', 'Seminarraum', '3', 1, 'Links', 'Seminarraum', NULL, 0, 'Fahrstuhl links');



-- 3. Obergeschoss Westflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(106, 'B' ,'3.01', 'Seminarraum', '3', 2, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(107, 'B' ,'3.02', 'Professur für Wirtschaftsmathematik und Statistik / Professur für betriebliches Rechnungswesen', '3', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(108, 'B' ,'3.03', 'Professur für allgemeine BWL mit Schwerpunkt Supply Chain', '3', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(109, 'B' ,'3.04', 'Professur für Allgemeine BWL', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(110, 'B' ,'3.05', 'Seminarraum', '3', 2, 'Links', 'Seminarraum', NULL, 0, NULL),
(111, 'B' ,'3.06', 'Professur für VWL', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(112, 'B' ,'3.07', 'Fachbereich 1 Wirtschaftswissenschaften', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(113, 'B' ,'3.08', 'Professur für internationale Unternehmensfinanzierung', '3', 2, 'Links', 'Büro', NULL, 0, NULL),
(114, 'B' ,'3.09', 'Seminarraum', '3', 2, 'Links', 'Seminarraum', NULL, 0, NULL);


--aufgrund von neuen Daten und Verbesserungen, ist die ID nicht mehr chronologisch dargestellt
--4. Obergeschoss West Flügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(115, 'B' ,'4.21', 'Professur für Allgemeine BWL, insbesondere Internationale Unternehmensführung', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Prof. Dr. Ewa Ostaszewska | Fahrstuhl rechts'),
(116, 'B' ,'4.22', 'Professur für Wirtschaftsinformatik, insbesondere Software Engineering und Datenbanksysteme', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Prof. Dr. Markus Schaal; Prof. Dr. Fatoumata Camara; Prof. Dr. Manfred Soeffky | Fahrstuhl rechts'),
(117, 'B' ,'4.23', 'Büro Roland Müller', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(118, 'B' ,'4.24', 'Professur für externes Rechnungswesen', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Prof. Dr. Janina Bogajewskaja | Fahrstuhl rechts'),
(119, 'B' ,'4.25', 'Büro', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Sabine Baumann, Alexander Eck | Fahrstuhl rechts'),
(120, 'B' ,'4.26', 'Wissenschaftliche Mitarbeiter', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(121, 'B' ,'4.27', 'Professur für Unternehmensführung und Personalwesen', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(122, 'B' ,'4.28', 'Chair of Strategic Management', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(123, 'B' ,'4.29', 'Professur für International Accounting', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(124, 'B' ,'4.30', 'Büro', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(125, 'B' ,'4.31', 'Büro', '4', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(138, 'B' ,'4.01', 'Seminarraum', '4', 2, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(139, 'B' ,'4.02', 'Seminarraum', '4', 2, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(140, 'B' ,'4.03', 'Seminarraum', '4', 2, 'Links', 'Seminarraum', NULL, 0, NULL),
(141, 'B' ,'4.04', 'Seminarraum', '4', 2, 'Links', 'Seminarraum', NULL, 0, NULL),
(142, 'B' ,'4.05', 'Büro', '4', 2, '', 'Büro', NULL, 0, NULL);


--4. OBergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(126, 'B' ,'4.32', 'Büro Diana Hristova', '4', 1, 'Links', 'Büro', NULL, 0, 'Fahrstuhl links'),
(127, 'B' ,'4.33', 'Personalrat', '4', 1, 'Links', 'Service', NULL, 0, 'Fahrstuhl links'),
(128, 'B' ,'4.34', 'Büro', '4', 1, 'Links', 'Büro', NULL, 0, 'Fahrstuhl links'),
(129, 'B' ,'4.35', 'Professur für regionale und globale Governance', '4', 1, 'Links', 'Büro', NULL, 0, 'Fahrstuhl links'),
(130, 'B' ,'4.37', 'Büro', '4', 1, 'Links', 'Büro', NULL, 0, 'Fahrstuhl links'),
(131, 'B' ,'4.39', 'Büro', '4', 1, 'Mittlerergang', 'Büro', NULL, 0, NULL),
(132, 'B' ,'4.41', 'Seminar', '4', 1, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(133, 'B' ,'4.42', 'Seminar', '4', 1, 'Rechts', 'Seminarraum', NULL, 0, NULL),
(134, 'B' ,'4.43', 'Seminar', '4', 1, 'Links', 'Seminarraum', NULL, 0, NULL),
(135, 'B' ,'WL 4.3', 'WC Unisex', '4', 1, 'Links', 'WC', 'Unisex', 1, 'Vor Fahrstuhl (Ost) - Toilette für alle (barrierefrei)'),
(136, 'B' ,'4.44', 'Seminar', '4', 1, 'Links', 'Seminarraum', NULL, 0, NULL),
(137, 'B' ,'4.48', 'Büro', '4', 1, 'Mittlerergang', 'Büro', NULL, 0, NULL);


-- 5. Obergeschoss Ostflügel
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES
(174, 'B' ,'5.48', 'Büro', '5', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(175, 'B' ,'5.47', 'Professur für Betriebspsychologie und Cross-Cultural Management', '5', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(176, 'B' ,'5.46', 'Büro', '5', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(177, 'B' ,'5.45', 'Professur für Betriebliches Rechnungswesen', '5', 1, 'Rechts', 'Büro', NULL, 0, 'Fahrstuhl rechts'),
(178, 'B' ,'5.44', 'Sitzungsraum', '5', 1, 'Rechts', 'Sitzungsraum', NULL, 0, 'Fahrstuhl rechts'),
(179, 'B' ,'5.49', 'Professur für Marketing', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Pakize Schuchert-Güler | Fahrstuhl links'),
(180, 'B' ,'5.50', 'Professur für Betriebliche Informations- und Kommunikationssysteme', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Heike Wiesner | Fahrstuhl links'),
(181, 'B' ,'5.51', 'Professur für Entrepreneurship', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Sven Ripsas | Fahrstuhl links'),
(182, 'B' ,'5.52', 'Professur für Betriebliche Finanzwirtschaft (Finanzanalyse/-management)', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Andrã Tomfort | Fahrstuhl links'),
(183, 'B' ,'5.59', 'Professur für Betriebliche Informations- und Kommunikationssysteme / IT-Sicherheit', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Katja Andresen | Fahrstuhl links'),
(184, 'B' ,'5.53', 'Professur für Kapitalmärkte und Unternehmen (FE Finanzierung & Investition)', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Thomas Wolke | Fahrstuhl links'),
(185, 'B' ,'5.58', 'Professur für Betriebliches Rechnungswesen - Internationale Rechnungslegung', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Madeline Janke | Fahrstuhl links'),
(186, 'B' ,'5.54', 'Professur für Marketing', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Dirk-Mario Boltz | Fahrstuhl links'),
(187, 'B' ,'5.57', 'Professur für Marktforschung und Marktkommunikation', '5', 1, 'Links', 'Büro', NULL, 0, 'Prof. Dr. Joachim Scholz-Ligma | Fahrstuhl links'),
(188, 'B' ,'5.55', 'Fachbereich 1 Wirtschaftswissenschaft', '5', 1, 'Links', 'Büro', NULL, 0, 'Kirsten Kohlhaw - Wissenschaftliche Mitarbeiterin/Doktorandin | Fahrstuhl links'),
(189, 'B' ,'5.56', 'Cultural Diversity Programm - Wissenschaftliche Leitung', '5', 1, 'Links', 'Service', NULL, 0, 'Prof. Dr. Pakize Schuchert-Güler; Studentische Mitarbeiter/innen | Fahrstuhl links');


-- 5. Obergeschoss Westflügel 
INSERT INTO room (id, building, room_id, room_name, floor, wing_id, side, category, gender, accessible, notes) VALUES 
(143, 'B' ,'5.01', 'EMF Institut', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(144, 'B' ,'5.02', 'Professur für Wirtschaftsrecht Bank- und Kapitalmarktrecht', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(145, 'B' ,'5.03', 'Professur für Gesellschaftsrecht und internationales Vertragsrecht', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(146, 'B' ,'5.04', 'Professur für Wirtschaftsrecht Arbeits- und Sozialrecht', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(147, 'B' ,'5.05', 'Professur für strategische Unternehmensführung und Unternehmensplanspiele', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(148, 'B' ,'5.06', 'Professur für allgemeine BWL KMU', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(149, 'B' ,'5.17', 'Professur für allgemeine BWL und Controlling', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(150, 'B' ,'5.18', 'Gastprofessorin', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(151, 'B' ,'5.19', 'Professur für ABWL', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(152, 'B' ,'5.20', 'EMF Institut', '5', 2, 'Rechts', 'Büro', NULL, 0, NULL),
(153, 'B' ,'5.07', 'Professur für internationale Unternehmensorganisation', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(154, 'B' ,'5.08', 'Professur für BIS', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(155, 'B' ,'5.09', 'Professur für ABWL Management und Organisation', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(156, 'B' ,'5.10', 'Department of Business and Economics', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(157, 'B' ,'5.11', 'FB Wirtschaftswissenschaften', '5', 2, 'Links', 'Büro', NULL, 0, NULL),
(158, 'B' ,'5.12', 'Seminarraum', '5', 2, 'Links', 'Seminarraum', NULL, 0, NULL),
(159, 'B' ,'5.13', 'Studentenwerk', '5', 2, 'Links', 'Service', NULL, 0, NULL);


