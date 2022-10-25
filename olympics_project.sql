CREATE TABLE if not exists Countries
( 
	ID serial PRIMARY KEY,
	CountryName varchar(55),
	Continent varchar(55)
);

CREATE TABLE if not exists Players
(
	ID serial PRIMARY KEY,
	Name varchar(55),
	Age INT,
	Weight FLOAT,
	DisciplineID INT,
	CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID)
);

CREATE TABLE if not exists SportCategories
(
	ID serial PRIMARY KEY,
	CategoryName varchar(55) UNIQUE
);

CREATE TABLE if not exists Sports
(
	ID serial PRIMARY KEY,
	SportName varchar(55),
	isTeamSport BOOLEAN NOT NULL,
	isSummerSport BOOLEAN NOT NULL,
	CategoryID INT,
	FOREIGN KEY (CategoryID) REFERENCES SportCategories(ID)
);

CREATE TABLE if not exists Disciplines
(
	ID serial PRIMARY KEY,
	DisciplineName varchar(55),
	SportsID INT,
	FOREIGN KEY (SportsID) REFERENCES Sports(ID)
);

CREATE TABLE if not exists Medals
(
	ID serial PRIMARY KEY,
	TypeMedal varchar(55),
	DisciplineID INT,
	PlayerID INT,
	FOREIGN KEY (DisciplineID) REFERENCES Disciplines(ID),
	FOREIGN KEY (PlayerID) REFERENCES Players(ID)
);

INSERT INTO countries (countryname, continent) 
VALUES ('Serbia', 'Europe'),
		('Sweeden', 'Europe');
INSERT INTO players ("name", age, weight, disciplineid, countryid)
VALUES ('Stole', '25', '79', 1, 1),
		('Dejan', '23', '82', 2, 2);
INSERT INTO sportcategories (categoryname)
VALUES ('Football'),
		('Basketball');
INSERT INTO sports (sportname, isteamsport, issummersport, categoryid)
VALUES ('Football', 'True', 'False', 1),
		('Basketball', 'True', 'False', 2);
INSERT INTO disciplines (disciplinename, sportsid)
VALUES ('leading', 1),
		('training', 2);
INSERT INTO medals (typemedal, disciplineid, playerid)
VALUES ('Trophie', 1, 1),
		('MedalRibbon', 2, 2);