/*
Designers: Sina Lyon, Ivan Pavlov, Bassam Nasir Saeed, Yan Hui Ma 
@Sheridan College
*/
INSERT INTO cs_inventorypurchase
 VALUES ('J43294', 'Jaguar', '1997-01-05', 59000.00);
 
INSERT INTO cs_customer
 VALUES ('Bugs Bunny', '24 Carrot Lane', 'Looneysville', 'California', '55555',
 '890-453-5421', '890-453-5421');

INSERT INTO cs_vehiclerecord
 VALUES ('J97UX301', 'J43294', 'Jaguar', 'UX', '1997', 'Black', 'White', 69990.00);

INSERT INTO cs_options
 VALUES ('S24', 'Sun Roof', 349.00, 320.00);
 
INSERT INTO cs_prospectlist
 VALUES ('Bugs Bunny', 'Mercedez Benz', 'C300', '2018', 'Red',
 'Black Leather', '');
 
INSERT INTO cs_workorder
 VALUES ('W21642', 'Bugs Bunny', 'J97UX301', '1997-02-11', 
 0, 0, 0);
 
INSERT INTO cs_salesinvoice
 VALUES ('S1239', 'Bugs Bunny', 'J97UX301', '1997-01-14', 'Mark Smith',
 3200.00, 1500.00, 10072.20);
 
INSERT INTO cs_insurance
 VALUES ('L', 'S1239');
 
INSERT INTO cs_invoiceoptions
 VALUES ('S24', 'S1239');

INSERT INTO cs_invoicetradein
 VALUES ('M97CL701', 'Mercedez Benz', 'JL', '1997');

INSERT INTO cs_vehicleshipment
 VALUES ('J97UX301', 4000.00, 10072.20, 0);
 
INSERT INTO cs_worklist
 VALUES ('Find squeak, Tighten seat, Replace lost screw', 'W21642');
 
INSERT INTO cs_vehiclerecordoptions
 VALUES ('J97UX301', 'S24');
 
COMMIT;
