SET FOREIGN_KEY_CHECKS = 0; 

-- DROPS

DROP TABLE Staff;
DROP TABLE Salaried;
DROP TABLE Volunteer;
DROP TABLE SalariedStaffs;
DROP TABLE VolunteerStaffs;
DROP TABLE Official;
DROP TABLE Sponsor;
DROP TABLE TeamSponsor;
DROP TABLE TeamSponsorship;
DROP TABLE EventSponsor;
DROP TABLE EventSponsorShip;
DROP TABLE Team;
DROP TABLE Event;
DROP TABLE EventRound;
DROP TABLE Officiates;
DROP TABLE Competes;
DROP TABLE Sport;
DROP TABLE SportTypes;
DROP TABLE `Men'sDivision`;
DROP TABLE `Women'sDivision`;
DROP TABLE TeamSport;
DROP TABLE IndividualSport;
DROP TABLE Venue;
DROP TABLE VenueType;
DROP TABLE Athlete;
DROP TABLE Country;
DROP TABLE Results;
DROP TABLE Accommodation;
DROP TABLE AccommodationTypes;
DROP TABLE Room;
DROP TABLE Transportation;

-- CREATES

CREATE TABLE IF NOT EXISTS Staff (
    ID int, 
    Name VARCHAR (50) NOT NULL,
    LastName VARCHAR (50) NOT NULL,
    ContactNo VARCHAR(15),

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Salaried (
    StaffID int,

    PRIMARY KEY (StaffID)
);

CREATE TABLE IF NOT EXISTS Volunteer (
    StaffID int,

    PRIMARY KEY (StaffID)
);

CREATE TABLE IF NOT EXISTS SalariedStaffs (
    SalariedStaffID int NOT NULL,
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    EventVenueName VARCHAR (100) NOT NULL,
    HourlyWageEuros int,
    HoursWorked int DEFAULT 0,
    Role VARCHAR (50),

    PRIMARY KEY (SalariedStaffID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
);

CREATE TABLE IF NOT EXISTS VolunteerStaffs (
    VolunteerStaffID int NOT NULL,
    EventBeginTimeStamp TIME NOT NULL,
    EventEndTimeStamp Time NOT NULL,
    EventVenueName VARCHAR (100),
    HoursWorked int DEFAULT 0,
    Role varchar(50),
    
    PRIMARY KEY (VolunteerStaffID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
);

CREATE TABLE IF NOT EXISTS Official (
    ID int NOT NULL,
    Name VARCHAR (50),
    Role VARCHAR (50),
    AccommodationName VARCHAR (50),
    RoomNumber int,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Sponsor (
    Name VARCHAR(50) NOT NULL,
    Industry VARCHAR (50) NOT NULL,
    ContactNo BIGINT,

    PRIMARY KEY (Name)
);

CREATE TABLE IF NOT EXISTS TeamSponsor (
    SponsorName VARCHAR (100),
    
    PRIMARY KEY (SponsorName)
);

CREATE TABLE IF NOT EXISTS TeamSponsorship (
    TeamSponsorName VARCHAR (100) NOT NULL,
    TeamCountryName VARCHAR (100) NOT NULL,
    TeamSportID int NOT NULL,
    SponsorshipType varchar (50),
    ContractDate DATE,
    ContractAmount DECIMAL (10,2),

    PRIMARY KEY (TeamSponsorName, TeamCountryName, TeamSportID)
);

CREATE TABLE IF NOT EXISTS EventSponsor (
    SponsorName VARCHAR (100),

    PRIMARY KEY (SponsorName)
);

CREATE TABLE IF NOT EXISTS EventSponsorship (
    EventSponsorName VARCHAR (100) NOT NULL,
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    EventVenueName VARCHAR (100) NOT NULL,
    SponsorshipType VARCHAR (50),
    ContractDate DATE,
    ContractAmount DECIMAL (10, 2),

    PRIMARY KEY (EventSponsorName, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
);

CREATE TABLE IF NOT EXISTS Team (
    CountryName VARCHAR (100) NOT NULL UNIQUE,
    SportID int NOT NULL,

    PRIMARY KEY (CountryName, SportID)
);

CREATE TABLE IF NOT EXISTS Event (
    BeginTimeStamp TIMESTAMP NOT NULL,
    EndTimeStamp TIMESTAMP NOT NULL,
    VenueName VARCHAR (100),
    SportID int,

    PRIMARY KEY (BeginTimeStamp, EndTimeStamp, VenueName)
);

CREATE TABLE IF NOT EXISTS EventRound (
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    EventVenueName VARCHAR (100),
    Round VARCHAR (100) NOT NULL,

    PRIMARY KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, Round)
);

CREATE TABLE IF NOT EXISTS Officiates (
    OfficialID int NOT NULL,
    EventBeginTimeStamp TIMESTAMP NOT NUll,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    EventVenueName VARCHAR (100),

    PRIMARY KEY (OfficialID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
);

CREATE TABLE IF NOT EXISTS Competes (
    CountryName VARCHAR(100),
    SportID int NOT NULL,
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    EventVenueName VARCHAR(50),

    PRIMARY KEY (CountryName, SportID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
);

CREATE TABLE IF NOT EXISTS Sport (
    ID int NOT NULL,
    Name VARCHAR(50),

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS SportTypes (
    SportID int NOT NULL,
    SportType VARCHAR(100) NOT NULL,

    PRIMARY KEY (sportID, sportType)
);

CREATE TABLE IF NOT EXISTS `Men'sDivision` (
    ID int NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS `Women'sDivision` (
    ID int NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS TeamSport (
    ID int NOT NULL,
    MinAthletes int,
    MaxAthletes int,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS IndividualSport (
    ID int NOT NULL,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Venue (
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(100),
    MaxCapacity INT NOT NULL,

    PRIMARY KEY (Name)
);

CREATE TABLE IF NOT EXISTS VenueType (
    VenueName VARCHAR(100) NOT NULL,
    Type VARCHAR(50) NOT NULL,

    PRIMARY KEY (VenueName, Type)
);

CREATE TABLE IF NOT EXISTS Athlete (
    ID int NOT NULL,
    FirstName VARCHAR (50),
    LastName VARCHAR(50),
    WeightKg FLOAT,
    Sex VARCHAR(10),
    Birthday DATE,
    CountryName VARCHAR (100),
    SportID int,
    AccommodationName VARCHAR(100),
    RoomNumber int,
    TeamName VARCHAR(100),

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS Country (
    Name VARCHAR(100) NOT NULL,
    NumGolds int,
    NumSilver int,
    NumBronze int,

    PRIMARY KEY (Name)
);

CREATE TABLE IF NOT EXISTS Results (
    CountryName VARCHAR(100),
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    EventVenueName VARCHAR (100),
    Result VARCHAR(50),

    PRIMARY KEY (CountryName, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
);

CREATE TABLE IF NOT EXISTS Accommodation (
    Name VARCHAR (100) NOT NULL,
    Address VARCHAR (100),
    MaxOccupancy int,

    PRIMARY KEY (Name)
);

CREATE TABLE IF NOT EXISTS AccommodationTypes (
    AccommodationName VARCHAR(100) NOT NULL,
    AccommodationTypes VARCHAR(50) NOT NULL,

    PRIMARY KEY (AccommodationName, AccommodationTypes)
);

CREATE TABLE IF NOT EXISTS Room (
    Number int NOT NULL,
    AccommodationName VARCHAR(100),
    MaxOccupancy int,

    PRIMARY KEY (AccommodationName, Number)
);

CREATE TABLE IF NOT EXISTS Transportation (
    AccommodationName VARCHAR(100) NOT NULL,
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    VenueName VARCHAR(100) NOT NULL,
    Type VARCHAR (100),
    MaxCapacity int,

    PRIMARY KEY (AccommodationName, EventBeginTimeStamp, EventEndTimeStamp, VenueName, Type, MaxCapacity)
);

-- CONTRAINTS

ALTER TABLE Salaried
ADD CONSTRAINT FK_SalariedStaffID FOREIGN KEY (StaffID) REFERENCES Staff (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Volunteer
ADD CONSTRAINT FK_VolunteerStaffID FOREIGN KEY (StaffID) REFERENCES Staff (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE SalariedStaffs
ADD CONSTRAINT FK_SalariedStaffsSalariedStaffID FOREIGN KEY (SalariedStaffID) REFERENCES Salaried (StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_SalariedStaffsEvent FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE VolunteerStaffs
ADD CONSTRAINT FK_VolunteerStaffsVolunteerStaffID FOREIGN KEY (VolunteerStaffID) REFERENCES Volunteer (StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_VolunteerStaffsEvent FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Official
ADD CONSTRAINT FK_OfficialRoom FOREIGN KEY (AccommodationName, RoomNumber) REFERENCES Room (AccommodationName, Number) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TeamSponsor
ADD CONSTRAINT FK_TeamSponsorSponsorName FOREIGN KEY (SponsorName) REFERENCES Sponsor (Name) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TeamSponsorship
ADD CONSTRAINT FK_TeamSponsorshipTeamSponsorName FOREIGN KEY (TeamSponsorName) REFERENCES TeamSponsor (SponsorName) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_TeamSponsorshipTeam FOREIGN KEY (TeamCountryName, TeamSportID) REFERENCES  Team (CountryName, SportID) ON UPDATE CASCADE ON  DELETE CASCADE;

ALTER TABLE EventSponsor
ADD CONSTRAINT FK_EventSponsorSponsorName FOREIGN KEY (SponsorName) REFERENCES Sponsor (Name) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE EventSponsorship
ADD CONSTRAINT FK_EventSponsorshipEventSponsorName FOREIGN KEY (EventSponsorName) REFERENCES EventSponsor (SponsorName) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_EventSponsorshipEvent FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Event
ADD CONSTRAINT FK_EventSportID FOREIGN KEY (SportID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_EventVenueName FOREIGN KEY (VenueName) REFERENCES Venue (Name) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE EventRound
ADD CONSTRAINT FK_EventRoundEvent FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Officiates
ADD CONSTRAINT FK_OfficiatesOfficial FOREIGN KEY (OfficialID) REFERENCES Official (ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_OfficiatesEvent FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Competes
ADD CONSTRAINT FK_CompetesCountryName FOREIGN KEY (CountryName) REFERENCES Country (Name) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_CompetesSportID FOREIGN KEY (SportID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_CompetesBeginTimeStamp FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE SportTypes
ADD CONSTRAINT FK_SportTypesSportID FOREIGN KEY (SportID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Men'sDivision`
ADD CONSTRAINT `FK_Men'sDivisionSportID` FOREIGN KEY (ID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE `Women'sDivision`
ADD CONSTRAINT `FK_Women'sDivisionSportID` FOREIGN KEY (ID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE TeamSport
ADD CONSTRAINT FK_TeamSportID FOREIGN KEY (ID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE IndividualSport
ADD CONSTRAINT FK_IndividualSportID FOREIGN KEY (ID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE VenueType
ADD CONSTRAINT FK_VenueType FOREIGN KEY (VenueName) REFERENCES Venue (Name) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Athlete
ADD CONSTRAINT FK_AthleteCountryName FOREIGN KEY (CountryName) REFERENCES Country (Name) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_AthleteSportID FOREIGN KEY (SportID) REFERENCES Sport (ID) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_AthleteAccommodationName FOREIGN KEY (AccommodationName, RoomNumber) REFERENCES Room (AccommodationName, Number) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Results
ADD CONSTRAINT FK_ResultsCountryName FOREIGN KEY (CountryName) REFERENCES Country (Name) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_ResultsEventBeginTimeStamp FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE AccommodationTypes
ADD CONSTRAINT FK_AccommodationTypesAccommodationName FOREIGN KEY (AccommodationName) REFERENCES Accommodation (Name) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Room
ADD CONSTRAINT FK_RoomAccommodationName FOREIGN KEY (AccommodationName) REFERENCES Accommodation (Name) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE Transportation
ADD CONSTRAINT FK_TransportationAccommodationName FOREIGN KEY (AccommodationName) REFERENCES Accommodation (Name) ON UPDATE CASCADE ON DELETE CASCADE,
ADD CONSTRAINT FK_TransportationEventBeginTimeStamp FOREIGN KEY (EventBeginTimeStamp, EventEndTimeStamp, VenueName) REFERENCES Event (BeginTimeStamp, EndTimeStamp, VenueName) ON UPDATE CASCADE ON DELETE CASCADE;

-- INSERTS

INSERT INTO Athlete (ID, FirstName, LastName, WeightKg, Sex, Birthday, CountryName, SportID, AccommodationName, RoomNumber)
VALUES
(1, 'John', 'Doe', 75.5, 'Male', '1990-05-12', 'USA', 101, 'Olympic Village', 202),
(2, 'Anna', 'Smith', 63.7, 'Female', '1992-09-22', 'Canada', 103, 'Athletes Inn', 105),
(3, 'Liu', 'Wang', 68.0, 'Male', '1988-07-01', 'China', 103, 'Olympic Village', 302),
(4, 'Maria', 'Garcia', 56.3, 'Female', '1994-11-15', 'Mexico', 104, 'Athletes Inn', 110),
(5, 'James', 'Taylor', 81.2, 'Male', '1991-03-15', 'Canada', 102, 'Olympic Village', 210),
(6, 'Daniel', 'Brown', 74.5, 'Male', '1993-07-18', 'Canada', 102, 'Olympic Village', 211),
(7, 'Ryan', 'Wilson', 89.6, 'Male', '1992-12-05', 'Canada', 102, 'Olympic Village', 212),
(8, 'Matthew', 'Moore', 70.3, 'Male', '1995-09-10', 'Canada', 102, 'Athletes Inn', 213),
(9, 'Andrew', 'Clark', 77.8, 'Male', '1990-04-21', 'Canada', 102, 'Athletes Inn', 214),
(10, 'Joshua', 'Young', 85.4, 'Male', '1987-06-30', 'Canada', 102, 'Olympic Village', 215),
(11, 'David', 'Hall', 79.9, 'Male', '1989-08-19', 'Canada', 102, 'Olympic Village', 216),
(12, 'Ethan', 'Walker', 67.5, 'Male', '1994-03-02', 'Canada', 102, 'Olympic Village', 217),
(13, 'Logan', 'King', 90.1, 'Male', '1996-02-14', 'Canada', 102, 'Athletes Inn', 218),
(14, 'Luke', 'Hughes', 72.7, 'Male', '1991-11-25', 'Canada', 102, 'Olympic Village', 219),
(15, 'Pierre', 'Martin', 78.4, 'Male', '1993-03-15', 'France', 101, 'Olympic Village', 301),
(16, 'Jean', 'Dupont', 82.1, 'Male', '1990-07-22', 'France', 101, 'Olympic Village', 302),
(17, 'Claude', 'Durand', 75.3, 'Male', '1992-01-12', 'France', 101, 'Olympic Village', 303),
(18, 'Luc', 'Bernard', 79.8, 'Male', '1989-10-05', 'France', 101, 'Athletes Inn', 201),
(19, 'Antoine', 'Rousseau', 73.5, 'Male', '1995-04-25', 'France', 101, 'Athletes Inn', 202),
(20, 'Nicolas', 'Moreau', 85.0, 'Male', '1987-11-19', 'France', 101, 'Olympic Village', 304),
(21, 'Henri', 'Leclerc', 76.9, 'Male', '1991-08-13', 'France', 101, 'Athletes Inn', 203),
(22, 'Julien', 'Petit', 70.4, 'Male', '1996-09-07', 'France', 101, 'Olympic Village', 305),
(23, 'Victor', 'Girard', 77.6, 'Male', '1988-06-01', 'France', 101, 'Athletes Inn', 204),
(24, 'Arnaud', 'Blanc', 80.2, 'Male', '1994-12-20', 'France', 101, 'Olympic Village', 306),
(25, 'Michel', 'Lemoine', 80.5, 'Male', '1992-01-25', 'France', 101, 'Olympic Village', 307),
(26, 'Julien', 'Brunet', 76.2, 'Male', '1990-03-14', 'France', 101, 'Olympic Village', 308),
(27, 'Geoffrey', 'Martin', 85.1, 'Male', '1993-11-10', 'France', 101, 'Athletes Inn', 205),
(28, 'Damien', 'Meyer', 79.7, 'Male', '1991-06-20', 'France', 101, 'Olympic Village', 309),
(29, 'Nicolas', 'Besson', 82.3, 'Male', '1994-05-22', 'France', 101, 'Athletes Inn', 206),
(30, 'Pierre', 'Lemoine', 77.4, 'Male', '1995-01-17', 'France', 101, 'Olympic Village', 310),
(31, 'Thibault', 'Martin', 88.6, 'Male', '1992-07-05', 'France', 101, 'Olympic Village', 311),
(32, 'François', 'Pires', 84.2, 'Male', '1993-04-03', 'France', 101, 'Athletes Inn', 207),
(33, 'Louis', 'Girard', 81.8, 'Male', '1991-09-15', 'France', 101, 'Olympic Village', 312),
(34, 'Olivier', 'Dupuis', 78.3, 'Male', '1994-12-10', 'France', 101, 'Athletes Inn', 208);


INSERT INTO Country (Name, NumGolds, NumSilver, NumBronze)
VALUES
('USA', 25, 30, 20),
('Canada', 15, 20, 25),
('China', 28, 25, 30),
('Mexico', 5, 10, 15),
('Germany', 18, 22, 24),
('Japan', 12, 18, 20),
('Russia', 22, 27, 19),
('Australia', 10, 12, 16),
('France', 17, 15, 19),
('Brazil', 8, 12, 10);

INSERT INTO Staff (ID, Name, LastName, ContactNo)
VALUES
(1, 'Michael', 'Jordan', '123-456-7890'),
(2, 'Sarah', 'Connor', '987-654-3210'),
(3, 'Bruce', 'Wayne', '555-123-4567'),
(4, 'Clark', 'Kent', '555-765-4321'),
(5, 'David', 'Miller', '123-456-7890'),
(6, 'Sophia', 'Wilson', '234-567-8901'),
(7, 'Ethan', 'Moore', '345-678-9012'),
(8, 'Olivia', 'Taylor', '456-789-0123'),
(9, 'Lucas', 'Anderson', '567-890-1234'),
(10, 'Amelia', 'Thomas', '678-901-2345'),
(11, 'Mason', 'Jackson', '789-012-3456'),
(12, 'Isabella', 'White', '890-123-4567'),
(13, 'Sebastian', 'Harris', '901-234-5678');


INSERT INTO Salaried (StaffID)
VALUES
(1),
(2),
(7),
(8),
(9),
(10),
(11),
(12);

INSERT INTO Volunteer (StaffID)
VALUES
(3),
(4),
(5),
(6),
(13);

INSERT INTO Sponsor (Name, Industry, ContactNo)
VALUES
('Nike', 'Sportswear', 1234567890),
('Adidas', 'Sportswear', 2345678901),
('Coca-Cola', 'Beverages', 3456789012),
('Visa', 'Finance', 4567890123),
('Pepsi', 'Beverages', 5678901234),
('Samsung', 'Technology', 6789012345),
('Toyota', 'Automotive', 7890123456),
('Rolex', 'Luxury Goods', 8901234567),
('Huawei', 'Technology', 9012345678),
('BNP Paribas', 'Finance', 1230984567),
('GlobalFit', 'Fitness', 1234567890),
('HealthFirst', 'Healthcare', 9876543210),
('PrimeAthletics', 'Sports Equipment', 2345678901),
('EnduraSports', 'Apparel', 3456789012),
('PeakPerformance', 'Nutrition', 4567890123),
('AthleteX', 'Technology', 5678901234),
('ChampionGear', 'Sports Equipment', 6789012345),
('EliteTracks', 'Training Facilities', 7890123456),
('PowerFuel', 'Energy Drinks', 8901234567),
('RecoveryPro', 'Recovery Equipment', 9012345678);

INSERT INTO Event (BeginTimeStamp, EndTimeStamp, VenueName, SportID)
VALUES
('2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 101),
('2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 102),
('2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 104),
('2024-07-25 14:00:00', '2024-07-25 17:30:00', 'National Stadium', 101),
('2024-07-01 09:00:00', '2024-07-01 10:30:00', 'National Stadium', 101),
('2024-07-01 12:00:00', '2024-07-01 14:30:00', 'National Stadium', 102),
('2024-07-01 15:00:00', '2024-07-01 16:45:00', 'National Stadium', 103),
('2024-07-02 09:00:00', '2024-07-02 11:30:00', 'National Stadium', 104),
('2024-07-02 12:00:00', '2024-07-02 13:45:00', 'National Stadium', 101),
('2024-07-02 15:00:00', '2024-07-02 17:00:00', 'National Stadium', 102),
('2024-07-03 09:00:00', '2024-07-03 11:15:00', 'National Stadium', 103),
('2024-07-03 12:00:00', '2024-07-03 14:30:00', 'National Stadium', 104);

INSERT INTO SalariedStaffs (SalariedStaffID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, HourlyWageEuros, HoursWorked, Role)
VALUES
(1, '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 32, 4, 'Manager'),
(2, '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 30, 5, 'Coach'),
(1, '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 32, 4, 'Manager'),
(2, '2024-07-24 09:00:00', '2024-07-24 11:00:00', 'National Stadium', 30, 5, 'Coach'),
(5, '2024-07-25 15:00:00', '2024-07-25 17:00:00', 'Aquatics Center', 28, 6, 'Referee'),
(7, '2024-07-26 13:00:00', '2024-07-26 15:00:00', 'Gymnastics Arena', 32, 5, 'Manager'),
(8, '2024-07-27 16:00:00', '2024-07-27 18:00:00', 'National Stadium', 30, 5, 'Coach'),
(7, '2024-07-28 11:00:00', '2024-07-28 13:00:00', 'Gymnastics Arena', 25, 4, 'Manager'),
(9, '2024-07-29 14:00:00', '2024-07-29 16:00:00', 'Aquatics Center', 28, 5, 'Referee'),
(10, '2024-07-30 10:00:00', '2024-07-30 12:00:00', 'National Stadium', 32, 4, 'Manager'),
(8, '2024-07-30 10:00:00', '2024-07-30 12:00:00', 'National Stadium', 30, 4, 'Coach');

INSERT INTO VolunteerStaffs (VolunteerStaffID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, HoursWorked, Role)
VALUES
(3, '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 4, 'Assistant'),
(4, '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'National Stadium', 4, 'Coordinator'),
(5, '2024-07-24 09:00:00', '2024-07-24 11:00:00', 'National Stadium', 4, 'Assistant'),
(4, '2024-07-25 15:00:00', '2024-07-25 17:00:00', 'Aquatics Center', 4, 'Coordinator'),
(3, '2024-07-26 13:00:00', '2024-07-26 15:00:00', 'Gymnastics Arena', 4, 'Assistant'),
(13, '2024-07-27 16:00:00', '2024-07-27 18:00:00', 'National Stadium', 4, 'Coordinator'),
(5, '2024-07-28 11:00:00', '2024-07-28 13:00:00', 'Gymnastics Arena', 4, 'Assistant'),
(6, '2024-07-29 14:00:00', '2024-07-29 16:00:00', 'Aquatics Center', 4, 'Coordinator'),
(5, '2024-07-30 10:00:00', '2024-07-30 12:00:00', 'National Stadium', 4, 'Assistant');

INSERT INTO Official (ID, Name, Role, AccommodationName, RoomNumber)
VALUES
(1, 'Charles Xavier', 'Referee', 'Olympic Village', 101),
(2, 'Diana Prince', 'Judge', 'Athletes Inn', 202),
(3, 'John Doe', 'Referee', 'Olympic Village', '201'),
(4, 'Jane Smith', 'Judge', 'Olympic Village', '202'),
(5, 'Michael Johnson', 'Referee', 'Olympic Village', '203'),
(6, 'Sarah Lee', 'Judge', 'Olympic Village', '204'),
(7, 'Chris White', 'Referee', 'Athletes Inn', '205'),
(8, 'Emily Brown', 'Judge', 'Olympic Village', '206'),
(9, 'David Green', 'Referee', 'Olympic Village', '207'),
(10, 'Laura Taylor', 'Judge', 'Olympic Village', '208');

INSERT INTO TeamSponsor (SponsorName)
VALUES
('Nike'),
('Adidas'),
('Coca-Cola'),
('Visa'),
('Pepsi'),
('Samsung'),
('Toyota'),
('Rolex'),
('Huawei'),
('BNP Paribas'),
('GlobalFit'),
('HealthFirst'),
('PrimeAthletics'),
('EnduraSports'),
('PeakPerformance'),
('AthleteX'),
('ChampionGear'),
('EliteTracks'),
('PowerFuel'),
('RecoveryPro');

INSERT INTO TeamSponsorship (TeamSponsorName, TeamCountryName, TeamSportID, SponsorshipType, ContractDate, ContractAmount)
VALUES
('Nike', 'France', 101, 'Apparel Sponsorship', '2023-01-15', 500000.00),
('Adidas', 'France', 101, 'Footwear Sponsorship', '2023-02-10', 450000.00),
('Coca-Cola', 'France', 101, 'Beverage Sponsorship', '2023-03-01', 400000.00),
('Visa', 'France', 101, 'Financial Sponsorship', '2023-04-20', 600000.00),
('Pepsi', 'France', 101, 'Beverage Sponsorship', '2023-05-30', 350000.00),
('Samsung', 'France', 101, 'Technology Sponsorship', '2023-06-15', 700000.00),
('Toyota', 'France', 101, 'Automotive Sponsorship', '2023-07-10', 800000.00),
('Rolex', 'France', 101, 'Luxury Sponsorship', '2023-08-05', 750000.00),
('Huawei', 'France', 101, 'Technology Sponsorship', '2023-09-12', 650000.00),
('BNP Paribas', 'France', 101, 'Financial Sponsorship', '2023-10-25', 550000.00),
('GlobalFit', 'USA', 103, 'Official Partner', '2023-01-15', 500000.00),
('HealthFirst', 'USA', 103, 'Medical Partner', '2023-02-10', 300000.00),
('PrimeAthletics', 'USA', 103, 'Equipment Provider', '2023-03-20', 250000.00),
('EnduraSports', 'USA', 103, 'Apparel Sponsor', '2023-04-05', 400000.00),
('PeakPerformance', 'USA', 103, 'Nutrition Partner', '2023-05-12', 350000.00),
('AthleteX', 'USA', 103, 'Technology Sponsor', '2023-06-01', 450000.00),
('ChampionGear', 'USA', 103, 'Gear Sponsor', '2023-07-15', 300000.00),
('EliteTracks', 'USA', 103, 'Facility Sponsor', '2023-08-08', 600000.00),
('PowerFuel', 'USA', 103, 'Energy Partner', '2023-09-25', 200000.00),
('RecoveryPro', 'USA', 103, 'Recovery Equipment Sponsor', '2023-10-18', 275000.00);

INSERT INTO Venue (name, address, maxCapacity)
VALUES
('National Stadium', '123 Olympic Blvd', 50000),
('Aquatics Center', '456 Water Way', 15000),
('Gymnastics Arena', '789 Balance Rd', 10000);

INSERT INTO Results (countryName, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, result)
VALUES
('USA', '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 'Gold'),
('Canada', '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 'Silver'),
('Mexico', '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 'Bronze');

INSERT INTO Accommodation (name, address, maxOccupancy)
VALUES
('Olympic Village', '1 Main St', 500),
('Athletes Inn', '2 Athlete Rd', 200);

INSERT INTO Sport (ID, Name)
VALUES
(101, 'Soccer'),
(102, 'Swimming'),
(103, 'Basketball'),
(104, 'Gymnastics');

INSERT INTO SportTypes (sportID, sportType)
VALUES
(101, '20m'),
(101, '30m');

INSERT INTO Transportation (AccommodationName, EventBeginTimeStamp, EventEndTimeStamp, venueName, Type, maxCapacity)
VALUES
('Olympic Village', '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 'Outdoor', 300),
('Athletes Inn', '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 'Indoor', 100),
('Olympic Village', '2024-07-25 14:00:00', '2024-07-25 17:00:00', 'National Stadium', 'Bus', 50),
('Olympic Village', '2024-07-25 14:00:00', '2024-07-25 17:00:00', 'National Stadium', 'Shuttle', 30),
('Olympic Village', '2024-07-25 14:00:00', '2024-07-25 17:00:00', 'National Stadium', 'Van', 20);

INSERT INTO Room (Number, AccommodationName, maxOccupancy)
VALUES
(202, 'Olympic Village', 4),
(105, 'Athletes Inn', 2),
(302, 'Olympic Village', 3),
(303, 'Athletes Inn', 2),
(204, 'Olympic Village', 4),
(107, 'Athletes Inn', 1),
(305, 'Olympic Village', 3),
(108, 'Athletes Inn', 2),
(401, 'Olympic Village', 4),
(206, 'Athletes Inn', 2),
(502, 'Olympic Village', 4);

INSERT INTO EventRound (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, Round)
VALUES
('2024-07-21 10:00:00', '2024-07-21 11:00:00', 'National Stadium', 'Quarterfinal'),
('2024-07-21 11:30:00', '2024-07-21 12:00:00', 'National Stadium', 'Semifinal'),
('2024-07-22 14:00:00', '2024-07-22 15:00:00', 'Aquatics Center', 'Final'),
('2024-07-24 09:00:00', '2024-07-24 10:00:00', 'National Stadium', 'Quarterfinal'),
('2024-07-24 10:30:00', '2024-07-24 11:00:00', 'National Stadium', 'Semifinal'),
('2024-07-25 15:00:00', '2024-07-25 16:00:00', 'Aquatics Center', 'Final'),
('2024-07-26 13:00:00', '2024-07-26 14:00:00', 'Gymnastics Arena', 'Quarterfinal'),
('2024-07-26 14:30:00', '2024-07-26 15:00:00', 'Gymnastics Arena', 'Semifinal'),
('2024-07-27 16:00:00', '2024-07-27 17:00:00', 'National Stadium', 'Quarterfinal'),
('2024-07-27 17:30:00', '2024-07-27 18:00:00', 'National Stadium', 'Semifinal'),
('2024-07-28 11:00:00', '2024-07-28 12:00:00', 'Gymnastics Arena', 'Final'),
('2024-07-29 14:00:00', '2024-07-29 15:00:00', 'Aquatics Center', 'Quarterfinal'),
('2024-07-29 15:30:00', '2024-07-29 16:00:00', 'Aquatics Center', 'Semifinal'),
('2024-07-30 10:00:00', '2024-07-30 11:00:00', 'National Stadium', 'Final');

INSERT INTO Officiates (OfficialID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
VALUES
(1, '2024-07-01 15:00:00', '2024-07-01 16:45:00', 'National Stadium'),
(3, '2024-07-01 15:00:00', '2024-07-01 16:45:00', 'National Stadium'),
(5, '2024-07-01 15:00:00', '2024-07-01 16:45:00', 'National Stadium'),
(7, '2024-07-01 15:00:00', '2024-07-01 16:45:00', 'National Stadium'),
(9, '2024-07-01 15:00:00', '2024-07-01 16:45:00', 'National Stadium');

INSERT INTO Competes (CountryName, SportID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
VALUES
('USA', 101, '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium'),
('Canada', 102, '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center'),
('Mexico', 104, '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena');

INSERT INTO `Men'sDivision` (ID)
VALUES
(101),
(102);

INSERT INTO `Women'sDivision`
VALUES
(103),
(104);

INSERT INTO TeamSport (ID)
VALUES
(101),
(102),
(103);

INSERT INTO IndividualSport (ID)
VALUES
(102),
(104);

INSERT INTO venueType (venueName, Type)
VALUES
('National Stadium', 'Outdoor'),
('Aquatics Center', 'Indoor'),
('Gymnastics Arena', 'Indoor');

INSERT INTO AccommodationTypes (AccommodationName, AccommodationTypes)
VALUES
('Olympic Village', 'Luxury'),
('Athletes Inn', 'Standard');

INSERT INTO Team (CountryName, SportID)
VALUES
('USA', 101),
('Canada', 102),
('China', 103),
('Mexico', 104),
('France', 101);


INSERT INTO EventSponsor (SponsorName)
VALUES
('Coca-Cola'),
('Nike'),
('Adidas');

INSERT INTO EventSponsorship (EventSponsorName, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, SponsorshipType, ContractDate, ContractAmount)
VALUES
('Coca-Cola', '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 'Beverage', '2024-01-01', 200000.00),
('Nike', '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 'Apparel', '2024-02-01', 300000.00),
('Coca-Cola', '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 'Exclusive', '2024-06-01', 50000),
('Nike', '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 'Gold', '2024-06-01', 75000),
('Adidas', '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 'Silver', '2024-06-01', 40000);

-- QUERIES

-- 1.
SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) AS Age
	FROM Athlete
	WHERE CountryName = "Canada"
	AND SportID = 
		(SELECT Sport.ID FROM Sport, `Men'sDivision`, TeamSport
		WHERE Sport.ID = `Men'sDivision`.ID AND `Men'sDivision`.ID = TeamSport.ID
		AND Sport.Name = "Swimming");
        
-- 2.
SELECT Sponsor.Name, Sponsor.Industry
	FROM EventSponsorship, EventSponsor, Sponsor
	WHERE EventSponsorship.EventSponsorName = EventSponsor.SponsorName
	AND EventSponsor.SponsorName = Sponsor.Name
	AND (EventSponsorship.EventBeginTimeStamp, EventSponsorship.EventEndTimeStamp, EventSponsorship.EventVenueName) IN 
		(SELECT BeginTimeStamp, EndTimeStamp, VenueName
        FROM Event
        WHERE SportID =
			(SELECT Sport.ID 
            FROM Sport, `Women'sDivision`, IndividualSport
			WHERE Sport.ID = `Women'sDivision`.ID 
            AND `Women'sDivision`.ID = IndividualSport.ID
			AND Sport.Name = "Gymnastics"));

-- 3.             
SELECT TeamSponsorName
	FROM TeamSponsorship 
	WHERE TeamCountryName = "France"
	AND TeamSportID =
		(SELECT Sport.ID FROM Sport, `Men'sDivision`, TeamSport
		WHERE Sport.ID = `Men'sDivision`.ID AND `Men'sDivision`.ID = TeamSport.ID
		AND Sport.name = "Soccer");
        
-- 4.
SELECT SUM(ContractAmount)
	FROM TeamSponsorship
	WHERE TeamCountryName = "USA"
	AND TeamSportID =
		(SELECT Sport.ID FROM Sport, `Women'sDivision`, TeamSport
		WHERE Sport.ID = `Women'sDivision`.ID AND `Women'sDivision`.ID = TeamSport.ID
		AND Sport.name = "Basketball");
     
-- 5.
SELECT Type, MaxCapacity
FROM Transportation
	WHERE AccommodationName = 'Olympic Village'
	AND EventBeginTimeStamp = '2024-07-25 14:00:00'
	AND EventEndTimeStamp = '2024-07-25 17:00:00'
	AND VenueName = 'National Stadium';
  
-- 6.
SELECT SUM(AthleteCount.Count + OfficialCount.Count) AS TotalCount
FROM 
    (SELECT COUNT(*) AS Count
     FROM Athlete
     WHERE AccommodationName = "Olympic Village") AS AthleteCount
JOIN 
    (SELECT COUNT(*) AS Count
     FROM Official
     WHERE AccommodationName = "Olympic Village") AS OfficialCount;
     
-- 7.
SELECT Sport.Name, Event.BeginTimeStamp, Event.EndTimeStamp
	FROM Event, Sport
	WHERE Event.SportID = Sport.ID
	AND BeginTimeStamp >= '2024-07-21 00:00:00'
	AND EndTimeStamp <= '2024-07-23 23:59:59';

-- 8. 
SELECT Name, (NumGolds + NumSilver + NumBronze) AS TotalMedals
	FROM Country
	WHERE Name = "Canada";

-- 9.
SELECT *
	FROM Country
	ORDER BY NumGolds DESC, NumSilver DESC, NumBronze DESC;

-- 10.
SELECT SEC_TO_TIME(TIMESTAMPDIFF(SECOND, BeginTimeStamp, EndTimeStamp)) AS Duration, Sport.Name
	FROM Event, Sport
    WHERE Event.SportID = Sport.ID
	AND VenueName = 'National Stadium';
   
-- 11.
SELECT SalariedStaffID, SUM(HourlyWageEuros * HoursWorked) AS TotalPay
	FROM SalariedStaffs
	WHERE (EventBeginTimeStamp, EventEndTimeStamp, EventVenueName) IN
		(SELECT BeginTimeStamp, EndTimeStamp, VenueName
		 FROM Event 
		 WHERE SportID = 
			(SELECT SportID FROM Sport WHERE Name = "Soccer"))
	GROUP BY SalariedStaffID;
 
-- 12.
SELECT Name
	FROM Official, Officiates
	WHERE Official.ID = Officiates.OfficialID
	AND Officiates.EventVenueName = 'National Stadium'
	AND Officiates.EventBeginTimeStamp >= '2024-07-01 00:00:00'
	AND Officiates.EventEndTimeStamp <= '2024-07-01 23:59:59';
    
-- 13.
SELECT 
    t.CountryName, 
    t.SportID, 
    s.Name AS SportName, 
    COUNT(a.ID) AS teamSize
FROM 
    Athlete a
JOIN 
    Team t ON a.CountryName = t.CountryName AND a.SportID = t.SportID
JOIN 
    Sport s ON a.SportID = s.ID
WHERE 
    t.SportID = 101
GROUP BY 
    t.CountryName, t.SportID, s.Name
HAVING 
    teamSize < 12 OR teamSize > 15;






