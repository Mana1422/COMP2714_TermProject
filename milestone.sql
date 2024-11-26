

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

-- Athlete table
CREATE TABLE Athlete IF NOT EXI(
	`ID` INTEGER NOT NULL,
	`FirstName` VARCHAR(20),
	`MiddleName` VARCHAR(20),
	`LastName` VARCHAR(20),
	`WeightKg` DECIMAL(5, 2) UNSIGNED
	`Sex` VARCHAR(10),
	`Birthday` DATE,
	`CountryName` VARCHAR(20)
	`SportID` INTEGER,
	`AccomodationName` VARCHAR(20),
	`RoomNo` INTEGER,
    PRIMARY KEY (ID),
);

-- Athlete Constraints
ALTER TABLE Athlete ADD CONSTRAINT CountryNameFK (FOREIGN KEY CountryName REFERENCES Country (Name)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE Athlete ADD CONSTRAINT SportIDFK (FOREIGN KEY SportID REFERENCES Sport (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE Athlete ADD CONSTRAINT AccomodationNameFK (FOREIGN KEY AccomodationName REFERENCES Accomodation (Name)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE Athlete ADD CONSTRAINT RoomNo (FOREIGN KEY RoomNo REFERENCES Room (No)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
