DROP TABLE Team_Bolide;
DROP TABLE Racer_Fines;
DROP TABLE Fines;
DROP TABLE Bolide;
DROP TABLE Racer_Result;
DROP TABLE Team;
DROP TABLE Grand_Prix;
DROP TABLE Autodrome;
DROP TABLE Racer;
DROP SEQUENCE racer_id;
DROP SEQUENCE autodrome_id;
DROP SEQUENCE stage_id;
DROP SEQUENCE team_id;
DROP SEQUENCE result_id;
DROP SEQUENCE bolide_id;
DROP SEQUENCE fines_id;

CREATE TABLE Racer (
  racer_id INTEGER PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL
);

CREATE SEQUENCE racer_id
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE;


CREATE TABLE Autodrome (
  autodrome_id INTEGER PRIMARY KEY,
  autodrome_name VARCHAR(50) NOT NULL,
  country VARCHAR(50) NOT NULL,
  circle_length FLOAT NOT NULL
);

CREATE SEQUENCE autodrome_id
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE;


CREATE TABLE Grand_Prix (
  stage_id INTEGER PRIMARY KEY,
	autodrome_id INTEGER,
  FOREIGN KEY (autodrome_id) REFERENCES Autodrome(autodrome_id),
  grand_prix_name VARCHAR(80) NOT NULL,
  number_ciricles INTEGER NOT NULL,
  championship_date DATE
);

CREATE SEQUENCE stage_id
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE;


CREATE TABLE Team (
  team_id INTEGER PRIMARY KEY,
  team_name VARCHAR(50) NOT NULL,
  home_country VARCHAR(50) NOT NULL,
  home_city VARCHAR(50) NOT NULL
);

CREATE SEQUENCE team_id
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE;


CREATE TABLE Racer_Result (
  result_id INTEGER PRIMARY KEY,
  racer_id INTEGER NOT NULL,
	stage_id INTEGER NOT NULL,
	team_id INTEGER NOT NULL,
  FOREIGN KEY (stage_id) REFERENCES Grand_Prix(stage_id),
  FOREIGN KEY (racer_id) REFERENCES Racer(racer_id),
  FOREIGN KEY (team_id) REFERENCES Team(team_id),
  fast_circle CHAR(1) NOT NULL,
  place INTEGER NOT NULL,
  result_time INTEGER
);

CREATE SEQUENCE result_id
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE;


CREATE TABLE Bolide (
  bolide_id INTEGER PRIMARY KEY,
  tire VARCHAR(50) NOT NULL,
  company_name VARCHAR(50) NOT NULL
);

CREATE SEQUENCE bolide_id
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE;

  
CREATE TABLE Fines (
  fines_id INTEGER PRIMARY KEY,
  name_fines VARCHAR(80) NOT NULL,
  mark INTEGER NOT NULL
);

CREATE SEQUENCE fines_id
START WITH 0
INCREMENT BY 1
MINVALUE 0
NOMAXVALUE;


CREATE TABLE Racer_Fines (
	racer_id INTEGER,
	fines_id INTEGER,
  FOREIGN KEY (racer_id) REFERENCES Racer(racer_id),
  FOREIGN KEY (fines_id) REFERENCES Fines(fines_id)
);


CREATE TABLE Team_Bolide (
	team_id INTEGER,
	bolide_id INTEGER,
  FOREIGN KEY (team_id) REFERENCES Team(team_id),
  FOREIGN KEY (bolide_id) REFERENCES Bolide(bolide_id)
);

# Stay calm i did it through helpful python script :D

INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Disqualification for the race', '5'); --0
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Speeding (at any time) by more than 20 km/h', '3'); --1
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Creating a dangerous accident', '3'); --2
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Ignoring Black Flags', '3'); --3
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Speeding (at any time) by 10-20 km/h', '2'); --4
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Crash creation', '2'); --5
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Dangerous blocking of the opponent', '2'); --6
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Creating a dangerous incident as a result of which an opponent left the track', '2'); --7
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Speeding in yellow or red flags', '2'); --8
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Ignoring Blue Flags', '2'); --9
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'False start', '2'); --10
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Overtaking a safety car', '2'); --11
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Exceeding Delta Time in Safety Car Mode', '2'); --12
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Dangerous exit from the pit stop', '2'); --13
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Ignoring weighing procedures in qualifications', '2'); --14
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Skipping or being late for a briefing for riders', '1'); --15
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Speeding (at any time) within 10 km/hc', '1'); --16
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Lock another car', '1'); --17
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Squeezing an opponent off the track', '1'); --18
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Obtaining an advantage by traveling off the highway', '1'); --19
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Crossing the white line when leaving the pit lane', '1'); --20
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Ignoring the red light on the pit lanec', '1'); --21
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Overtaking an opponent for a safety carc', '1'); --22
INSERT INTO Fines (fines_id, name_fines, mark) VALUES (fines_id.nextval, 'Violation of the distance behind the safety car', '1'); --23

INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Albert Park', 'Australia', 5.303); -- 0
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Sepang International Circuit',  'Malazya', 5.543); --1
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Bahrain International Circuit',  'Bahrane', 5.406); --2
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Circuit de Barcelona-Catalunya',  'Spain', 4.655); --3
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Monte Carlo', 'Monaco', 3.337); --4
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Circuit Gilles Villeneuve',  'Canada', 4.361); --5
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Indianapolis Motor Speedway',  'USA', 4.192); --6
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Circuit de Nevers Magny-Cours',  'France', 4.411); --7
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Silverstone',  'Britain', 5.891); --8
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Nurburgring',  'Germany', 5.148 ); --9
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Hungaroring',  'Hungary', 4.381); --10
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Istanbul Park',  'Turkey', 5.338); --11
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Autodromo Nazionale di Monza',  'Italy', 5.793); --12
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Circuit National de Francorchamps',  'Belgium', 7.004); --13
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Fuji International Speedway',  'Japan', 4.563); --14
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Shanghai International Circuit',  'China', 5.451); --15
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Autodromo Jose Carlos Pace',  'Brazil', 4.309); --16
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Baku City Circuit', 'Azerbaijan', 6.003);--17
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Red Bull Ring', 'Austria', 4.326);--18
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Marina Bay Street Circuit', 'Singapore', 5.065);--19
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Sochi Autodrom', 'Russia', 5.848);--20
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Suzuka International Racing Course',  'Japan', 5.807); --21
INSERT INTO Autodrome VALUES (autodrome_id.nextval, 'Circuit of the Americas','USA',5.513); --22

INSERT INTO Grand_prix VALUES (stage_id.nextval, 0, '2018 Formula 1 Rolex Australian Grand Prix', 58, TO_DATE('26/03/2018', 'DD/MM/YYYY')); --0
INSERT INTO Grand_prix VALUES (stage_id.nextval, 2, '2018 Formula 1 Gulf Air Bahrain Grand Prix', 57, TO_DATE('08/04/2018', 'DD/MM/YYYY')); --1
INSERT INTO Grand_prix VALUES (stage_id.nextval, 15, '2018 Formula 1 Heineken Chinese Grand Prix', 56, TO_DATE('15/04/2018', 'DD/MM/YYYY')); --2
INSERT INTO Grand_prix VALUES (stage_id.nextval, 17, 'Azerbaijan Grand Prix', 51, TO_DATE('29/04/2018', 'DD/MM/YYYY')); --3
INSERT INTO Grand_prix VALUES (stage_id.nextval, 3, '2018 Formula 1 Gran Premio De España Pirelli', 66, TO_DATE('13/05/2018', 'DD/MM/YYYY')); --4
INSERT INTO Grand_prix VALUES (stage_id.nextval, 4, 'Grand Prix de Monaco', 78 , TO_DATE('27/05/2018', 'DD/MM/YYYY')); --5
INSERT INTO Grand_prix VALUES (stage_id.nextval, 5, 'Grand Prix du Canada', 70, TO_DATE('10/06/2018', 'DD/MM/YYYY')); --6
INSERT INTO Grand_prix VALUES (stage_id.nextval, 7, 'Grand Prix de France', 70, TO_DATE('24/06/2018', 'DD/MM/YYYY')); --7
INSERT INTO Grand_prix VALUES (stage_id.nextval, 18, 'Grober Preis von Osterreich', 71, TO_DATE('01/07/2018', 'DD/MM/YYYY')); --8
INSERT INTO Grand_prix VALUES (stage_id.nextval, 8, 'British Grand Prix', 52, TO_DATE('08/07/2018', 'DD/MM/YYYY')); --9
INSERT INTO Grand_prix VALUES (stage_id.nextval, 9, 'Grober Preis von Deutschland', 73, TO_DATE('22/07/2018', 'DD/MM/YYYY')); --10
INSERT INTO Grand_prix VALUES (stage_id.nextval, 10, 'Magyar Nagydij', 70, TO_DATE('29/08/2018', 'DD/MM/YYYY')); --11
INSERT INTO Grand_prix VALUES (stage_id.nextval, 13, 'Belgian Grand Prix', 44, TO_DATE('26/09/2018', 'DD/MM/YYYY')); --12
INSERT INTO Grand_prix VALUES (stage_id.nextval, 12, 'Gran Premio d’Italia', 53, TO_DATE('02/11/2018', 'DD/MM/YYYY')); --13
INSERT INTO Grand_prix VALUES (stage_id.nextval, 19, 'Singapore Grand Prix', 61, TO_DATE('10/12/2018', 'DD/MM/YYYY')); --14
INSERT INTO Grand_prix VALUES (stage_id.nextval, 20, 'VTB Russian Grand Prix', 53, TO_DATE('18/12/2018', 'DD/MM/YYYY')); --15
INSERT INTO Grand_prix VALUES (stage_id.nextval, 21, 'Japanese Grand Prix', 67, TO_DATE('29/12/2018', 'DD/MM/YYYY')); --16

INSERT INTO Racer VALUES (racer_id.nextval, 'Fernando', 'Alonso', 'Spain'); --0
INSERT INTO Racer VALUES (racer_id.nextval, 'Lewis', 'Hamilton', 'Britain'); --1
INSERT INTO Racer VALUES (racer_id.nextval, 'Giancarlo', 'Fisichella', 'Italy'); --2
INSERT INTO Racer VALUES (racer_id.nextval, 'Heikki', 'Kovalainen', 'Finland'); --3
INSERT INTO Racer VALUES (racer_id.nextval, 'Felipe', 'Massa', 'Brazil'); --4
INSERT INTO Racer VALUES (racer_id.nextval, 'Kimi', 'Raikkonen', 'Finland'); --5
INSERT INTO Racer VALUES (racer_id.nextval, 'Jenson', 'Button', 'Britain'); --6
INSERT INTO Racer VALUES (racer_id.nextval, 'Rubens', 'Barrichello', 'Brazil'); --7
INSERT INTO Racer VALUES (racer_id.nextval, 'Nick', 'Heidfeld', 'Germany'); --8
INSERT INTO Racer VALUES (racer_id.nextval, 'Robert', 'Kubica', 'Poland'); --9
INSERT INTO Racer VALUES (racer_id.nextval, 'Sebastian', 'Vettel', 'Germany'); --10
INSERT INTO Racer VALUES (racer_id.nextval, 'Ralph', 'Schumacher', 'Germany'); --11
INSERT INTO Racer VALUES (racer_id.nextval, 'Jarno', 'Trulli', 'Italy'); --12
INSERT INTO Racer VALUES (racer_id.nextval, 'David', 'Coulthard', 'Britain'); --13
INSERT INTO Racer VALUES (racer_id.nextval, 'Mark', 'Webber', 'Australia'); --14
INSERT INTO Racer VALUES (racer_id.nextval, 'Nico', 'Rosberg', 'Germany'); --15
INSERT INTO Racer VALUES (racer_id.nextval, 'Alexander', 'Wurz', 'Austria'); --16
INSERT INTO Racer VALUES (racer_id.nextval, 'Kazuki', 'Nakajima', 'Japan'); --17
INSERT INTO Racer VALUES (racer_id.nextval, 'Vitantonio', 'Liuzzi', 'Italy'); --18
INSERT INTO Racer VALUES (racer_id.nextval, 'Scott', 'Spid', 'USA'); --19
INSERT INTO Racer VALUES (racer_id.nextval, 'Adrian', 'Sutil', 'Germany'); --20
INSERT INTO Racer VALUES (racer_id.nextval, 'Christian', 'Albers', 'Netherlands'); --21
INSERT INTO Racer VALUES (racer_id.nextval, 'Marcus', 'Winkelhock', 'Germany'); --22
INSERT INTO Racer VALUES (racer_id.nextval, 'Sakon', 'Yamamoto', 'Japan'); --23
INSERT INTO Racer VALUES (racer_id.nextval, 'Takuma', 'Sato', 'Japan'); --24
INSERT INTO Racer VALUES (racer_id.nextval, 'Anthony', 'Davidson', 'Britain'); --25
INSERT INTO Racer VALUES (racer_id.nextval, 'Valtteri', 'Bottas', 'Finland'); --26
INSERT INTO Racer VALUES (racer_id.nextval, 'Max', 'Verstappen', 'Netherlands'); --27
INSERT INTO Racer VALUES (racer_id.nextval, 'Daniel', 'Ricciardo', 'Australia'); --28
INSERT INTO Racer VALUES (racer_id.nextval, 'Kevin', 'Magnussen', 'Denmark'); --29
INSERT INTO Racer VALUES (racer_id.nextval, 'Esteban', 'Okon', 'France'); --30
INSERT INTO Racer VALUES (racer_id.nextval, 'Carlos', 'Sainz-ml.', 'Spain'); --31
INSERT INTO Racer VALUES (racer_id.nextval, 'Romain', 'Grosjean', 'France'); --32
INSERT INTO Racer VALUES (racer_id.nextval, 'Pierre', 'Gasly', 'France'); --33
INSERT INTO Racer VALUES (racer_id.nextval, 'Charles', 'Leclerc', 'Monaco'); --34
INSERT INTO Racer VALUES (racer_id.nextval, 'Stoffel', 'Vandorn', 'Belgium'); --35
INSERT INTO Racer VALUES (racer_id.nextval, 'Lance', 'Stroll', 'Canada'); --36
INSERT INTO Racer VALUES (racer_id.nextval, 'Marcus', 'Eriksson', 'Sweden'); --37
INSERT INTO Racer VALUES (racer_id.nextval, 'Brandon', 'Hartley', 'new Zealand'); --38
INSERT INTO Racer VALUES (racer_id.nextval, 'Sergey', 'Sirotkin', 'Russia'); --39
INSERT INTO Racer VALUES (racer_id.nextval, 'Nico', 'Hulkenberg', 'Germany'); --40

INSERT INTO Racer_Fines VALUES (32, 21);
INSERT INTO Racer_Fines VALUES (32, 10);
INSERT INTO Racer_Fines VALUES (32, 11);
INSERT INTO Racer_Fines VALUES (32, 13);
INSERT INTO Racer_Fines VALUES (32, 10);
INSERT INTO Racer_Fines VALUES (27, 22);
INSERT INTO Racer_Fines VALUES (27, 19);
INSERT INTO Racer_Fines VALUES (27, 23);
INSERT INTO Racer_Fines VALUES (27, 14);
INSERT INTO Racer_Fines VALUES (27, 23);
INSERT INTO Racer_Fines VALUES (37, 7);
INSERT INTO Racer_Fines VALUES (37, 3);
INSERT INTO Racer_Fines VALUES (37, 14);
INSERT INTO Racer_Fines VALUES (39, 6);
INSERT INTO Racer_Fines VALUES (39, 8);
INSERT INTO Racer_Fines VALUES (39, 9);
INSERT INTO Racer_Fines VALUES (36, 18);
INSERT INTO Racer_Fines VALUES (36, 2);
INSERT INTO Racer_Fines VALUES (36, 9);
INSERT INTO Racer_Fines VALUES (38, 6);
INSERT INTO Racer_Fines VALUES (38, 4);
INSERT INTO Racer_Fines VALUES (33, 5);
INSERT INTO Racer_Fines VALUES (33, 8);
INSERT INTO Racer_Fines VALUES (40, 20);
INSERT INTO Racer_Fines VALUES (40, 1);
INSERT INTO Racer_Fines VALUES (35, 21);

INSERT INTO Bolide VALUES (bolide_id.nextval, 'Pirelli', 'Mercedes'); --0
INSERT INTO Bolide VALUES (bolide_id.nextval, 'Pirelli', 'Ferrari'); --1
INSERT INTO Bolide VALUES (bolide_id.nextval, 'Pirelli', 'Renault'); --2
INSERT INTO Bolide VALUES (bolide_id.nextval, 'Pirelli', 'Honda'); --3

INSERT INTO Team VALUES (team_id.nextval, 'McLaren F1 Team', 'Britain', 'Woking'); --0
INSERT INTO Team VALUES (team_id.nextval, 'Renault Sport Formula 1 Team', 'Britain', 'Enstone'); --1
INSERT INTO Team VALUES (team_id.nextval, 'Scuderia Ferrari', 'Italy', 'Maranello'); --2
INSERT INTO Team VALUES (team_id.nextval, 'Honda', 'Italy', 'Faenza'); --3
INSERT INTO Team VALUES (team_id.nextval, 'Alfa Romeo Sauber F1 Team', 'Switzerland', 'Hinwill'); --4
INSERT INTO Team VALUES (team_id.nextval, 'Toyota', 'Germany', 'Cologne' ); --5
INSERT INTO Team VALUES (team_id.nextval, 'Aston Martin Red Bull Racing', 'Britain', 'Milton Keynes'); --6
INSERT INTO Team VALUES (team_id.nextval, 'Williams Martini Racing', 'Britain', 'Grove'); --7
INSERT INTO Team VALUES (team_id.nextval, 'Red Bull Toro Rosso Honda', 'Italy', 'Faenza'); --8
INSERT INTO Team VALUES (team_id.nextval, 'Racing Point Force India F1 Team', 'Britain', 'Silverstone'); --9
INSERT INTO Team VALUES (team_id.nextval, 'Super Aguri', 'Britain', 'Oxfordshire'); --10
INSERT INTO Team VALUES (team_id.nextval, 'Mercedes AMG Petronas F1 Team', 'Britain', 'Brakly'); --11
INSERT INTO Team VALUES (team_id.nextval, 'Haas F1 Team', 'USA', 'Cannapolice'); --12

INSERT INTO Team_Bolide VALUES (11, 0);
INSERT INTO Team_Bolide VALUES (2, 1);
INSERT INTO Team_Bolide VALUES (6, 2);
INSERT INTO Team_Bolide VALUES (1, 2);
INSERT INTO Team_Bolide VALUES (12, 1);
INSERT INTO Team_Bolide VALUES (0, 2);
INSERT INTO Team_Bolide VALUES (9, 0);
INSERT INTO Team_Bolide VALUES (8, 3);
INSERT INTO Team_Bolide VALUES (4, 1);
INSERT INTO Team_Bolide VALUES (7, 0);
INSERT INTO Team_Bolide VALUES (4, 3);
INSERT INTO Team_Bolide VALUES (2, 3);

INSERT INTO Racer_Result VALUES (result_id.nextval, 1, 0, 1, '0', 2, 5378319);
INSERT INTO Racer_Result VALUES (result_id.nextval, 26, 0, 11, '0', 8, 5407622);
INSERT INTO Racer_Result VALUES (result_id.nextval, 10, 0, 2, '0', 1, 5373283);
INSERT INTO Racer_Result VALUES (result_id.nextval, 5, 0, 2, '0', 3, 5379592);
INSERT INTO Racer_Result VALUES (result_id.nextval, 28, 0, 6, '1', 4, 5380352);
INSERT INTO Racer_Result VALUES (result_id.nextval, 27, 0, 6, '0', 6, 5402228);
INSERT INTO Racer_Result VALUES (result_id.nextval, 40, 0, 1, '0', 7, 5405954);
INSERT INTO Racer_Result VALUES (result_id.nextval, 31, 0, 1, '0', 10, 5419005);
INSERT INTO Racer_Result VALUES (result_id.nextval, 32, 0, 12, '0', 0, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 29, 0, 12, '0', 0, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 35, 0, 0, '0', 9, 5408204);
INSERT INTO Racer_Result VALUES (result_id.nextval, 0, 0, 0, '0', 5, 5401169);
INSERT INTO Racer_Result VALUES (result_id.nextval, 15, 0, 9, '0', 11, 5420100);
INSERT INTO Racer_Result VALUES (result_id.nextval, 30, 0, 9, '0', 12, 5433561);
INSERT INTO Racer_Result VALUES (result_id.nextval, 33, 0, 8, '0', 0, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 38, 0, 8, '0', 15, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 37, 0, 4, '0', 0, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 34, 0, 4, '0', 13, 5449042);
INSERT INTO Racer_Result VALUES (result_id.nextval, 36, 0, 7, '0', 14, 5451571);
INSERT INTO Racer_Result VALUES (result_id.nextval, 39, 0, 7, '0', 0, NULL);

INSERT INTO Racer_Result VALUES (result_id.nextval, 26, 1, 11, '0', 2, 5522639);
INSERT INTO Racer_Result VALUES (result_id.nextval, 10, 1, 2, '0', 1, 5521940);
INSERT INTO Racer_Result VALUES (result_id.nextval, 5, 1, 2, '0', 0, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 28, 1, 6, '0', 0, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 27, 1, 6, '0', 0, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 40, 1, 1, '0', 6, 5620964);
INSERT INTO Racer_Result VALUES (result_id.nextval, 31, 1, 1, '0', 11, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 32, 1, 12, '0', 5, 5596986);
INSERT INTO Racer_Result VALUES (result_id.nextval, 29, 1, 12, '0', 13, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 35, 1, 0, '0', 8, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 0, 1, 0, '0', 7, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 15, 1, 9, '0', 16, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 30, 1, 9, 0, 10, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 33, 1, 8, 1, 4, 5584174);
INSERT INTO Racer_Result VALUES (result_id.nextval, 38, 1, 8, 0, 17, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 37, 1, 4, 0, 9, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 34, 1, 4, 0, 12, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 36, 1, 7, 0, 14, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 39, 1, 7, 0, 15, NULL);

INSERT INTO Racer_Result VALUES (result_id.nextval, 1, 2, 11, 0, 4, 5753365);
INSERT INTO Racer_Result VALUES (result_id.nextval, 26, 2, 11, 0, 2,5745274);
INSERT INTO Racer_Result VALUES (result_id.nextval, 10, 2, 2, 0, 8, 5771666);
INSERT INTO Racer_Result VALUES (result_id.nextval, 5, 2, 2, 0, 3, 5746017);
INSERT INTO Racer_Result VALUES (result_id.nextval, 28, 2, 6, 1, 1, 5736380);
INSERT INTO Racer_Result VALUES (result_id.nextval, 27, 2, 6, 0, 5, 5756816);
INSERT INTO Racer_Result VALUES (result_id.nextval, 40, 2, 1, 0, 6, 5757432);
INSERT INTO Racer_Result VALUES (result_id.nextval, 31, 2, 1, 0, 9, 5772143);
INSERT INTO Racer_Result VALUES (result_id.nextval, 32, 2, 12, 0, 10, 5775974);
INSERT INTO Racer_Result VALUES (result_id.nextval, 29, 2, 12, 0, 17, 5801676);
INSERT INTO Racer_Result VALUES (result_id.nextval, 35, 2, 0, 0, 13, 5785753);
INSERT INTO Racer_Result VALUES (result_id.nextval, 0, 2, 0, 0, 7, 5767019);
INSERT INTO Racer_Result VALUES (result_id.nextval, 15, 2, 9, 0, 12, 5781105);
INSERT INTO Racer_Result VALUES (result_id.nextval, 30, 2, 9, 0, 11, 5780430);
INSERT INTO Racer_Result VALUES (result_id.nextval, 33, 2, 8, 0, 18, 5802710);
INSERT INTO Racer_Result VALUES (result_id.nextval, 38, 2, 8, 0, 20, NULL);
INSERT INTO Racer_Result VALUES (result_id.nextval, 37, 2, 4, 0, 16, 5798984);
INSERT INTO Racer_Result VALUES (result_id.nextval, 34, 2, 4, 0, 19, 5815446);
INSERT INTO Racer_Result VALUES (result_id.nextval, 36, 2, 7, 0, 14, 5791870);
INSERT INTO Racer_Result VALUES (result_id.nextval, 39, 2, 7, 0, 15, 5794621);
