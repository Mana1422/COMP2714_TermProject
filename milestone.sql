

-- Staff table
CREATE TABLE IF NOT EXISTS `Staff` (
    `ID` int, 
    `Name` VARCHAR (50) NOT NULL,
    `LastName` VARCHAR (50) NOT NULL,
    `ContactNo` int,
    PRIMARY KEY (`ID`)
);


-- Salaried table
CREATE TABLE IF NOT EXISTS `Salaried` (
    `SalariedID` int,
    -- PRIMARY KEY (`SalariedID`),
    -- ADD CONSTRAINT `SalariedFK` FOREIGN KEY (`SalariedID`) REFERENCES `Staff` (`ID`)
);

-- Volunteer table
CREATE TABLE IF NOT EXISTS `Volunteer` (
    `StaffID` int,
    -- PRIMARY KEY (`StaffID`),
    -- ADD CONSTRAINT `VolunteerFK` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`ID`)
);

-- Sponsor table
CREATE TABLE IF NOT EXISTS `Sponsor` (
    `Name` VARCHAR(50) NOT NULL,
    `Industry` VARCHAR (50) NOT NULL,
    `ContactNo` int,
    -- PRIMARY KEY (`Name`),
    -- ADD CONSTRAINT `VolunteerFK`
)