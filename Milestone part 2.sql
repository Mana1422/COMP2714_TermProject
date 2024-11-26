-- Milestone part 2
CREATE TABLE IF NOT EXISTS `Competes` (
    CountryName VARCHAR(100),
    SportID int NOT NULL,
    BeginTimeStamp TIMESTAMP NOT NULL,
    EndTimeStamp TIMESTAMP NOT NULL,
    VenueName VARCHAR(50),

    PRIMARY KEY (`CountryName`),
    PRIMARY KEY (`SportID`),
    PRIMARY KEY (`BeginTimeStamp`),
    PRIMARY KEY (`EndTimeStamp`),
    PRIMARY KEY (`VenueName`)
);

CREATE TABLE IF NOT EXISTS `Sport` (
    id int NOT NULL,
    sportName VARCHAR(50),

    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `SportTypes` (
    sportID int NOT NULL,
    sportType VARCHAR(100) NOT NULL,

    PRIMARY KEY (`sportID`),
    PRIMARY KEY (`sportType`)
);

CREATE TABLE IF NOT EXISTS `MaleDivision` (
    ID int NOT NULL,
    AthleteName VARCHAR(100),

    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `FemaleDivision` (
    ID int NOT NULL,
    AthleteName VARCHAR(100),

    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `TeamSport` (
    ID int NOT NULL,
    teamName VARCHAR (100),
    minAthletes int,
    maxAthletes int,

    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `IndividualSport` (
    ID int NOT NULL,
    sportName VARCHAR(100),

    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `Venue` (
    venueName VARCHAR(100) NOT NULL,
    venueAddress VARCHAR(100),
    maxCapacity INT NOT NULL,

    PRIMARY KEY (`venueName`)
);

CREATE TABLE IF NOT EXISTS `venueType` (
    venueName VARCHAR(100) NOT NULL,
    venueType VARCHAR(50) NOT NULL,

    PRIMARY KEY (`venueName`),
    PRIMARY KEY (`venueType`)
);

CREATE TABLE IF NOT EXISTS `Athlete` (
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

    PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `Country` (
    Name VARCHAR(100) NOT NULL,
    NumGolds int,
    NumSilver int,
    NumBronze int,

    PRIMARY KEY (`countryName`)
);

CREATE TABLE IF NOT EXISTS `Results` (
    CountryName VARCHAR(100),
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    venueName VARCHAR (100),
    result VARCHAR(50),

    PRIMARY KEY (`countryName`),
    PRIMARY KEY (`EventBeginTimeStamp`),
    PRIMARY KEY (`EventEndTimeStamp`),
    PRIMARY KEY (`venueName`)
);

CREATE TABLE IF NOT EXISTS `Accommodation` (
    Name VARCHAR (100) NOT NULL,
    Address VARCHAR (100),
    MaxOccupancy int,

    PRIMARY KEY (`AccommodationName`)
);

CREATE TABLE IF NOT EXISTS `AccommodationTypes` (
    AccommodationName VARCHAR(100) NOT NULL,
    AccommodationTypes VARCHAR(50) NOT NULL,

    PRIMARY KEY (`AccommodationName`),
    PRIMARY KEY (`AccommodationTypes`)
);

CREATE TABLE IF NOT EXISTS `Room` (
    Number int NOT NULL,
    AccommodationName VARCHAR(100),
    MaxOccupancy int,

    PRIMARY KEY (`AccommodationName`),
    PRIMARY KEY (`RoomNumber`)
);

CREATE TABLE IF NOT EXISTS `Transportation` (
    AccommodationName VARCHAR(100) NOT NULL,
    EventBeginTimeStamp TIMESTAMP NOT NULL,
    EventEndTimeStamp TIMESTAMP NOT NULL,
    VenueName VARCHAR(100) NOT NULL,
    VenueType VARCHAR (100),
    MaxCapacity int,

    PRIMARY KEY (`AccommodationName`),
    PRIMARY KEY (`EventBeginTimeStamp`),
    PRIMARY KEY (`EventEndTimeStamp`),
    PRIMARY KEY (`venueName`)
);