-- Milestone part 2

CREATE TABLE IF NOT EXISTS `Competes` (
    CountryName VARCHAR(100),
    SportID int NOT NULL,
    BeginTime TIMESTAMP NOT NULL,
    EndTime TIMESTAMP NOT NULL
    Venue VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Sport` (
    id int NOT NULL,
    sportName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `SportTypes` (
    sportID int NOT NULL,
    sportType VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS `MaleDivision` (
    ID int NOT NULL,
    AthleteName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `FemaleDivision` (
    ID int NOT NULL,
    AthleteName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `TeamSport` (
    ID int NOT NULL,
    teamName VARCHAR (100)
    minAthletes int,
    maxAthletes int
);

CREATE TABLE IF NOT EXISTS `IndividualSport` (
    ID int NOT NULL,
    sportName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Venue` (
    venueName VARCHAR(100) NOT NULL,
    venueAddress VARCHAR(100),
    maxCapacity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS `venueType` (
    venueName VARCHAR(100) NOT NULL,
    venueType VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Athlete` (
    ID int NOT NULL,
    firstName VARCHAR (50),
    lastName VARCHAR(50),
    weightKg FLOAT,
    sex VARCHAR(10),
    Birthday DATE,
    CountryName VARCHAR (100),
    sportID int,
    AccommodationName VARCHAR(100),
    roomNo int,
    teamName VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS `Country` (
    countryName VARCHAR(100) NOT NULL,
    NumGolds int,
    NumSilver int,
    NumBronze int
);

CREATE TABLE IF NOT EXISTS `Results` (
    countryName VARCHAR(100),
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    venueName VARCHAR (100),
    result VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS `Accommodation` (
    AccommodationName VARCHAR (100) NOT NULL,
    accommodationAddress VARCHAR (100),
    maxOccupancy int
);

CREATE TABLE IF NOT EXISTS `AccommodationTypes` (
    AccommodationName VARCHAR(100) NOT NULL,
    AccommodationTypes VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Room` (
    AccommodationName VARCHAR(100),
    RoomNumber int NOT NULL
    maxOccupancy int
);

CREATE TABLE IF NOT EXISTS `Transportation` (
    AccommodationName VARCHAR(100) NOT NULL,
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    venueName VARCHAR(100) NOT NULL,
    venueType VARCHAR (100),
    maxCapacity int
);