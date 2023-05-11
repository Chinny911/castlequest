--INSERT INTO table_one VALUES ('foo', 42)
INSERT INTO users ("emailaddress", "firstname", "lastname", "password", "DOB")
VALUES 
  ('jdoe1990@gmail.com', 'John', 'Doe', 'password1', '1999-09-19'),
  ('ksmith85@yahoo.com', 'Karen', 'Smith', '12345678', '1990-07-23'),
  ('mjohnson95@gmail.com', 'Mark', 'Johnson', 'welcome123', '2002-11-06'),
  ('jlee2001@yahoo.com', 'Jessica', 'Lee', 'iloveyou', '2004-02-15'),
  ('rsmith1992@gmail.com', 'Rachel', 'Smith', 'qwerty123', '1997-05-31'),
  ('jjohnson88@gmail.com', 'Jack', 'Johnson', 'letmein', '1994-03-10'),
  ('sshaw2002@yahoo.com', 'Samantha', 'Shaw', '123456', '1988-12-29'),
  ('tmiller1987@yahoo.com', 'Tyler', 'Miller', 'password123', '1995-02-27'),
  ('jross1999@email.com', 'Jennifer', 'Ross', 'hello123', '1998-01-14'),
  ('mbrown1989@gmail.com', 'Michael', 'Brown', 'abc123', '1993-10-22'),
  ('pturner1994@yahoo.com', 'Patrick', 'Turner', 'password', '2001-09-05'),
  ('tclark1997@gmail.com', 'Tiffany', 'Clark', 'welcome', '2000-12-23'),
  ('jhernandez2000@gmail.com', 'Julia', 'Hernandez', 'letmein123', '2003-07-18'),
  ('rjones1993@yahoo.com', 'Rebecca', 'Jones', '123456789', '2002-06-11'),
  ('ddavis1986@gmail.com', 'Daniel', 'Davis', 'qazwsx123', '1990-08-27');

INSERT INTO guilds ("guildid", "guildname")
VALUES
  (1, 'Warriors of Light'),
  (2, 'Sons of Thunder'),
  (3, 'Keepers of the Flame');
  --(4, 'Guardians of the Forest'),
  --(5, 'Champions of the Sea')

INSERT INTO players ("playerid", "playername", "emailaddress", "xplevel", "hp", "gold", "guildid")
VALUES 
  (1, 'Bencore', 'jdoe1990@gmail.com', 10, 100, 500, 3),
  (2, 'Alan300', 'ksmith85@yahoo.com', 30, 50, 1000, 1),
  (3, 'Charlie', 'mjohnson95@gmail.com', 20, 200, 250, 2),
  (4, 'Droidboy', 'jlee2001@yahoo.com', 80, 70, 750, NULL),
    (5, 'Eve', 'rsmith1992@gmail.com', 15, 150, 800, 2),
  (6, 'Freelancer', 'jjohnson88@gmail.com', 3, 30, 200, 1),
  (7, 'Ragnor11', 'sshaw2002@yahoo.com', 66, 40, 400, 3),
  (8, 'Joe', 'tmiller1987@yahoo.com', 12, 120, 1200, NULL),
  (9, 'Killian55', 'jross1999@email.com', 18, 180, 1500, 1),
  (10, 'wacky99', 'mbrown1989@gmail.com', 500, 10, 50, NULL),
  (11, 'Karen911', 'pturner1994@yahoo.com', 621, 90, 600, 3),
  (12, 'blabla', 'tclark1997@gmail.com', 79, 60, 300, 2),
  (13, 'leo', 'jhernandez2000@gmail.com', 110, 110, 1100, 2),
  (14, 'Nate', 'rjones1993@yahoo.com', 40, 40, 150, 3),
  (15, 'Mango666', 'ddavis1986@gmail.com', 91, 39, 350, 1);

INSERT INTO items ("itemid", "itemname")
VALUES 
  (1, 'Sword'),
  (2, 'Shield'),
  (3, 'Potion'),
  (4, 'Armor'),
  (5, 'Staff'),
  (6, 'Ring'),
  (7, 'Amulet'),
  (8, 'Gun'),
  (9, 'Spear'),
  (10, 'Helmet'),
  (11, 'Mace'),
  (12, 'Dagger'),
  (13, 'Bow'),
  (14, 'Arrow'),
  (15, 'Stones');

INSERT INTO playeritems ("itemid", "numberofitems", "playerid")
VALUES
  (1, 3, 1),
  (2, 5, 2),
  (3, 2, 3),
  (4, 4, 4),
  (5, 1, 5),
  (6, 3, 6),
  (7, 5, 7),
  (8, 2, 8),
  (9, 4, 9),
  (10, 1, 10),
  (11, 3, 11),
  (12, 5, 12),
  (13, 2, 13),
  (14, 4, 14),
  (15, 1, 15);
  
INSERT INTO itemprices ("itemid", "gold")
VALUES
  (1, 5),
  (2, 10),
  (3, 15),
  (4, 20),
  (5, 25),
  (6, 30),
  (7, 35),
  (8, 40),
  (9, 50),
  (10, 60),
  (11, 70),
  (12, 90),
  (13, 110),
  (14, 130),
  (15, 1);






