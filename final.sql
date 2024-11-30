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
    ContactNo int,

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
    VenueType VARCHAR (100),
    MaxCapacity int,

    PRIMARY KEY (AccommodationName, EventBeginTimeStamp, EventEndTimeStamp, VenueName)
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
(14, 'Luke', 'Hughes', 72.7, 'Male', '1991-11-25', 'Canada', 102, 'Olympic Village', 219);

INSERT INTO Country (Name, NumGolds, NumSilver, NumBronze)
VALUES
('USA', 25, 30, 20),
('Canada', 15, 20, 25),
('China', 28, 25, 30),
('Mexico', 5, 10, 15);

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
('Nike', 'Sportswear', 123456789),
('Adidas', 'Sportswear', 987654321),
('Coca-Cola', 'Beverages', 456789123),
('PepsiCo', 'Beverages', 321654987),
('Samsung', 'Electronics', 654321789),
('Toyota', 'Automobile', 123987654),
('Apple', 'Technology', 987321654),
('Sony', 'Electronics', 456123789),
('Nestle', 'Food & Beverage', 789456123),
('Microsoft', 'Technology', 123654987);

INSERT INTO Event (BeginTimeStamp, EndTimeStamp, VenueName, SportID)
VALUES
('2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 101),
('2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 102),
('2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 104),
('2024-07-24 09:00:00', '2024-07-24 11:00:00', 'National Stadium', 101),
('2024-07-25 15:00:00', '2024-07-25 17:00:00', 'Aquatics Center', 102),
('2024-07-26 13:00:00', '2024-07-26 15:00:00', 'Gymnastics Arena', 104),
('2024-07-27 16:00:00', '2024-07-27 18:00:00', 'National Stadium', 103),
('2024-07-28 11:00:00', '2024-07-28 13:00:00', 'Gymnastics Arena', 104),
('2024-07-29 14:00:00', '2024-07-29 16:00:00', 'Aquatics Center', 102),
('2024-07-30 10:00:00', '2024-07-30 12:00:00', 'National Stadium', 101);

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
(3, 'Bruce Wayne', 'Referee', 'Olympic Village', 204),
(4, 'Clark Kent', 'Judge', 'Athletes Inn', 105),
(5, 'Peter Parker', 'Referee', 'Olympic Village', 303),
(6, 'Tony Stark', 'Judge', 'Olympic Village', 401),
(7, 'Natasha Romanoff', 'Referee', 'Athletes Inn', 107),
(8, 'Steve Rogers', 'Judge', 'Olympic Village', 502),
(9, 'Thor Odinson', 'Referee', 'Athletes Inn', 206),
(10, 'Wanda Maximoff', 'Judge', 'Olympic Village', 305);


INSERT INTO TeamSponsor (SponsorName)
VALUES
('Nike'),
('Adidas');

INSERT INTO TeamSponsorship (TeamSponsorName, TeamCountryName, TeamSportID, SponsorshipType, ContractDate, ContractAmount)
VALUES
('Nike', 'USA', 101, 'Gold', '2024-01-15', 500000.00),
('Adidas', 'Canada', 102, 'Silver', '2024-02-10', 300000.00);

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
(101, 'Team'),
(102, 'Individual'),
(103, 'Team'),
(104, 'Individual');

INSERT INTO Transportation (AccommodationName, EventBeginTimeStamp, EventEndTimeStamp, venueName, venueType, maxCapacity)
VALUES
('Olympic Village', '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 'Outdoor', 300),
('Athletes Inn', '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 'Indoor', 100);

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
('2024-07-22 14:00:00', '2024-07-22 15:00:00', 'Aquatics Center', 'Final');

INSERT INTO Officiates (OfficialID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
VALUES
(1, '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium'),
(2, '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center');

INSERT INTO Competes (CountryName, SportID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName)
VALUES
('USA', 101, '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium'),
('Canada', 102, '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center'),
('Mexico', 104, '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena');

INSERT INTO `Men'sDivision` (ID)
VALUES
(102);

-- INSERT INTO `Women'sDivision` (ID, AthleteName)
-- VALUES
-- (2, 'Anna L. Smith'),
-- (4, 'Maria T. Garcia');

INSERT INTO TeamSport (ID)
VALUES
(102);

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
('Mexico', 104);

INSERT INTO EventSponsor (SponsorName)
VALUES
('Coca-Cola'),
('Nike'),
('Adidas');

INSERT INTO EventSponsorship (EventSponsorName, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, SponsorshipType, ContractDate, ContractAmount)
VALUES
('Coca-Cola', '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 'Beverage', '2024-01-01', 200000.00),
('Nike', '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 'Apparel', '2024-02-01', 300000.00),
('Adidas', '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 'Footwear', '2024-03-01', 250000.00);

-- QUERIES

SELECT FirstName, LastName, TIMESTAMPDIFF(YEAR, Birthday, CURDATE()) AS Age
	FROM Athlete
	WHERE CountryName = "Canada"
	AND SportID = 
		(SELECT Sport.ID FROM Sport, `Men'sDivision`, TeamSport
		WHERE Sport.ID = `Men'sDivision`.ID AND `Men'sDivision`.ID = TeamSport.ID
		AND Sport.Name = "Swimming");
