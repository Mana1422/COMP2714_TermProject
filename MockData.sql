INSERT INTO Athlete (ID, FirstName, MiddleName, LastName, WeightKg, Sex, Birthday, CountryName, SportID, AccommodationName, RoomNo)
VALUES
(1, 'John', 'M.', 'Doe', 75.5, 'Male', '1990-05-12', 'USA', 101, 'Olympic Village', 202),
(2, 'Anna', 'L.', 'Smith', 63.7, 'Female', '1992-09-22', 'Canada', 102, 'Athletes Inn', 105),
(3, 'Liu', NULL, 'Wang', 68.0, 'Male', '1988-07-01', 'China', 103, 'Olympic Village', 302),
(4, 'Maria', 'T.', 'Garcia', 56.3, 'Female', '1994-11-15', 'Mexico', 104, 'Athletes Inn', 110);


INSERT INTO Country (countryName, NumGolds, NumSilver, NumBronze)
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
(4, 'Clark', 'Kent', '555-765-4321');


INSERT INTO Salaried (SalariedID)
VALUES
(1),
(2);


INSERT INTO Volunteer (StaffID)
VALUES
(3),
(4);


INSERT INTO Sponsor (Name, Industry, ContactNo)
VALUES
('Nike', 'Sportswear', 123456789),
('Adidas', 'Sportswear', 987654321),
('Coca-Cola', 'Beverages', 456789123);


INSERT INTO SalariedStaffs (SalariedStaffID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, HourlyWageEuros, HoursWorked, Role)
VALUES
(1, '08:00:00', '12:00:00', 'National Stadium', 20, 4, 'Manager'),
(2, '10:00:00', '15:00:00', 'Aquatics Center', 25, 5, 'Coach');


INSERT INTO VolunteerStaffs (VolunteerStaffID, EventBeginTimeStamp, EventEndTimeStamp, EventVenueName, HoursWorked, Role)
VALUES
(3, '09:00:00', '13:00:00', 'Gymnastics Arena', 4, 'Assistant'),
(4, '14:00:00', '18:00:00', 'National Stadium', 4, 'Coordinator');


INSERT INTO Official (ID, Name, Role, AccommodationName, RoomNumber)
VALUES
(1, 'Charles Xavier', 'Referee', 'Olympic Village', 101),
(2, 'Diana Prince', 'Judge', 'Athletes Inn', 202);


INSERT INTO TeamSponsor (SponsorName)
VALUES
('Nike'),
('Adidas');


INSERT INTO TeamSponsorship (TeamSponsorName, TeamCountryName, TeamSportID, SponsorshipType, ContractDate, ContractAmount)
VALUES
('Nike', 'USA', 101, 'Gold', '2024-01-15', 500000.00),
('Adidas', 'Canada', 102, 'Silver', '2024-02-10', 300000.00);


INSERT INTO Event (BeginTimeStamp, EndTimeStamp, VenueName, SportID)
VALUES
('2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 101),
('2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 102),
('2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 104);


INSERT INTO Results (countryName, EventBeginTimeStamp, EventEndTimeStamp, venueName, result)
VALUES
('USA', '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium', 'Gold'),
('Canada', '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center', 'Silver'),
('Mexico', '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena', 'Bronze');


INSERT INTO Accommodation (AccommodationName, accommodationAddress, maxOccupancy)
VALUES
('Olympic Village', '1 Main St', 500),
('Athletes Inn', '2 Athlete Rd', 200);


INSERT INTO Venue (venueName, venueAddress, maxCapacity)
VALUES
('National Stadium', '123 Olympic Blvd', 50000),
('Aquatics Center', '456 Water Way', 15000),
('Gymnastics Arena', '789 Balance Rd', 10000);


INSERT INTO Sport (id, sportName)
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


INSERT INTO Room (AccommodationName, RoomNumber, maxOccupancy)
VALUES
('Olympic Village', 202, 4),
('Athletes Inn', 105, 2),
('Olympic Village', 302, 3);


INSERT INTO EventRound (BeginTimeStamp, EndTimeStamp, VenueName, Round)
VALUES
('2024-07-21 10:00:00', '2024-07-21 11:00:00', 'National Stadium', 'Quarterfinal'),
('2024-07-21 11:30:00', '2024-07-21 12:00:00', 'National Stadium', 'Semifinal'),
('2024-07-22 14:00:00', '2024-07-22 15:00:00', 'Aquatics Center', 'Final');


INSERT INTO Officiates (OfficialID, BeginTime, EndTime, Venue)
VALUES
(1, '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium'),
(2, '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center');


INSERT INTO Competes (CountryName, SportID, BeginTime, EndTime, Venue)
VALUES
('USA', 101, '2024-07-21 10:00:00', '2024-07-21 12:00:00', 'National Stadium'),
('Canada', 102, '2024-07-22 14:00:00', '2024-07-22 16:00:00', 'Aquatics Center'),
('Mexico', 104, '2024-07-23 18:00:00', '2024-07-23 20:00:00', 'Gymnastics Arena');


INSERT INTO MaleDivision (ID, AthleteName)
VALUES
(1, 'John M. Doe'),
(3, 'Liu Wang');


INSERT INTO FemaleDivision (ID, AthleteName)
VALUES
(2, 'Anna L. Smith'),
(4, 'Maria T. Garcia');


INSERT INTO TeamSport (ID, teamName, minAthletes, maxAthletes)
VALUES
(101, 'USA Soccer Team', 11, 23),
(103, 'China Basketball Team', 5, 12);


INSERT INTO IndividualSport (ID, sportName)
VALUES
(102, 'Swimming'),
(104, 'Gymnastics');


INSERT INTO venueType (venueName, venueType)
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
