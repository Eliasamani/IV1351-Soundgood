TRUNCATE TABLE 
  student_relations, 
  sibling_relations, 
  rental_record, 
  lesson_attendees, 
  lesson, 
  instructor_instruments, 
  instructor, 
  contact_person, 
  student, 
  rental_instruments, 
  price_scheme, 
  person, 
  instruments, 
  group_lesson, 
  ensemble, 
  classroom 
RESTART IDENTITY CASCADE;


INSERT INTO person (first_name, last_name, personal_number, phone_number, email_address, street, city, zip)
VALUES
  -- 100 students
('Per', 'Törnqvist', '980626-4660', '08-41 84 73', 'per.törnqvist@spray.se', 'Björkgränd 9', 'Örebro', '56321'),
('Marianne', 'Mårtensson', '950324-1656', '08-700 86 74', 'marianne.mårtensson@swipnet.se', 'Bäckgatan 256', 'Motala', '20328'),
('Mikael', 'Andersson', '990701-3727', '0086-542 07', 'mikael.andersson@googlemail.com', 'Aspgränd 3', 'Alingsås', '29971'),
('Margareta', 'Nilsson', '960322-4123', '+46 (0)8 835 429 42', 'margareta.nilsson@telia.com', 'Björkstigen 94', 'Mölndal', '94415'),
('Joakim', 'Eriksson', '961117-1837', '08-554 65 55', 'joakim.eriksson@live.se', 'Parkstigen 83', 'Skellefteå', '55254'),
('Lars', 'Nilsson', '950828-1673', '08-924 96 75', 'lars.nilsson@spray.se', 'Parkstigen 361', 'Göteborg', '21506'),
('Martin', 'Björk', '960903-0557', '071-308 93 29', 'martin.björk@googlemail.com', 'Idrottsgatan 6', 'Ängelholm', '94294'),
('Claes', 'Jönsson', '031024-6608', '+46 (0)95 11 65 27', 'claes.jönsson@googlemail.com', 'Industrigatan 3', 'Örebro', '51830'),
('Kenneth', 'Nilsson', '031111-9549', '0840-108 14', 'kenneth.nilsson@yahoo.de', 'Industrivägen 259', 'Skellefteå', '61987'),
('Edit', 'Ekberg', '970502-9255', '+46 (0)28 74 18 58', 'edit.ekberg@live.se', 'Stationsstigen 8', 'Växjö', '11498'),
('Erik', 'Pettersson', '991021-3801', '+46 (0)191 041 01', 'erik.pettersson@gmail.com', 'Bäckvägen 563', 'Karlskrona', '57861'),
('Britt', 'Eriksson', '040526-0696', '+46 (0)8 635 634 56', 'britt.eriksson@swipnet.se', 'Industristigen 177', 'Lidingö', '54738'),
('Ove', 'Lundberg', '051005-4646', '044-895 23 84', 'ove.lundberg@yahoo.de', 'Parkgränd 527', 'Uddevalla', '29820'),
('Daniel', 'Forsberg', '031022-2724', '+46 (0)58 49 38 62', 'daniel.forsberg@yahoo.de', 'Nyvägen 0', 'Sandviken', '54622'),
('Tobias', 'Petersson', '030630-1391', '048-84 03 61', 'tobias.petersson@telia.com', 'Kyrkstigen 7', 'Umeå', '81631'),
('Maria', 'Carlsson', '951024-2978', '0493-13 97 53', 'maria.carlsson@swipnet.se', 'Kyrkvägen 3', 'Borås', '70355'),
('Annika', 'Gunnarsson', '010606-6087', '083-581 44 71', 'annika.gunnarsson@swipnet.se', 'Granvägen 2', 'Skövde', '56374'),
('Valdemar', 'Jakobsson', '021002-2224', '0837-415 93', 'valdemar.jakobsson@gmail.com', 'Kyrkgatan 351', 'Lidköping', '73253'),
('Inge', 'Klasson', '980305-8925', '08-734 97 91', 'inge.klasson@yahoo.de', 'Skolvägen 82', 'Malmö', '14246'),
('Folke', 'Karlsson', '961028-5471', '0428-696 51', 'folke.karlsson@spray.se', 'Trädgårdsstigen 8', 'Växjö', '56777'),
('Gunilla', 'Bergström', '040226-2885', '0684-96 73 10', 'gunilla.bergström@spray.se', 'Grantorget 502', 'Jönköping', '11317'),
('Johannes', 'Davidsson', '000313-6058', '0802-54 51 73', 'johannes.davidsson@gmail.com', 'Järnvägsgatan 0', 'Mölndal', '13918'),
('Knut', 'Dahlberg', '010926-1313', '+46 (0)8 977 227 05', 'knut.dahlberg@live.se', 'Aspgatan 2', 'Nyköping', '68008'),
('Andreas', 'Bengtsson', '021016-3424', '002-887 68 59', 'andreas.bengtsson@swipnet.se', 'Åkervägen 90', 'Växjö', '66520'),
('Albin', 'Eriksson', '030610-5560', '+46 (0)32 60 93 79', 'albin.eriksson@yahoo.de', 'Björkvägen 51', 'Sundsvall', '10086'),
('Joel', 'Jonsson', '050728-0790', '08-355 648 48', 'joel.jonsson@spray.se', 'Skolgatan 56', 'Landskrona', '93484'),
('Gunnar', 'Blom', '010526-7256', '0415-876 56', 'gunnar.blom@spray.se', 'Villagatan 3', 'Umeå', '90499'),
('Monica', 'Nilsson', '960330-9874', '+46 (0)57 48 54 09', 'monica.nilsson@yahoo.de', 'Kvarnvägen 22', 'Sandviken', '49836'),
('Per', 'Johansson', '960723-2551', '+46 (0)778 954 09', 'per.johansson@gmail.com', 'Järnvägsgatan 45', 'Eskilstuna', '44754'),
('Birger', 'Isaksson', '981229-1780', '044-89 09 29', 'birger.isaksson@swipnet.se', 'Strandvägen 63', 'Karlskrona', '34699'),
('Birgitta', 'Persson', '960228-2437', '037-74 70 32', 'birgitta.persson@googlemail.com', 'Kyrkotorget 42', 'Uddevalla', '67881'),
('Elisabet', 'Fransson', '960818-7556', '+46 (0)209 711 07', 'elisabet.fransson@telia.com', 'Björkvägen 04', 'Ängelholm', '20626'),
('Gunilla', 'Gustavsson', '961025-0871', '069-74 95 78', 'gunilla.gustavsson@gmail.com', 'Backstigen 1', 'Lidköping', '24234'),
('Axel', 'Andersson', '050225-5441', '08-836 27 72', 'axel.andersson@swipnet.se', 'Parktorget 74', 'Karlskrona', '88412'),
('Bertil', 'Nyberg', '960411-5718', '08-742 309 50', 'bertil.nyberg@gmail.com', 'Gengränd 856', 'Södertälje', '11238'),
('Maria', 'Svensson', '991107-5464', '+46 (0)8 945 995 63', 'maria.svensson@gmail.com', 'Stationsstigen 92', 'Lidingö', '55505'),
('Tore', 'Johansson', '040523-7264', '035-035 27 19', 'tore.johansson@spray.se', 'Idrottsvägen 920', 'Kristianstad', '54721'),
('Eva', 'Jonsson', '971002-7096', '+46 (0)543 077 37', 'eva.jonsson@swipnet.se', 'Asptorget 020', 'Helsingborg', '73602'),
('Karl', 'Ohlsson', '970122-1187', '070-790 52 48', 'karl.ohlsson@yahoo.de', 'Trädgårdsstigen 44', 'Falun', '59761'),
('Elisabeth', 'Sandberg', '010914-5227', '08-11 14 53', 'elisabeth.sandberg@telia.com', 'Kyrkotorget 17', 'Kalmar', '12983'),
('Margareta', 'Persson', '040607-4385', '08-766 86 81', 'margareta.persson@swipnet.se', 'Aspstigen 5', 'Motala', '93043'),
('Birgitta', 'Johansson', '950401-0365', '08-55 51 43', 'birgitta.johansson@live.se', 'Åkerstigen 48', 'Umeå', '48425'),
('Alexander', 'Carlsson', '010617-8072', '08-297 025 24', 'alexander.carlsson@live.se', 'Storvägen 006', 'Lidköping', '86136'),
('Bengt', 'Nyström', '951130-8703', '08-995 805 45', 'bengt.nyström@googlemail.com', 'Aspvägen 95', 'Göteborg', '74002'),
('Harry', 'Larsson', '041019-4435', '08-06 04 18', 'harry.larsson@gmail.com', 'Kyrkgränd 5', 'Karlstad', '35111'),
('Einar', 'Nilsson', '980627-0261', '+46 (0)8 864 733 11', 'einar.nilsson@googlemail.com', 'Nygränd 67', 'Karlstad', '84517'),
('Anna', 'Börjesson', '970222-9189', '+46 (0)8 967 158 06', 'anna.börjesson@spray.se', 'Ringvägen 656', 'Karlskoga', '69282'),
('Rolf', 'Eriksson', '040330-9958', '086-20 57 10', 'rolf.eriksson@googlemail.com', 'Nystigen 80', 'Gävle', '55332'),
('Mattias', 'Söderlund', '050416-7404', '08-538 42 91', 'mattias.söderlund@gmail.com', 'Järnvägsgatan 657', 'Växjö', '76367'),
('Kerstin', 'Berglund', '001117-3119', '+46 (0)519 035 42', 'kerstin.berglund@live.se', 'Skolgatan 252', 'Södertälje', '46583'),
('Johan', 'Engström', '041231-3496', '0867-39 70 33', 'johan.engström@spray.se', 'Skolgränd 6', 'Skövde', '35870'),
('Lennart', 'Larsson', '051003-5074', '0098-70 19 25', 'lennart.larsson@gmail.com', 'Bäckvägen 7', 'Helsingborg', '30005'),
('Anna', 'Arvidsson', '020904-9840', '08-02 82 26', 'anna.arvidsson@telia.com', 'Ekvägen 4', 'Lund', '63777'),
('Birgitta', 'Andersson', '040516-6620', '+46 (0)8 564 095 43', 'birgitta.andersson@spray.se', 'Industrivägen 295', 'Örnsköldsvik', '48444'),
('Mats', 'Larsson', '971011-1429', '08-561 945 95', 'mats.larsson@spray.se', 'Furugatan 27', 'Helsingborg', '14480'),
('Lars', 'Sjöström', '970908-1864', '08-07 27 23', 'lars.sjöström@yahoo.de', 'Ekvägen 4', 'Trollhättan', '18200'),
('Johan', 'Isaksson', '940628-9265', '0824-66 81 56', 'johan.isaksson@telia.com', 'Furutorget 0', 'Norrköping', '18152'),
('Olof', 'Larsson', '970908-4488', '+46 (0)8 786 314 11', 'olof.larsson@gmail.com', 'Aspvägen 210', 'Halmstad', '87645'),
('Per', 'Larsson', '020202-7900', '08-33 07 56', 'per.larsson@gmail.com', 'Skogstorget 69', 'Skellefteå', '34058'),
('Johan', 'Andersson', '981229-1848', '08-67 63 73', 'johan.andersson@yahoo.de', 'Ringgränd 07', 'Växjö', '73560'),
('Karin', 'Johansson', '010128-7381', '08-247 655 84', 'karin.johansson@gmail.com', 'Strandtorget 015', 'Stockholm', '16090'),
('Inger', 'Skoglund', '000828-7138', '08-884 72 71', 'inger.skoglund@live.se', 'Järnvägsvägen 0', 'Trelleborg', '83015'),
('Katarina', 'Andersson', '941214-5337', '008-90 08 11', 'katarina.andersson@gmail.com', 'Ringtorget 6', 'Lidingö', '56912'),
('Gösta', 'Öberg', '050805-3733', '08-470 35 26', 'gösta.öberg@swipnet.se', 'Aspgatan 333', 'Trollhättan', '56486'),
('Jörgen', 'Alm', '050708-1727', '08-688 16 50', 'jörgen.alm@googlemail.com', 'Trädgårdstorget 775', 'Nyköping', '17001'),
('Maria', 'Larsson', '990219-2583', '0634-13 85 21', 'maria.larsson@gmail.com', 'Parkgatan 0', 'Karlstad', '27948'),
('Göran', 'Holm', '020512-3052', '08-270 22 06', 'göran.holm@yahoo.de', 'Åkervägen 091', 'Växjö', '75075'),
('Yngve', 'Nord', '950821-1217', '08-995 492 00', 'yngve.nord@telia.com', 'Backgatan 31', 'Uppsala', '45427'),
('Marianne', 'Jakobsson', '050413-7548', '+46 (0)8 523 162 14', 'marianne.jakobsson@telia.com', 'Kyrkogatan 1', 'Uddevalla', '63478'),
('Frida', 'Arvidsson', '960930-9936', '0634-470 87', 'frida.arvidsson@live.se', 'Genstigen 5', 'Umeå', '11449'),
('Ingegärd', 'Björkman', '940101-1367', '+46 (0)8 745 760 26', 'ingegärd.björkman@gmail.com', 'Stationsstigen 636', 'Alingsås', '65204'),
('Erik', 'Larsson', '970226-7445', '+46 (0)705 934 39', 'erik.larsson@yahoo.de', 'Björkgatan 0', 'Skövde', '61449'),
('Ulf', 'Friberg', '961213-3711', '0673-54 30 91', 'ulf.friberg@yahoo.de', 'Fabriksgatan 43', 'Halmstad', '82071'),
('Ann-Mari', 'Andersson', '950802-4966', '+46 (0)8 216 513 58', 'ann-mari.andersson@gmail.com', 'Aspvägen 64', 'Lidingö', '34870'),
('Erik', 'Jakobsson', '040527-5025', '08-740 69 44', 'erik.jakobsson@yahoo.de', 'Björkgränd 49', 'Uppsala', '42391'),
('Mary', 'Andersson', '001010-8736', '+46 (0)8 420 420 75', 'mary.andersson@yahoo.de', 'Asptorget 460', 'Falun', '42115'),
('Elin', 'Sundqvist', '951013-0595', '078-86 63 61', 'elin.sundqvist@live.se', 'Furugatan 239', 'Skövde', '99796'),
('Sven', 'Berg', '960703-3918', '031-652 74 69', 'sven.berg@swipnet.se', 'Kyrkotorget 988', 'Malmö', '60114'),
('Hans', 'Fredriksson', '020319-3057', '+46 (0)615 888 05', 'hans.fredriksson@live.se', 'Furugränd 3', 'Malmö', '11045'),
('Anneli', 'Lindholm', '940816-6800', '038-033 49 96', 'anneli.lindholm@yahoo.de', 'Järnvägsgatan 7', 'Södertälje', '44138'),
('Roland', 'Skoglund', '040712-8347', '0742-391 76', 'roland.skoglund@telia.com', 'Industritorget 4', 'Skövde', '29182'),
('Anders', 'Blom', '940526-8690', '0765-93 81 59', 'anders.blom@googlemail.com', 'Skogsgatan 6', 'Motala', '51775'),
('Henrik', 'Carlsson', '970831-3474', '+46 (0)76 51 45 17', 'henrik.carlsson@gmail.com', 'Åkerstigen 6', 'Kalmar', '16571'),
('Maria', 'Sjögren', '970723-9357', '+46 (0)8 580 063 22', 'maria.sjögren@gmail.com', 'Skolgatan 395', 'Landskrona', '85717'),
('Magdalena', 'Nyberg', '040723-1612', '+46 (0)011 071 66', 'magdalena.nyberg@live.se', 'Industrivägen 4', 'Luleå', '24449'),
('Elsa', 'Johansson', '970512-6861', '08-770 89 85', 'elsa.johansson@live.se', 'Åkerstigen 63', 'Kalmar', '68683'),
('Marina', 'Nilsson', '041001-5457', '044-503 71 51', 'marina.nilsson@spray.se', 'Idrottsvägen 037', 'Karlskrona', '28877'),
('Andreas', 'Karlsson', '030318-8700', '031-83 25 15', 'andreas.karlsson@yahoo.de', 'Grantorget 728', 'Landskrona', '13367'),
('Caroline', 'Hedberg', '010423-9371', '+46 (0)48 37 40 55', 'caroline.hedberg@spray.se', 'Nygatan 5', 'Södertälje', '21868'),
('Madeleine', 'Jakobsson', '050607-1638', '0947-933 22', 'madeleine.jakobsson@swipnet.se', 'Skoltorget 697', 'Skövde', '22653'),
('Rebecca', 'Jonsson', '950405-8877', '015-791 14 61', 'rebecca.jonsson@spray.se', 'Skolgatan 828', 'Karlskrona', '42226'),
('Anita', 'Nord', '960609-8896', '08-860 20 45', 'anita.nord@gmail.com', 'Strandgränd 75', 'Karlskoga', '73684'),
('Anders', 'Henriksson', '010831-5540', '089-363 20 35', 'anders.henriksson@spray.se', 'Strandgatan 347', 'Sandviken', '73790'),
('Nils', 'Larsson', '940506-1384', '08-01 65 88', 'nils.larsson@yahoo.de', 'Industristigen 1', 'Växjö', '42592'),
('Maria', 'Lindgren', '980429-4529', '0235-00 27 39', 'maria.lindgren@telia.com', 'Skolvägen 7', 'Östersund', '84245'),
('Gunnar', 'Eriksson', '950714-9244', '0029-745 10', 'gunnar.eriksson@googlemail.com', 'Furugränd 0', 'Jönköping', '30947'),
('Anna', 'Andersson', '970511-1400', '087-61 57 64', 'anna.andersson@live.se', 'Strandgatan 91', 'Trollhättan', '93852'),
('Berit', 'Nordin', '000728-0571', '08-436 384 93', 'berit.nordin@telia.com', 'Skolvägen 68', 'Eskilstuna', '28100'),
('Helena', 'Eriksson', '000904-1179', '+46 (0)88 66 98 58', 'helena.eriksson@gmail.com', 'Trädgårdsgatan 6', 'Helsingborg', '11757'),
('Mikael', 'Ivarsson', '970123-2408', '080-503 82 01', 'mikael.ivarsson@gmail.com', 'Villastigen 6', 'Borås', '12276'),
  -- 100 contacts
('Bror', 'Jansson', '910405-5166', '08-08 02 74', 'bror.jansson@telia.com', 'Idrottstorget 12', 'Skellefteå', '63825'),
('Maria', 'Sjöberg', '800617-7961', '+46 (0)347 042 38', 'maria.sjöberg@live.se', 'Ängsgränd 0', 'Karlskrona', '42557'),
('Ingrid', 'Bergström', '830324-6329', '08-568 221 03', 'ingrid.bergström@googlemail.com', 'Björktorget 0', 'Karlskoga', '87782'),
('Birgitta', 'Andersson', '750818-3469', '08-506 132 88', 'birgitta.andersson@live.se', 'Trädgårdstorget 90', 'Malmö', '15819'),
('Magnus', 'Hansson', '870720-9923', '0979-10 19 28', 'magnus.hansson@swipnet.se', 'Skolgränd 9', 'Västerås', '92961'),
('Maria', 'Gustafsson', '910210-5534', '08-055 97 35', 'maria.gustafsson@yahoo.de', 'Parkstigen 34', 'Varberg', '56524'),
('Maria', 'Björk', '861104-6882', '0756-818 38', 'maria.björk@live.se', 'Ekvägen 360', 'Linköping', '35751'),
('Karin', 'Nilsson', '911204-6561', '0990-31 92 46', 'karin.nilsson@live.se', 'Nyvägen 944', 'Malmö', '33152'),
('Emanuel', 'Erlandsson', '740414-7667', '073-597 35 37', 'emanuel.erlandsson@live.se', 'Järnvägsstigen 0', 'Södertälje', '48480'),
('Kenneth', 'Lundin', '760507-2219', '054-234 55 29', 'kenneth.lundin@gmail.com', 'Kyrkovägen 0', 'Norrköping', '23510'),
('Kenneth', 'Nygren', '670604-2519', '0828-99 62 84', 'kenneth.nygren@telia.com', 'Ringstigen 803', 'Norrköping', '14027'),
('Arne', 'Wikström', '911229-7545', '074-74 82 87', 'arne.wikström@telia.com', 'Strandvägen 95', 'Alingsås', '99617'),
('Torbjörn', 'Larsson', '801208-4193', '08-217 917 02', 'torbjörn.larsson@swipnet.se', 'Industrigatan 10', 'Linköping', '31875'),
('Anna', 'Larsson', '911024-5793', '+46 (0)65 64 70 11', 'anna.larsson@telia.com', 'Kvarnstigen 418', 'Borlänge', '44598'),
('Ingrid', 'Karlsson', '910531-2996', '08-620 56 38', 'ingrid.karlsson@telia.com', 'Kyrkogatan 65', 'Linköping', '11788'),
('Gunnar', 'Gustavsson', '680615-5310', '0222-154 54', 'gunnar.gustavsson@yahoo.de', 'Strandgränd 8', 'Karlskrona', '56675'),
('Camilla', 'Lindén', '760327-3793', '0433-14 25 23', 'camilla.lindén@googlemail.com', 'Kyrkogränd 782', 'Örnsköldsvik', '29174'),
('Erik', 'Jakobsson', '800316-7213', '030-033 58 94', 'erik.jakobsson@swipnet.se', 'Storvägen 32', 'Piteå', '40659'),
('Nils', 'Karlsson', '650106-2373', '08-782 873 91', 'nils.karlsson@spray.se', 'Idrottsgatan 48', 'Norrköping', '76627'),
('Sören', 'Nilsson', '781228-0423', '0299-19 28 54', 'sören.nilsson@live.se', 'Villavägen 7', 'Falun', '24432'),
('Lars', 'Nilsson', '660421-9672', '+46 (0)71 44 10 13', 'lars.nilsson@telia.com', 'Ängsstigen 77', 'Lund', '69268'),
('Eva', 'Jansson', '660202-8117', '021-44 81 83', 'eva.jansson@swipnet.se', 'Parkgränd 837', 'Mölndal', '67657'),
('Birgitta', 'Dahlström', '660331-4276', '08-54 02 21', 'birgitta.dahlström@gmail.com', 'Idrottsvägen 234', 'Umeå', '17734'),
('Hans', 'Larsson', '710607-4037', '016-08 40 94', 'hans.larsson@live.se', 'Parkvägen 88', 'Kalmar', '69574'),
('Åke', 'Boström', '761102-3461', '+46 (0)212 430 92', 'åke.boström@gmail.com', 'Kyrkstigen 39', 'Sandviken', '44202'),
('Knut', 'Jonsson', '881122-1301', '+46 (0)8 372 104 19', 'knut.jonsson@gmail.com', 'Kyrkstigen 304', 'Västerås', '58816'),
('Ingemar', 'Larsson', '690322-7285', '032-62 04 26', 'ingemar.larsson@swipnet.se', 'Parkgränd 178', 'Helsingborg', '91365'),
('Margareta', 'Nilsson', '700613-4774', '0962-78 24 78', 'margareta.nilsson@gmail.com', 'Fabriksgatan 3', 'Borlänge', '48114'),
('Lars', 'Andersson', '790627-4639', '078-35 48 43', 'lars.andersson@gmail.com', 'Grangränd 6', 'Malmö', '51028'),
('Stefan', 'Andersson', '861230-5568', '000-62 10 71', 'stefan.andersson@gmail.com', 'Järnvägsvägen 9', 'Alingsås', '39304'),
('Lilian', 'Petersson', '840518-7660', '0661-69 39 43', 'lilian.petersson@swipnet.se', 'Parkgatan 075', 'Luleå', '50585'),
('Torsten', 'Nyberg', '800926-6670', '+46 (0)90 52 82 03', 'torsten.nyberg@spray.se', 'Aspvägen 9', 'Örebro', '42663'),
('Linnea', 'Nilsson', '820322-6678', '073-99 59 67', 'linnea.nilsson@yahoo.de', 'Järnvägsgatan 15', 'Linköping', '10771'),
('Veronica', 'Sjögren', '910504-0738', '08-285 027 96', 'veronica.sjögren@yahoo.de', 'Furugränd 9', 'Luleå', '38205'),
('Emil', 'Ström', '681012-6224', '08-06 21 61', 'emil.ström@telia.com', 'Trädgårdstorget 7', 'Uddevalla', '29509'),
('William', 'Gustafsson', '740206-4401', '08-70 37 11', 'william.gustafsson@spray.se', 'Stationstorget 368', 'Borlänge', '43878'),
('Arne', 'Håkansson', '670225-3466', '+46 (0)269 010 50', 'arne.håkansson@live.se', 'Kyrkogatan 611', 'Alingsås', '67476'),
('Ingegärd', 'Nilsson', '690924-0720', '0265-19 85 79', 'ingegärd.nilsson@live.se', 'Furugatan 3', 'Östersund', '97194'),
('Marcus', 'Karlsson', '800801-1317', '08-082 29 17', 'marcus.karlsson@yahoo.de', 'Industrigatan 543', 'Malmö', '36924'),
('Viola', 'Eriksson', '721201-4992', '+46 (0)296 805 36', 'viola.eriksson@swipnet.se', 'Ekgränd 464', 'Kristianstad', '10624'),
('Carl', 'Ivarsson', '690512-5404', '+46 (0)8 522 616 77', 'carl.ivarsson@live.se', 'Bäckvägen 606', 'Trelleborg', '41378'),
('Leif', 'Bergström', '810214-0079', '+46 (0)261 676 46', 'leif.bergström@swipnet.se', 'Skolgatan 0', 'Jönköping', '89897'),
('Emanuel', 'Andersson', '930801-8523', '0062-20 91 29', 'emanuel.andersson@swipnet.se', 'Skolvägen 5', 'Karlstad', '24664'),
('Sven', 'Eriksson', '740125-9325', '08-582 668 77', 'sven.eriksson@swipnet.se', 'Järnvägsstigen 853', 'Varberg', '94831'),
('Tomas', 'Nilsson', '810426-1857', '064-357 12 59', 'tomas.nilsson@spray.se', 'Ektorget 127', 'Stockholm', '23187'),
('Cecilia', 'Håkansson', '800107-0138', '+46 (0)8 076 028 28', 'cecilia.håkansson@googlemail.com', 'Furuvägen 8', 'Uddevalla', '78972'),
('Gerd', 'Andersson', '920506-8423', '0883-338 98', 'gerd.andersson@googlemail.com', 'Åkervägen 8', 'Östersund', '71987'),
('Christer', 'Gustafsson', '790713-0871', '038-95 26 24', 'christer.gustafsson@swipnet.se', 'Björkgränd 473', 'Karlskoga', '93425'),
('Dagmar', 'Johansson', '710822-0646', '079-704 99 39', 'dagmar.johansson@live.se', 'Trädgårdstorget 458', 'Lund', '87055'),
('Maj-Britt', 'Larsson', '690817-8863', '08-165 27 88', 'maj-britt.larsson@googlemail.com', 'Storgatan 53', 'Ängelholm', '86660'),
('Carl', 'Andersson', '650205-2456', '068-48 15 62', 'carl.andersson@live.se', 'Storgränd 305', 'Stockholm', '22243'),
('Svea', 'Boman', '861229-3350', '08-481 471 70', 'svea.boman@telia.com', 'Fabrikstorget 63', 'Eskilstuna', '26603'),
('Inger', 'Eriksson', '810630-4333', '08-19 66 63', 'inger.eriksson@yahoo.de', 'Bäckvägen 2', 'Uppsala', '88556'),
('Johanna', 'Karlsson', '831025-3300', '+46 (0)97 73 79 02', 'johanna.karlsson@swipnet.se', 'Stationsvägen 60', 'Eskilstuna', '21543'),
('Henrik', 'Östlund', '770126-7044', '+46 (0)407 015 06', 'henrik.östlund@yahoo.de', 'Järnvägsvägen 93', 'Jönköping', '54120'),
('Birgit', 'Eklund', '680919-7855', '+46 (0)148 068 78', 'birgit.eklund@live.se', 'Skolgränd 74', 'Karlskoga', '98017'),
('Jacob', 'Nilsson', '670424-6484', '08-025 06 25', 'jacob.nilsson@telia.com', 'Gengränd 49', 'Jönköping', '68224'),
('Inga', 'Jonsson', '730521-4251', '0188-817 12', 'inga.jonsson@swipnet.se', 'Ängsvägen 91', 'Skellefteå', '24737'),
('Birgit', 'Pettersson', '800510-9221', '070-180 01 28', 'birgit.pettersson@swipnet.se', 'Kvarngränd 51', 'Lidingö', '99823'),
('Göran', 'Hermansson', '910908-2280', '+46 (0)88 01 51 09', 'göran.hermansson@telia.com', 'Trädgårdstorget 12', 'Falun', '75066'),
('Maria', 'Nilsson', '890831-6907', '096-50 96 83', 'maria.nilsson@telia.com', 'Parkstigen 530', 'Södertälje', '62073'),
('Emma', 'Johansson', '881217-7916', '020-686 56 57', 'emma.johansson@telia.com', 'Parkgränd 707', 'Södertälje', '28784'),
('Sofia', 'Larsson', '901204-4567', '+46 (0)8 935 313 78', 'sofia.larsson@live.se', 'Industrivägen 0', 'Lidingö', '37280'),
('Linnea', 'Jansson', '900211-4073', '065-97 51 05', 'linnea.jansson@live.se', 'Åkervägen 31', 'Trollhättan', '21757'),
('Ingvar', 'Östlund', '650822-6880', '054-568 31 75', 'ingvar.östlund@telia.com', 'Industrivägen 83', 'Sandviken', '74160'),
('Birgitta', 'Holmberg', '740329-5996', '+46 (0)401 109 39', 'birgitta.holmberg@telia.com', 'Åkergränd 811', 'Trelleborg', '64837'),
('Cecilia', 'Karlsson', '920704-6872', '+46 (0)25 69 45 67', 'cecilia.karlsson@telia.com', 'Nygränd 535', 'Stockholm', '88456'),
('Ida', 'Karlsson', '801112-6987', '+46 (0)313 978 13', 'ida.karlsson@googlemail.com', 'Idrottsgatan 971', 'Motala', '88279'),
('Anna', 'Johansson', '740701-0433', '+46 (0)531 074 68', 'anna.johansson@live.se', 'Nytorget 9', 'Borås', '22531'),
('Mikael', 'Sundberg', '780112-4301', '093-45 28 04', 'mikael.sundberg@gmail.com', 'Kyrkstigen 340', 'Landskrona', '93923'),
('Ingemar', 'Nilsson', '671006-2008', '0986-493 83', 'ingemar.nilsson@spray.se', 'Fabriksgatan 50', 'Växjö', '58863'),
('Emma', 'Johansson', '880620-6408', '082-88 72 36', 'emma.johansson@spray.se', 'Stationsgatan 299', 'Falun', '21184'),
('Siv', 'Karlsson', '750724-4726', '08-694 995 45', 'siv.karlsson@yahoo.de', 'Stationstorget 4', 'Lidingö', '60207'),
('Ulla', 'Nilsson', '691212-1628', '017-93 41 47', 'ulla.nilsson@spray.se', 'Björkvägen 0', 'Ängelholm', '72689'),
('Gunborg', 'Johansson', '930415-1377', '032-170 62 49', 'gunborg.johansson@telia.com', 'Parktorget 469', 'Luleå', '93331'),
('Roger', 'Sandberg', '700913-4797', '+46 (0)18 58 26 07', 'roger.sandberg@yahoo.de', 'Ekgatan 10', 'Norrköping', '60487'),
('Ingegärd', 'Magnusson', '791210-4762', '+46 (0)8 052 972 89', 'ingegärd.magnusson@gmail.com', 'Ektorget 14', 'Motala', '12546'),
('Nils', 'Johansson', '820813-5015', '08-517 69 35', 'nils.johansson@googlemail.com', 'Parkstigen 4', 'Nyköping', '55896'),
('Maria', 'Forsberg', '920923-4203', '08-329 80 12', 'maria.forsberg@live.se', 'Asptorget 8', 'Luleå', '90350'),
('Lars', 'Johansson', '840216-8846', '+46 (0)8 334 104 72', 'lars.johansson@swipnet.se', 'Skolgatan 2', 'Lidingö', '51321'),
('Ragnar', 'Dahl', '860309-0096', '08-062 141 05', 'ragnar.dahl@live.se', 'Skolstigen 275', 'Falun', '48646'),
('Maria', 'Eklund', '910827-0175', '0698-40 01 02', 'maria.eklund@telia.com', 'Stationsstigen 41', 'Halmstad', '85191'),
('Maria', 'Svärd', '850114-4359', '+46 (0)8 205 632 10', 'maria.svärd@swipnet.se', 'Trädgårdsgatan 301', 'Karlskrona', '13546'),
('Olof', 'Linder', '850805-9162', '+46 (0)386 651 82', 'olof.linder@googlemail.com', 'Fabriksvägen 2', 'Malmö', '71510'),
('Jörgen', 'Arvidsson', '900813-9157', '080-25 77 41', 'jörgen.arvidsson@swipnet.se', 'Trädgårdsvägen 45', 'Stockholm', '94202'),
('Göran', 'Svensson', '661027-8738', '+46 (0)980 536 71', 'göran.svensson@googlemail.com', 'Backgatan 152', 'Uppsala', '12701'),
('Tommy', 'Andersson', '750317-7235', '08-479 39 09', 'tommy.andersson@live.se', 'Skogsstigen 4', 'Landskrona', '45820'),
('Karl', 'Jonsson', '760906-7975', '+46 (0)8 413 956 88', 'karl.jonsson@swipnet.se', 'Villastigen 5', 'Stockholm', '37432'),
('Elisabeth', 'Moberg', '720818-7398', '098-360 40 03', 'elisabeth.moberg@gmail.com', 'Industritorget 0', 'Sundsvall', '66530'),
('Catharina', 'Larsson', '910128-3316', '0424-93 48 21', 'catharina.larsson@telia.com', 'Ekgatan 0', 'Södertälje', '11232'),
('Viktor', 'Arvidsson', '800519-6632', '021-81 17 23', 'viktor.arvidsson@gmail.com', 'Kvarngatan 02', 'Uppsala', '37674'),
('Lena', 'Johansson', '910320-4096', '0867-639 14', 'lena.johansson@yahoo.de', 'Idrottsvägen 087', 'Lund', '15499'),
('Elisabeth', 'Nilsson', '681115-5867', '0078-331 96', 'elisabeth.nilsson@yahoo.de', 'Strandvägen 421', 'Helsingborg', '37433'),
('Roger', 'Olsson', '800213-2952', '+46 (0)103 968 21', 'roger.olsson@live.se', 'Idrottsvägen 74', 'Uddevalla', '33324'),
('Sven', 'Karlsson', '800719-8305', '078-849 27 76', 'sven.karlsson@yahoo.de', 'Genstigen 5', 'Uppsala', '39551'),
('Lennart', 'Ekström', '760611-7963', '08-656 574 45', 'lennart.ekström@googlemail.com', 'Stortorget 9', 'Örnsköldsvik', '40215'),
('Marie-Louise', 'Hansson', '830427-5228', '0389-56 17 62', 'marie-louise.hansson@live.se', 'Parktorget 140', 'Borås', '27720'),
('Anna', 'Nilsson', '760715-9618', '077-94 81 91', 'anna.nilsson@googlemail.com', 'Skolvägen 52', 'Motala', '50648'),
('Kristina', 'Andersson', '870411-6006', '+46 (0)8 317 496 32', 'kristina.andersson@googlemail.com', 'Storgränd 54', 'Linköping', '75432'),
('Johan', 'Johansson', '930914-1233', '0001-88 78 15', 'johan.johansson@telia.com', 'Asptorget 35', 'Karlstad', '45744'),
  -- 20 instructors
('Erik', 'Axelsson', '030201-4493', '+46 (0)692 156 58', 'erik.axelsson@telia.com', 'Stationsgränd 275', 'Uddevalla', '58091'),
('Henrik', 'Johansson', '000229-8586', '049-722 79 35', 'henrik.johansson@live.se', 'Ringtorget 95', 'Helsingborg', '39314'),
('Sebastian', 'Nilsson', '051012-8036', '0572-84 56 54', 'sebastian.nilsson@swipnet.se', 'Järnvägsvägen 6', 'Sundsvall', '65421'),
('Carina', 'Karlsson', '000301-9296', '0869-27 29 16', 'carina.karlsson@gmail.com', 'Kyrktorget 386', 'Sundsvall', '67072'),
('Victoria', 'Gustafsson', '050225-5581', '0531-87 43 09', 'victoria.gustafsson@googlemail.com', 'Genvägen 4', 'Norrköping', '31784'),
('Linnéa', 'Wallin', '980205-5518', '+46 (0)793 643 58', 'linnéa.wallin@gmail.com', 'Industritorget 38', 'Kalmar', '52903'),
('Eva', 'Karlsson', '021011-2728', '061-64 19 36', 'eva.karlsson@telia.com', 'Björktorget 81', 'Jönköping', '27894'),
('Ebba', 'Larsson', '940521-9917', '+46 (0)14 14 48 86', 'ebba.larsson@gmail.com', 'Backgatan 825', 'Östersund', '56615'),
('Ulrika', 'Nilsson', '031217-3941', '027-87 60 18', 'ulrika.nilsson@telia.com', 'Skogsvägen 31', 'Helsingborg', '83249'),
('Fredrik', 'Lundgren', '970126-2843', '+46 (0)38 59 93 76', 'fredrik.lundgren@spray.se', 'Storstigen 8', 'Göteborg', '54114'),
('Birgitta', 'Pettersson', '010103-3421', '+46 (0)80 38 78 07', 'birgitta.pettersson@spray.se', 'Fabriksgatan 143', 'Varberg', '56824'),
('Matilda', 'Berg', '050403-3853', '+46 (0)04 11 57 89', 'matilda.berg@yahoo.de', 'Björkstigen 362', 'Södertälje', '66777'),
('Ragnhild', 'Johansson', '000813-5386', '08-562 06 21', 'ragnhild.johansson@live.se', 'Bäckgränd 2', 'Nyköping', '55566'),
('Rune', 'Lundgren', '041013-2682', '077-26 58 65', 'rune.lundgren@gmail.com', 'Kvarngränd 162', 'Sandviken', '55948'),
('Tomas', 'Karlsson', '010511-0944', '0228-07 70 74', 'tomas.karlsson@yahoo.de', 'Järnvägsstigen 5', 'Eskilstuna', '42089'),
('Conny', 'Åström', '990126-2486', '08-64 67 02', 'conny.åström@swipnet.se', 'Industrigränd 5', 'Helsingborg', '61382'),
('Hans', 'Olsson', '940630-7455', '+46 (0)32 89 61 83', 'hans.olsson@swipnet.se', 'Storgatan 10', 'Uppsala', '10037'),
('Kerstin', 'Larsson', '050123-3738', '08-75 40 23', 'kerstin.larsson@yahoo.de', 'Idrottsgränd 7', 'Mölndal', '68870'),
('Hans', 'Lundkvist', '940802-8349', '+46 (0)8 288 376 96', 'hans.lundkvist@googlemail.com', 'Aspgatan 0', 'Lund', '13659'),
('Erik', 'Sjöberg', '020711-4919', '+46 (0)369 800 62', 'erik.sjöberg@gmail.com', 'Skogstorget 7', 'Jönköping', '36870');

-- Insert 10 students (person IDs 1-10)
INSERT INTO student (person_id)
SELECT id FROM person WHERE id BETWEEN 1 AND 100;

-- Insert 10 contact persons with specified relations
INSERT INTO contact_person (relation, person_id)
VALUES
  ('Parent', 101),
  ('Guardian', 102),
  ('Sibling', 103),
  ('Spouse', 104),
  ('Friend', 105),
  ('Relative', 106),
  ('Mentor', 107),
  ('Coach', 108),
  ('Cousin', 109),
  ('Grandparent', 110);

-- Insert 5 instructors (person IDs 21-25)
INSERT INTO instructor (teaches_ensembles, person_id)
VALUES
  (TRUE, 201),
  (FALSE, 202),
  (TRUE, 203),
  (TRUE, 204),
  (FALSE, 205);

-- Create student_relations between students and contact persons
INSERT INTO student_relations (student_id, contact_person_id)
VALUES
  (1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
  (6, 6), (7, 7), (8, 8), (9, 9), (10, 10);

-- Create 5 sibling relations (assuming student IDs)
INSERT INTO sibling_relations (student_id, sibling_student_id)
VALUES
  (1, 6), (2, 7), (3, 8), (4, 9), (5, 10);

-- Create 5 instruments
INSERT INTO instruments (instrument_type)
VALUES ('Guitar'), ('Piano'), ('Violin'), ('Drums'), ('Flute');

-- Insert random data into instructor_instruments
INSERT INTO instructor_instruments (instruments_id, instructor_id)
VALUES
  (5, 1), -- Instructor 1 knows Instrument 5
  (4, 1), -- Instructor 1 also knows Instrument 4
  (1, 2), -- Instructor 2 knows Instrument 1
  (5, 2), -- Instructor 2 also knows Instrument 5
  (2, 3), -- Instructor 3 knows Instrument 2
  (1, 3), -- Instructor 3 also knows Instrument 1
  (3, 4), -- Instructor 4 knows Instrument 3
  (2, 4), -- Instructor 4 also knows Instrument 2
  (4, 5), -- Instructor 5 knows Instrument 4
  (3, 5); -- Instructor 5 also knows Instrument 3

-- Create 5 rental instruments with price
INSERT INTO rental_instruments (rental_price, quantity_in_stock, brand, instruments_id)
VALUES
  (25, 5, 'Yamaha', 1),
  (30, 6, 'Steinway & Sons', 2),
  (35, 4, 'Gibson', 3),
  (40, 7, 'Fender', 4),
  (45, 3, 'Ibanez', 5);

-- Create 5 rental records (assuming rental_instrument IDs and student IDs)
INSERT INTO rental_record (rental_period, student_id, rental_instruments_id)
VALUES
  ('2023-09-01', 1, 1),
  ('2023-09-08', 2, 2),
  ('2023-09-15', 3, 3),
  ('2023-09-22', 4, 4),
  ('2023-09-29', 5, 5);

-- Create 5 classrooms
INSERT INTO classroom (person_capacity, street, city, zip)
VALUES
  (2, '101 Acoustic Ave', 'Noteville', '12345'),
  (25, '202 Bass Blvd', 'Treble Town', '23456'),
  (7, '303 Cello Ct', 'Harmony Hills', '34567'),
  (15, '404 Drum Dr', 'Rhythm City', '45678'),
  (3, '505 Electric Ave', 'Melody Meadows', '56789');

    -- Create 9 price schemes with all possible variations of skill_level and lesson_type, sorted
INSERT INTO price_scheme (price, discount, sibling_discount_eligibility, instructor_fee, lesson_type, skill_type)
VALUES
  -- Individual lessons
  (100, 0.10, TRUE, 20, 'individual', 'beginner'),
  (250, 0.25, FALSE, 35, 'individual', 'intermediate'),
  (310, 0.32, FALSE, 42, 'individual', 'advanced'),

  -- Group lessons
  (110, 0.12, FALSE, 22, 'group', 'beginner'),
  (150, 0.15, FALSE, 25, 'group', 'intermediate'),
  (300, 0.30, TRUE, 40, 'group', 'advanced'),

  -- Ensemble lessons
  (210, 0.22, FALSE, 32, 'ensemble', 'beginner'),
  (200, 0.20, TRUE, 30, 'ensemble', 'intermediate'),
  (260, 0.28, TRUE, 37, 'ensemble', 'advanced');

-- Insert 15 lessons, 5 of each type, with corresponding price_scheme_id
INSERT INTO lesson (date, start_time, duration, classroom_id, price_scheme_id, instructor_id, instruments_id, lesson_type)
VALUES
  -- 5 Individual lessons, using the first 3 price_scheme_id for beginner, intermediate, advanced
  ('2023-03-01', '10:00', '1 hour', 1, 1, 1, 1, 'individual'),
  ('2023-06-02', '11:00', '1 hour 30 mins', 2, 2, 1, 2, 'individual'),
  ('2023-08-03', '12:00', '2 hours', 3, 3, 1, 3, 'individual'),
  ('2023-10-04', '13:00', '1 hour', 4, 1, 1, 4, 'individual'),
  ('2023-12-05', '14:00', '1 hour 30 mins', 5, 2, 1, 5, 'individual'),
  
  -- 5 Group lessons, using the next 3 price_scheme_id for beginner, intermediate, advanced
  ('2023-03-06', '15:00', '1 hour', 1, 4, 1, 1, 'group'),
  ('2023-07-07', '16:00', '1 hour 30 mins', 2, 5, 1, 2, 'group'),
  ('2023-09-08', '17:00', '2 hours', 3, 6, 1, 3, 'group'),
  ('2023-10-09', '18:00', '1 hour', 4, 4, 1, 4, 'group'),
  ('2023-12-10', '19:00', '1 hour 30 mins', 5, 5, 1, 5, 'group'),
  
  -- 5 Ensemble lessons, using the last 3 price_scheme_id for beginner, intermediate, advanced
  ('2023-02-11', '20:00', '1 hour', 1, 7, 1, 1, 'ensemble'),
  ('2023-06-12', '21:00', '1 hour 30 mins', 2, 8, 1, 2, 'ensemble'),
  ('2023-07-13', '22:00', '2 hours', 3, 9, 1, 3, 'ensemble'),
  ('2023-10-14', '23:00', '1 hour', 4, 7, 1, 4, 'ensemble'),
  ('2023-11-15', '24:00', '1 hour 30 mins', 5, 8, 1, 5, 'ensemble');

  -- Insert corresponding group_lesson entries with random min and max attendees
INSERT INTO group_lesson (lesson_id, min_attendees, max_attendees, attendees)
VALUES
  (6, 3, 12, 5),   -- Random values between 3 and 25 for min and max attendees
  (7, 4, 15, 7),
  (8, 5, 20, 10),
  (9, 6, 18, 8),
  (10, 7, 25, 7);

  -- Insert corresponding ensemble entries with random min and max attendees
INSERT INTO ensemble (lesson_id, min_attendees, max_attendees, attendees, genre)
VALUES
  (11, 5, 25, 8, 'Jazz'),   -- Random values between 3 and 25 for min and max attendees
  (12, 6, 22, 7, 'Rock'),
  (13, 4, 18, 5, 'Classical'),
  (14, 5, 20, 6, 'Blues'),
  (15, 4, 15, 4, 'Pop');

-- Insert lesson attendees for group lessons and ensembles
INSERT INTO lesson_attendees (student_id, lesson_id)
VALUES
  -- Attendees for individual lessons
  (1, 1),  -- Student 1 attending the first individual lesson
  (2, 2),  -- Student 2 attending the second individual lesson
  (3, 3),  -- and so on
  (4, 4),
  (5, 5),

  -- Attendees for the first group lesson (lesson_id = 6)
  (1, 6), (2, 6), (3, 6), (4, 6), (5, 6),
  -- Attendees for the second group lesson (lesson_id = 7)
  (6, 7), (7, 7), (8, 7), (9, 7), (10, 7), (1, 7),
  -- Attendees for the third group lesson (lesson_id = 8)
  (2, 8), (3, 8), (4, 8), (5, 8), (6, 8), (7, 8), (8, 8), (9, 8), (10, 8), (1, 8),
  -- Attendees for the fourth group lesson (lesson_id = 9)
  (2, 9), (3, 9), (4, 9), (5, 9), (6, 9), (7, 9), (8, 9),
  -- Attendees for the fifth group lesson (lesson_id = 10)
  (9, 10), (10, 10), (1, 10), (2, 10), (3, 10), (4, 10), (5, 10), (6, 10),

  -- Attendees for the first ensemble lesson (lesson_id = 11)
  (7, 11), (8, 11), (9, 11), (10, 11), (1, 11), (2, 11), (3, 11), (4, 11),
  -- Attendees for the second ensemble lesson (lesson_id = 12)
  (5, 12), (6, 12), (7, 12), (8, 12), (9, 12), (10, 12), (1, 12),
  -- Attendees for the third ensemble lesson (lesson_id = 13)
  (2, 13), (3, 13), (4, 13), (5, 13),
  -- Attendees for the fourth ensemble lesson (lesson_id = 14)
  (6, 14), (7, 14), (8, 14), (9, 14), (10, 14), (1, 14),
  -- Attendees for the fifth ensemble lesson (lesson_id = 15)
  (2, 15), (3, 15), (4, 15), (5, 15);