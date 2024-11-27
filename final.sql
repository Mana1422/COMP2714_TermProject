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
    SportName VARCHAR(50),

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS SportTypes (
    SportID int NOT NULL,
    SportType VARCHAR(100) NOT NULL,

    PRIMARY KEY (sportID, sportType)
);

CREATE TABLE IF NOT EXISTS `Men'sDivision` (
    ID int NOT NULL,
    AthleteName VARCHAR(100),

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS `Women'sDivision` (
    ID int NOT NULL,
    AthleteName VARCHAR(100),

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS TeamSport (
    ID int NOT NULL,
    TeamName VARCHAR (100),
    MinAthletes int,
    MaxAthletes int,

    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS IndividualSport (
    ID int NOT NULL,
    SportName VARCHAR(100),

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

