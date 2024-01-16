/*
DROP TABLE CampaignEmployee;
DROP TABLE Employee;
DROP TABLE DonationReceiver;
DROP TABLE Receiver;
DROP TABLE Donation;
DROP TABLE Campaign;
DROP TABLE Donor;
*/

/*
DROP PROCEDURE CountCampaign_sp;
DROP PROCEDURE RetreivePeopleData_sp;
DROP PROCEDURE FindDonor_sp;
DROP PROCEDURE InsertDonation_sp;
DROP PROCEDURE FindRepeatedDonor_sp;
DROP PROCEDURE EvaluateCampaign_sp;
DROP PROCEDURE InsertEmployee_sp;
DROP VIEW AvgAmountReceived_vw;
DROP VIEW ThirdQuarterDonor_vw;

*/

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
        AmountDonated       DECIMAL(10,2)    NOT NULL,
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



CREATE TABLE DonationReceiver (
        DonationReceiverID  INT PRIMARY KEY NOT NULL,
        DonationID          INT             NOT NULL,
        ReceiverID          INT             NOT NULL,
        DateReceived        DATE,
        AmountReceived      DECIMAL(10,2)   NOT NULL,
        CONSTRAINT FK_DonationReceiver_DonationID FOREIGN KEY (DonationID) REFERENCES Donation(DonationID),
        CONSTRAINT FK_DonationReceiver_ReceiverID FOREIGN KEY (ReceiverID) REFERENCES Receiver(ReceiverID)
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
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (11001, 1, 1001, '09-APR-2022', '343 Elgar Point', '10000')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (21007, 2, 1007, '19-DEC-2021', '687 Village Pass', '11700')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (31009, 3, 1009, '21-FEB-2022', '717 Mifflin Alley', '8500')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (41007, 4, 1007, '08-SEP- 2022', '687 Village Pass', '3500')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (51008, 5, 1008, '30-MAY-2022', '42 Autumn Leaf Court', '2090')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES 
    (61004, 6, 1004, '05-NOV-2021', '194 Brown Lane', '6300')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (71003, 7, 1003, '12-JAN-2022', '1996 Helena Point', '8000')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (81002, 8, 1002, '11-AUG-2022', '29141 Prairieview Place', '7600')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (91003, 9, 1003, '08-MAR-2022', '1996 Helena Point', '3500')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES 
    (101006, 10, 1006, '15-JUN-2022', '07948 Melody Circle', '5000')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (101007, 10, 1007, '14-FEB-2021', '3005 South Zenobia', '4590')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (81006, 8, 1006, '27-MAR-2022', '1996 Helena Point', '9560')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (91004, 9, 1004, '07-NOV-2022', '717 Mifflin Alley', '12900')
INTO Donation
    (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
VALUES
    (81004, 8, 1004, '06-DEC-2021', '1996 Helena Point', '4390')
SELECT 1 FROM dual;



--Data for Receiver Table 
--Note that Vietnam Children Association only distributes monetary donation by individual donors to organizations. Therefore, organization's name means receiver's name.

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


-- Data for DonationReceiver Table

INSERT ALL
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3001, 11001, 101, '11-JUN-2022', '1000')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3002, 21007, 102, '19-JUN-2022', '2200')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3003, 31009, 103, '01-MAY-2022', '1010')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3004, 41007, 104, '06-JUL-2022', '2020')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3005, 51008, 105, '24-JAN-2022', '1100')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3006, 61004, 106, '25-JAN-2022', '2400')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3007, 71003, 107, '10-MAY-2022', '2500')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3008, 81002, 108, '08-AUG-2022', '1000')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3009, 91003, 109, '08-MAY-2022', '2000')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3010, 101006, 110, '11-FEB-2022', '500')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3011, 81004, 102, '02-FEB-2022', '1030')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3012, 91004, 102, '09-JUL-2022', '5000')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3013, 91004, 102, '08-AUG-2021', '6000')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3014, 101006, 103, '09-SEP-2022', '2000')
INTO DonationReceiver
    (DonationReceiverID, DonationID, ReceiverID, DateReceived, AmountReceived)
VALUES
    (3015, 71003, 103, '28-JUN-2021', '4000')
SELECT 1 FROM dual;






----------------------------------------------------------------------------------------------------------------------------------------------------
--STORED PROCEDURES: This is VT Consultant Group's code to run some query for Vietnam Children Association

--Query 1:

CREATE OR REPLACE PROCEDURE CountCampaign_sp

AS CCA SYS_REFCURSOR; 


/*-------------------------------------------------------------------------------------------------
CREATED: Oct 31, 2022
AUTHOR:  Vy Vo and Thi Phan 
DESCRIPTION: Count how many campaigns an employee has joined. Show only employees who have participated in at least 1 campaign.

 Example: EXEC CountCampaign_sp
	 
----------------------------------------------------------------------------------------------------*/

BEGIN

OPEN CCA FOR

    SELECT 	    E.FirstName, E.LastName, Count(CE.CampaignID) AS TotalCampaignedJoined
    FROM    	CampaignEmployee CE
    INNER JOIN  Employee E
    ON          E.EmployeeID = CE.EmployeeID
    GROUP BY 	E.FirstName, E.LastName
    HAVING 	    COUNT(CE.CampaignID) > 0
    ORDER BY 	E.FirstName, E.LastName;

    
DBMS_SQL.RETURN_RESULT(CCA);    
    
END;
/



--Query 2 (Using Union):


CREATE OR REPLACE PROCEDURE RetreivePeopleData_sp

AS RPD SYS_REFCURSOR; 


/*-------------------------------------------------------------------------------------------------
CREATED: Oct 31, 2022
AUTHOR:  Vy Vo and Thi Phan 
DESCRIPTION: Used to retrieve name, and contact information of donors who have donated and employees 
who have participated in at least 1 campaign

 Example: EXEC RetreivePeopleData_sp
	
----------------------------------------------------------------------------------------------------*/

BEGIN

OPEN RPD FOR

    SELECT 	    CONCAT(D.FirstName, CONCAT(' ', D.LastName)) AS FullName, D.Email
    FROM		Donor D
    INNER JOIN  Donation DN
    ON          D.DonorID = DN.DonorID
    WHERE       D.DonorID IS NOT NULL
    
    UNION
    
    SELECT	    CONCAT(E.FirstName, CONCAT(' ', E.LastName)) AS FullName, E.Email
    FROM		Employee E
    INNER JOIN  CampaignEmployee CE
    ON          E.EmployeeID = CE.EmployeeID;
  
    
DBMS_SQL.RETURN_RESULT(RPD);    
    
END;
/



--Query 3 (Utilizing Nested Query)

CREATE OR REPLACE PROCEDURE FindDonor_sp

AS FD SYS_REFCURSOR; 


/*-------------------------------------------------------------------------------------------------
CREATED: Oct 31, 2022
AUTHOR:  Vy Vo and Thi Phan 
DESCRIPTION: Find the donor with the highest amount donated at once. Show donor first name, last name and the amount.

 Example: EXEC FindDonor_sp
	 
----------------------------------------------------------------------------------------------------*/

BEGIN

OPEN FD FOR

    SELECT      D.FirstName | | ' ' | | D.LastName AS DonorFullName, DN.AmountDonated
    FROM        Donor D
    INNER JOIN  Donation DN
    ON          D.DonorID = DN.DonorID
    WHERE       DN.AmountDonated = (SELECT MAX(DN.AmountDonated) 
                                    FROM Donation DN);


    
DBMS_SQL.RETURN_RESULT(FD);    
    
END;
/

--Query 4: Utilizing parameters (transaction query) 

CREATE OR REPLACE PROCEDURE InsertDonation_sp
(
	pCampaignDate			IN  DATE,
    pCampaignLocation       IN  VARCHAR2,
    pDonorFirstName         IN  NVARCHAR2,
	pDonorLastName		    IN  NVARCHAR2,
    pDonationLocation       IN  VARCHAR2,
    pAmountDonated          IN  DECIMAL
)

AS

/*-------------------------------------------------------------------------------------------------
CREATED: Oct 31, 2020
AUTHOR:  Vy Vo and Thi Phan 
DESCRIPTION: Used to insert data for new donation

 Example: 
        DECLARE 
            pCampaignDate		  DATE;
            pCampaignLocation     VARCHAR2(50);
            pDonorFirstName       NVARCHAR2(35);
            pDonorLastName		  NVARCHAR2(50);
            pDonationLocation     VARCHAR2(50);
            pAmountDonated        DECIMAL(10);  
            
            
        BEGIN
            InsertDonation_sp 
                ('18-JUL-22', '717 Mifflin Alley', 'Claire', 'Battersby', '3055 West Grand Ave', '5800');
        END;
        
        DELETE   
        FROM    Donation
        WHERE   DonationID = 91009;

----------------------------------------------------------------------------------------------------*/

    vDonorID	INT;
	vCampaignID	INT;

BEGIN 


	--Get the Donor's ID
	SELECT	D.DonorID INTO vDonorID
	FROM	Donor D
	WHERE	D.LastName = pDonorLastName
	AND		D.FirstName = pDonorFirstName;


	--Get the Campaign's ID
	SELECT		C.CampaignID INTO vCampaignID
	FROM		Campaign C
	WHERE		C.CampaignDate = pCampaignDate
	AND			C.CampaignLocation = pCampaignLocation;


	--Do the final insert
	INSERT INTO Donation
        (DonationID, DonorID, CampaignID, DonationDate, DonationLocation, AmountDonated)
	VALUES	
        (CONCAT(vDonorID, vCampaignID), vDonorID, vCampaignID, SYSDATE, pDonationLocation, pAmountDonated);

COMMIT;

END;
/


--Query 5 (Query using aggregate with having)

CREATE OR REPLACE PROCEDURE FindRepeatedDonor_sp

AS FRD SYS_REFCURSOR; 


/*-------------------------------------------------------------------------------------------------
CREATED: Oct 31, 2022
AUTHOR:  Vy Vo and Thi Phan 
DESCRIPTION: Find the donor who has donated more than 1 time. Show donors' full name and number of donation

 Example: EXEC FindRepeatedDonor_sp
	 
----------------------------------------------------------------------------------------------------*/

BEGIN

OPEN FRD FOR

    SELECT      D.FirstName | | ' ' | | D.LastName AS DonorFullName, COUNT(D.DonorID) AS NumberOfDonation
    FROM        Donor D
    INNER JOIN  Donation DN
    ON          D.DonorID = DN.DonorID
    GROUP BY    D.FirstName | | ' ' | | D.LastName
    HAVING      COUNT(D.DonorID) > 1
    ORDER BY    1,2;
    
DBMS_SQL.RETURN_RESULT(FRD);    
    
END;
/


--Query 6 (Using Case statement)

CREATE OR REPLACE PROCEDURE EvaluateCampaign_sp

AS EC SYS_REFCURSOR; 


/*-------------------------------------------------------------------------------------------------
CREATED: Oct 31, 2022
AUTHOR:  Vy Vo and Thi Phan 
DESCRIPTION: Evaluate the effectiveness of all campaigns. If the campaign has generated 1 donation, it is "Effective"; 
if it has not generated any donation, it is "Not Effective"; and if it has generated more than 1 donations, it is " Very Effective". 
Show CampaignID, DampaignDate and CampaignLocation

 Example: EXEC EvaluateCampaign_sp
	 
----------------------------------------------------------------------------------------------------*/

BEGIN

OPEN EC FOR

    
    SELECT          C.CampaignID, C.CampaignDate, COUNT(DN.CampaignID) AS NumberOfDonations, 
                    CASE WHEN  COUNT (DN.CampaignID) > 1
                        THEN  'Very Effective'
                        WHEN  COUNT (DN.CampaignID) = 1
                        THEN  'Effective'
                    ELSE 'Not Effective'
                    END AS CampaignEffectiveness
    FROM            Campaign C
    LEFT OUTER JOIN Donation DN
    ON              C.CampaignID = DN.CampaignID
    GROUP BY        C.CampaignID, CampaignDate 
    ORDER BY        COUNT(DN.CampaignID), C.CampaignDate;

    
DBMS_SQL.RETURN_RESULT(EC);    
    
END;
/

     
            
-- Query 7 

CREATE OR REPLACE PROCEDURE InsertEmployee_sp
(
	pFirstName			    IN  VARCHAR2,
    pLastName               IN  VARCHAR2,
    pEmail                  IN  VARCHAR2,
	pPhone      		    IN  NVARCHAR2
)

AS

/*-------------------------------------------------------------------------------------------------
CREATED: Oct 31, 2020
AUTHOR:  Vy Vo and Thi Phan 
DESCRIPTION: Used to insert data for new employees

 Example: 
        DECLARE 
        pFirstName	 VARCHAR2(30);
        pLastName    VARCHAR2(30);
        pEmail       VARCHAR2(30;
        pPhone       CHAR(12);
            
            
        BEGIN
            InsertEmployee_sp 
                ('Victoria', 'Vo', 'Victoria.Vo@ucdenver.edu', '720-812-7176');
        END;
        
        DELETE   
        FROM    Employee
        WHERE   EmployeeID = 2011;

----------------------------------------------------------------------------------------------------*/

    vEmployeeID	INT;


BEGIN 


	--Get the current highest Employee ID
	SELECT	E.EmployeeID INTO vEmployeeID
	FROM	Employee E
	WHERE	E.EmployeeID = (SELECT MAX (E.EmployeeID)
                            FROM   Employee E);


	--Do the final insert
	INSERT INTO Employee
        (EmployeeID, FirstName, LastName, Email, Phone)
	VALUES	
        (vEmployeeID + '1', pFirstName, pLastName, pEmail, pPhone);

COMMIT;

END;           
/


----------------------------------------------------------------------------------------------------------------------------------------------------
--VIEW: This is VT Consultant Group's code to run some query for Vietnam Children Association   

--Query 1:  

CREATE VIEW	AvgAmountReceived_vw

AS

/*-------------------------------------------------------------------------------------------------
CREATED: November 6, 2022
AUTHOR:  Vy Vo and Han Phan
DESCRIPTION: As one receiver have received one or more donation. This query is use to find the average amount received by each receiver.

 Example: SELECT    ReceiverID, OrganizationName, AvgAmountReceived 
		  FROM      AvgAmountReceived_vw;
	
----------------------------------------------------------------------------------------------------*/


SELECT      R.ReceiverID, R.OrganizationName, ROUND(AVG(DR1.AmountReceived)) AS AvgAmountReceived 
FROM        DonationReceiver DR1
INNER JOIN  Receiver R
ON          DR1.ReceiverID = R.ReceiverID
GROUP BY    R.ReceiverID, R.OrganizationName
ORDER BY    3;
/


CREATE OR REPLACE VIEW ThirdQuarterDonor_vw

AS  

/*-------------------------------------------------------------------------------------------------
CREATED: December 1, 2022
AUTHOR:  VT Group 
DESCRIPTION: Find the donors that donated in the third quarter of this year (2022).

EXAMPLE:    SELECT   FirstName, LastName
            FROM    ThirdQuarterDonor_vw;
----------------------------------------------------------------------------------------------------*/


SELECT      D.FirstName, D.LastName
FROM        Donor D
INNER JOIN  Donation DN
ON          D.DonorID = DN.DonorID     
WHERE       DN.DonationDate  BETWEEN '01-JUL-22' AND '30-SEP-22';


