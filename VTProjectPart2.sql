
-- This is VT Consultant Group's code to physically design, implement, and load data for Vietnam Children Association

-- Note that because this non-profit organization only operates in Denver, Colorado, all address and location fields in the tables are street address. 

-- Create Table

CREATE TABLE Donor (
        DonorID     INT PRIMARY KEY NOT NULL,    
        FirstName	VARCHAR2(35)	NOT NULL,        
        LastName  	VARCHAR2(50)	NOT NULL,         
        Email    	VARCHAR2(50)    NOT NULL,    
        Phone		CHAR(12)  
);

CREATE TABLE Campaign (
        CampaignID          INT PRIMARY KEY NOT NULL,
        CampaignDate        DATE            NOT NULL,
        CampaignLocation    VARCHAR2(50)    NOT NULL
);

CREATE TABLE Donation (
        DonationID          INT PRIMARY KEY NOT NULL,
        DonationDate        DATE,
        DonationLocation    VARCHAR2(50),
        DonorID             INT             NOT NULL,
        CampaignID          INT,
        CONSTRAINT FK_Donation_DonorID FOREIGN KEY (DonorID) REFERENCES Donor(DonorID),
        CONSTRAINT FK_Donation_CampaignID FOREIGN KEY (campaignID) REFERENCES Campaign(CampaignID)
);

CREATE TABLE Receiver (
        ReceiverID          INT PRIMARY KEY NOT NULL,
        OrganizationName    VARCHAR2(100)   NOT NULL,
        Email               VARCHAR2(50)    NOT NULL,
        Address             VARCHAR2(50)    NOT NULL,
        Phone               CHAR(12)
);

CREATE TABLE Item (
        ItemID          INT PRIMARY KEY NOT NULL,
        DonationID      INT             NOT NULL,
        ReceiverID      INT             NOT NULL,
        ItemType        VARCHAR2(50)    NOT NULL,
        CONSTRAINT FK_Item_DonationID FOREIGN KEY (DonationID) REFERENCES Donation(DonationID),
        CONSTRAINT FK_Item_ReceiverID FOREIGN KEY (ReceiverID) REFERENCES Receiver(ReceiverID)
);

CREATE TABLE Employee (
        EmployeeID  INT PRIMARY KEY NOT NULL,
        FirstName   VARCHAR2(30)    NOT NULL,
        LastName    VARCHAR2(30)    NOT NULL,
        Email       VARCHAR2(30)    NOT NULL,
        Phone       CHAR(12)   
);

CREATE TABLE CampaignEmployee (
        EmployeeID INT,
        CampaignID INT NOT NULL,
        PRIMARY KEY (EmployeeID, CampaignID),
        CONSTRAINT FK_CampaignEmployee_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
        CONSTRAINT FK_CampaignEmployee_CampaignID FOREIGN KEY (CampaignID) REFERENCES Campaign(CampaignID)
);

--Inserting Data

--Data for Donor Table

INSERT ALL
INTO Donor 
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (1, 'Oby', 'Quigg', 'oquigg0@paginegialle.it', '480-156-6248')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (2, 'Arni','Canavan', 'canavan1@europa.eu', '391-139-0140')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (3 ,'Ricardo', 'Caldaro', 'rcaldaro2@istockphoto.com', '684-379-0206')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (4, 'Lorilee', 'Rosiello', 'lrosiello3@reference.com', '932-470-1615')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (5, 'Brnaba', 'Rodge', 'brodge4@pbs.org', '417-2056667')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (6, 'Willdon', 'Garthside', 'wgarthside5@typepad.com','219-502-4279')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (7, 'Seka', 'Desporte', 'sdesporte6@telegraph.co.uk', '247-735-7088')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES 
     (8 ,'Debor', 'Hew', 'dhew7@foxnews.com', '815-864-4016')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (9, 'Claire', 'Battersby', 'cbattersby8@admin.ch', '971-898-7306')
INTO Donor
     (DonorID, FirstName, LastName, Email, Phone)
VALUES
     (10, 'Michal', 'Tranckle', 'mtranckle9@usa.gov', '206-448-6279')
SELECT 1 FROM dual;

-- Data for Campaign Table

INSERT ALL
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1001, '02-JAN-2022', '343 Elgar Point')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1002, '22-MAY-2021' ,'29141 Prairieview Place')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1003, '04-SEP-2022', '1996 Helena Point')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES 
    (1004, '27-AUG-2022', '194 Brown Lane')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1005, '30-JUN-2022', '6365 Parkside Point')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1006, '20-DEC-2021', '07948 Melody Circle')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1007, '15-JAN-2022', '687 Village Pass')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES 
    (1008, '17-MAR-2022', '42 Autumn Leaf Court')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1009, '18-JUL-2022', '717 Mifflin Alley')
INTO Campaign
    (CampaignID, CampaignDate, CampaignLocation)
VALUES
    (1010, '25-MAY-2022', '4932 Manley Trail')
SELECT 1 FROM dual;

--Data for Donation Table

INSERT ALL
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (11001, 1, 1001, '09-APR-2022', '343 Elgar Point')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (21007, 2, 1007, '19-DEC-2021', '687 Village Pass')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (31009, 3, 1009, '21-FEB-2022', '717 Mifflin Alley')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (41007, 4, 1007, '08-SEP- 2022', '687 Village Pass')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (51008, 5, 1008, '30-MAY-2022', '42 Autumn Leaf Court')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES 
    (61004, 6, 1004, '05-NOV-2021', '194 Brown Lane')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (71003, 7, 1003, '12-JAN-2022', '1996 Helena Point')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (81002, 8, 1002, '11-AUG-2022', '29141 Prairieview Place')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES
    (91003, 9, 1003, '07-MAR-2022', '1996 Helena Point')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation)
VALUES 
    (101006, 10, 1006, '15-JUN-2022', '07948 Melody Circle')
SELECT 1 FROM dual; 

--Data for Receiver Table 
--Note that Vietnam Children Association only gives items donated by individual donors to organizations. Therefore, organization's name means receiver's name.

INSERT ALL
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES 
    (101, 'Sari', 'sari@gmail.com', '0716 Becker Court', '257-643-3972')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (102, 'Kathy', 'kathy@gmail.com', '789 Ohio Crossing', '188-324-2461')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (103, 'Yvon', 'Yvon@gmail.com', '553 Granby Hill', '521-535-3719')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (104, 'Jewel', 'jewel@gmail.com', '45814 Calypso Junction', '300-959-4969')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (105, 'Jessika', 'Jessica@gmail.com', '6021 Farragut Place', '950-678-7979')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (106, 'Loutitia', 'loutitia@gmail.com', '5573 Annamark Point', '696-549-5716')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (107, 'Jacklyn', 'jacklyn@gmail.com', '4 Riverside Point', '172-940-2365')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (108, 'Josefina', 'josefina@gmail.com', '33 Clyde Gallagher Hill',	'693-447-1693')
INTO Receiver
    (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (109, 'Vonni', 'vonni@gmail.com', '65028 Lotheville Terrace', '931-543-8497')
INTO Receiver
   (ReceiverID, OrganizationName, Email, Address, Phone)
VALUES
    (110, 'Connor', 'connor@gmail.com',	'77 Corben Drive',	'172-276-0568')
SELECT 1 FROM dual;

--Data for Employee Table

INSERT ALL
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES 
    (2001, 'Mikkel', 'Flude', 'mflude0@ovh.net', '597-719-4562')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2002,	'Kathrine',	'Stowers', 'kstowers1@google.es', '710-826-4270')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2003,	'Hedvig', 'Wellard', 'hwellard2@webnode.com', '447-884-4192')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2004, 'Anna-diana', 'Derrell',	'aderrelld@indiatimes.com',	'169-609-3630')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2005, 'Perry', 'Britnell', 'pbritnellb@reddit.com', '208-298-5702')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2006, 'Jeddy', 'Audibert',	'jaudibertq@illinois.edu', '399-990-7940')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2007, 'Devonna', 'Signorelli', 'dsignorellij@adobe.com', '929-155-3022')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2008, 'Adler', 'Deveral',	'adeveralg@bing.com', '273-484-6149')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2009, 'Han', 'Cook', 'hancook@gmail.com', '303-345-567')
INTO Employee
    (EmployeeID, FirstName, LastName, Email, Phone)
VALUES
    (2010, 'Preston', 'Phan', 'prestonphan@gmail.com', '303-123-567')
SELECT 1 FROM dual;

--Data for CampaignEmployee Table

INSERT ALL
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2001, 1002)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2002, 1008)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2003, 1010)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2004, 1009)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2005, 1007)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2006, 1008)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2007, 1002)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2008, 1010)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2009, 1005)
INTO CampaignEmployee
    (EmployeeID, CampaignID)
VALUES
    (2010, 1004)
SELECT 1 FROM dual;


-- Data for Item Table

INSERT ALL
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3001, 11001, 101, 'clothes')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3002, 21007, 102, 'books')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3003, 31009, 103, 'clothes')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3004, 41007, 104, 'school supplies')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3005, 51008, 105, 'clothes')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3006, 61004, 106, 'home appliances')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3007, 71003, 107, 'books')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3008, 81002, 108, 'digital devices')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3009, 91003, 109, 'books')
INTO Item
    (ItemID, DonationID, ReceiverID, ItemType)
VALUES
    (3010, 101006, 110, 'school supplies')
SELECT 1 FROM dual;