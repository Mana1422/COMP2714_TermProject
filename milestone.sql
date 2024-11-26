

-- Staff table
CREATE TABLE IF NOT EXISTS `Staff` (
    `ID` int, 
    `Name` VARCHAR (50) NOT NULL,
    `LastName` VARCHAR (50) NOT NULL,
    `ContactNo` VARCHAR(15),
    PRIMARY KEY (`ID`)
);

-- Salaried table
CREATE TABLE IF NOT EXISTS `Salaried` (
    `SalariedID` int,
    PRIMARY KEY (`SalariedID`)
    -- ADD CONSTRAINT `SalariedFK` FOREIGN KEY (`SalariedID`) REFERENCES `Staff` (`ID`)
);

-- Volunteer table
CREATE TABLE IF NOT EXISTS `Volunteer` (
    `StaffID` int,
    PRIMARY KEY (`StaffID`)
    -- ADD CONSTRAINT `VolunteerFK` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`ID`)
);

-- Sponsor table
CREATE TABLE IF NOT EXISTS `Sponsor` (
    `Name` VARCHAR(50) NOT NULL,
    `Industry` VARCHAR (50) NOT NULL,
    `ContactNo` int,
    PRIMARY KEY (`Name`)
    
    -- ADD CONSTRAINT `VolunteerFK`
);

-- Create table Salaried Staff
CREATE TABLE IF NOT EXISTS `SalariedStaffs` (
    `SalariedStaffID` int NOT NULL,
    `EventBeginTimeStamp` TIME NOT NULL,
    `EventEndTimeStamp` TIME NOT NULL,
    `EventVenueName` VARCHAR (100) NOT NULL,
    `HourlyWageEuros` int,
    `HoursWorked` int DEFAULT 0,
    `Role` VARCHAR (50),

    PRIMARY KEY (`SalariedStaffID`),
    PRIMARY KEY (`EventBeginTimeStamp`),
    PRIMARY KEY (`EventEndTimeStamp`),
    PRIMARY KEY (`EventVenueName`)
);

-- VolunteerStaffs Table
CREATE TABLE IF NOT EXISTS `VolunteerStaffs` (
    `VolunteerStaffID` int NOT NULL,
    `EventBeginTimeStamp` TIME NOT NULL,
    `EventEndTimeStamp` Time NOT NULL,
    `EventVenueName` VARCHAR (100),
    `HoursWorked` int DEFAULT 0,
    `Role` varchar(50),
    
    PRIMARY KEY (`VolunteerStaffID`),
    PRIMARY KEY (`EventBeginTimeStamp`),
    PRIMARY KEY (`EventEndTimeStamp`),
    PRIMARY KEY (`EventVenueName`)
);

-- Officials table
CREATE TABLE IF NOT EXISTS `Official` (
    `ID` int NOT NULL,
    `Name` VARCHAR (50),
    `Role` VARCHAR (50),
    `AccommodationName` VARCHAR (50),
    `RoomNumber` int,

    PRIMARY KEY (`ID`)
);

-- TeamSponsor table
CREATE TABLE IF NOT EXISTS `TeamSponsor` (
    `SponsorName` VARCHAR (100),

    PRIMARY KEY (`SponsorName`)
);

-- TeamSponsorship Table
CREATE TABLE IF NOT EXISTS `TeamSponsorship` (
    `TeamSponsorName` VARCHAR (100) NOT NULL,
    `TeamCountryName` VARCHAR (100) NOT NULL,
    `TeamSportID` int NOT NULL,
    `SponsorshipType` varchar (50),
    `ContractDate` DATE,
    `ContractAmount` DECIMAL (10,2),

    PRIMARY KEY (`SponsorName`),
    PRIMARY KEY (`TeamCountryName`),
    PRIMARY KEY (`TeamSportID`)
);

-- EventSponsor table
CREATE TABLE IF NOT EXISTS `EventSponsor` (
    `SponsorName` VARCHAR (100),

    PRIMARY KEY (`SponsorName`)
);

-- EventSponsorship
CREATE TABLE IF NOT EXISTS `EventSponsorship` (
    `EventSponsorName` VARCHAR (100) NOT NULL,
    `EventBeginTimeStamp` TIMESTAMP NOT NULL,
    `EventEndTimeStamp` TIMESTAMP NOT NULL,
    `EventVenueName` VARCHAR (100) NOT NULL,
    `SponsorshipType` VARCHAR (50),
    `ContractDate` DATE,
    `ContractAmount` DECIMAL (10, 2),

    PRIMARY KEY (`EventSponsorName`),
    PRIMARY KEY (`EventBeginTimeStamp`),
    PRIMARY KEY (`EventEndTimeStamp`),
    PRIMARY KEY (`EventVenueName`)
);

-- Team table
CREATE TABLE IF NOT EXISTS `Team`(
    `CountryName` VARCHAR (100) NOT NULL UNIQUE,
    `SportID` int NOT NULL,

    PRIMARY KEY (`CountryName`),
    PRIMARY KEY (`SportID`)
);

-- Event Table
CREATE TABLE IF NOT EXISTS `Event` (
    `BeginTimeStamp` TIMESTAMP NOT NULL,
    `EndTimeStamp` TIMESTAMP NOT NULL,
    `VenueName` VARCHAR (100),
    `SportID` int,

    PRIMARY KEY (`BeginTimeStamp`),
    PRIMARY KEY (`EndTimeStamp`),
    PRIMARY KEY (`VenueName`)
);

-- EventRound table
CREATE TABLE IF NOT EXISTS `EventRound` (
    `BeginTimeStamp` TIMESTAMP NOT NULL,
    `EndTimeStamp` TIMESTAMP NOT NULL,
    `VenueName` TIMESTAMP NOT NULL,
    `Round` VARCHAR (100) NOT NULL,

    PRIMARY KEY (`BeginTimeStamp`),
    PRIMARY KEY (`EndTimeStamp`),
    PRIMARY KEY (`VenueName`),
    PRIMARY KEY (`Round`)
);

-- Officiates table
CREATE TABLE IF NOT EXISTS `Officiates` (
    `OfficialID` int NOT NULL,
    `BeginTimeStamp` TIMESTAMP NOT NUll,
    `EndTimeStamp` TIMESTAMP NOT NULL,
    `Venue` VARCHAR (100),

    PRIMARY KEY (`OfficialID`),
    PRIMARY KEY (`BeginTime`),
    PRIMARY KEY (`EndTime`),
    PRIMARY KEY (`Venue`)
);

