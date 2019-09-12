/*
Designers: Sina Lyon, Ivan Pavlov, Bassam Nasir Saeed, Yan Hui Ma 
@Sheridan College
*/

TRUNCATE TABLE cs_ProspectList;
DROP TABLE cs_ProspectList;

TRUNCATE TABLE cs_WorkOrder;
DROP TABLE cs_WorkOrder;

TRUNCATE TABLE cs_SalesInvoice;
DROP TABLE cs_SalesInvoice;

TRUNCATE TABLE cs_Customer;
DROP TABLE cs_Customer;

TRUNCATE TABLE cs_Options;
DROP TABLE cs_Options;

TRUNCATE TABLE cs_Insurance;
DROP TABLE cs_Insurance;

TRUNCATE TABLE cs_InvoiceOptions;
DROP TABLE cs_InvoiceOptions;

TRUNCATE TABLE cs_InvoiceTradeIn;
DROP TABLE cs_InvoiceTradeIn;

TRUNCATE TABLE cs_VehicleShipment;
DROP TABLE cs_VehicleShipment;

TRUNCATE TABLE cs_WorkList;
DROP TABLE cs_WorkList;

TRUNCATE TABLE cs_VehicleRecord;
DROP TABLE cs_VehicleRecord;

TRUNCATE TABLE cs_VehicleRecordOptions;
DROP TABLE cs_VehicleRecordOptions;

TRUNCATE TABLE cs_ServiceLog;
DROP TABLE cs_ServiceLog;


TRUNCATE TABLE cs_InventoryPurchase;
DROP TABLE cs_InventoryPurchase;

CREATE TABLE cs_Customer (
 CustName VARCHAR(15) NOT NULL,
 CustAddress VARCHAR (15) NOT NULL,  
 CustCity VARCHAR (15) NOT NULL,  
 CustState VARCHAR (20) NOT NULL,  
 CustPostalCode CHAR (6) NOT NULL,  
 CustWorkPhone VARCHAR (12),  
 CustHomePhone VARCHAR (12),  
 CONSTRAINT cs_customer_pk PRIMARY KEY(CustName)
);

CREATE TABLE cs_Options (
 OptionsCode CHAR(3) NOT NULL,
 OptionsDesc VARCHAR(20) NOT NULL,
 OptionsListPrice NUMBER(8,2) NOT NULL,
 OptionsSale NUMBER(8,2),
 CONSTRAINT cs_options_pk PRIMARY KEY(OptionsCode)
);

CREATE TABLE cs_Insurance (
 Coverage CHAR(2) NOT NULL,
 InvoiceNo CHAR(8) NOT NULL,
 CONSTRAINT cs_insurance_pk PRIMARY KEY(Coverage, InvoiceNo),
 CONSTRAINT cs_coverage_check CHECK (Coverage IN('FT', 'L', 'C', 'PD'))
);

CREATE TABLE cs_InvoiceOptions (
  OptionsCode CHAR(3) NOT NULL,
  InvoiceNo CHAR(8) NOT NULL,
  CONSTRAINT cs_invoiceopt_pk PRIMARY KEY(OptionsCode, InvoiceNo)
);

CREATE TABLE cs_InvoiceTradeIn (
 TradeInSerialNo VARCHAR(17),
 TradeInMake VARCHAR(15),
 TradeInModel VARCHAR(15),
 TradeinYear CHAR(4),
 CONSTRAINT cs_tradein_pk PRIMARY KEY(TradeInSerialNo)
);


CREATE TABLE cs_VehicleShipment (
  VehicleSerialNo VARCHAR(17) NOT NULL,
  Freight_Prep NUMBER(8,2) NOT NULL,
  Tax NUMBER(8,2) NOT NULL,
  LicenceFees NUMBER(8,2) NOT NULL,
  CONSTRAINT cs_vehicleshipment_pk PRIMARY KEY(VehicleSerialNo)
);

CREATE TABLE cs_WorkList (
 WorkToDo VARCHAR(100) NOT NULL,
 ServiceInvoiceNo CHAR(6) NOT NULL,
 CONSTRAINT cs_worklist_pk PRIMARY KEY(WorkToDo, ServiceInvoiceNo)
);

CREATE TABLE cs_InventoryPurchase (
 PurchaseInventoryNo CHAR(6) NOT NULL,
 PurchaseFrom VARCHAR(15) NOT NULL,
 PurchaseDate DATE NOT NULL,
 PurchaseCost NUMBER(8,2) NOT NULL,
 CONSTRAINT cs_inventorypurchase_pk PRIMARY KEY(PurchaseInventoryNo)
);

CREATE TABLE cs_VehicleRecord (
 VehicleSerialNo VARCHAR(17) NOT NULL,
 PurchaseInventoryNo CHAR(6) NOT NULL,
 VehicleMake VARCHAR(15) NOT NULL,
 VehicleModel VARCHAR(15) NOT NULL,
 VehicleYear CHAR(4) NOT NULL,
 VehicleColor VARCHAR(15) NOT NULL,
 VehicleTrim VARCHAR(15),
 VehicleListBasePrice NUMBER(8,2) NOT NULL,
 CONSTRAINT cs_vehicle_pk PRIMARY KEY(VehicleSerialNo),
 CONSTRAINT cs_purchaseinvno_fk FOREIGN KEY (PurchaseInventoryNo)
  REFERENCES cs_InventoryPurchase(PurchaseInventoryNo)
);

CREATE TABLE cs_VehicleRecordOptions (
 VehicleSerialNo VARCHAR(17) NOT NULL,
 OptionsCode CHAR(3) NOT NULL,
 CONSTRAINT cs_vehiclerecord_pk PRIMARY KEY(VehicleSerialNo, OptionsCode) 
);





CREATE TABLE cs_ServiceLog (
 InvoiceNo CHAR(8) NOT NULL,
 VehicleSerialNo VARCHAR(17) NOT NULL,
 ServiceLogDate DATE NOT NULL,
 CONSTRAINT cs_servicelog_pk PRIMARY KEY(InvoiceNo, VehicleSerialNo) 
);

CREATE TABLE cs_ProspectList (
    CustName VARCHAR(15) NOT NULL,
    WantBrand VARCHAR(15),
    WantModel VARCHAR(15),
    WantYear CHAR(4),
    WantColor VARCHAR(15),
    WantTrim VARCHAR(15),
    OptionsCode CHAR(3),
    CONSTRAINT pk_ProspectList PRIMARY KEY (WantBrand, WantModel, WantYear, WantColor, WantTrim),
    CONSTRAINT fk_custname FOREIGN KEY(CustName)
    REFERENCES cs_Customer(CustName),
    CONSTRAINT fk_ordercode FOREIGN KEY(OptionsCode)
    REFERENCES cs_Options(OptionsCode)
);

CREATE TABLE cs_SalesInvoice (
 InvoiceNo CHAR(8) NOT NULL,
 CustName VARCHAR(15) NOT NULL,
 VehicleSerialNo VARCHAR(17) NOT NULL,
 SalesInvoiceDate DATE NOT NULL,
 Salesman VARCHAR(15) NOT NULL,
 Discount NUMBER(8,2),
 Comission NUMBER(8,2) NOT NULL,
 Taxes NUMBER(8,2) NOT NULL,
 CONSTRAINT cs_salesinvoice_pk PRIMARY KEY(InvoiceNo),
 CONSTRAINT cs_custname_fk FOREIGN KEY (CustName)
 REFERENCES cs_Customer(CustName),
 CONSTRAINT cs_SerialNumber FOREIGN KEY (VehicleSerialNo)
 REFERENCES cs_VehicleRecord (VehicleSerialNo)
);


CREATE TABLE cs_WorkOrder (
 ServiceInvoiceNo CHAR(6),
 CustName VARCHAR(15) NOT NULL,
 VehicleSerialNo VARCHAR(17) NOT NULL,
 WorkDate DATE NOT NULL,
 Parts NUMBER(8,2) DEFAULT 0,
 Labor NUMBER(8,2) DEFAULT 0,
 Tax NUMBER(8,2) DEFAULT 0,
 CONSTRAINT cs_workorder_pk PRIMARY KEY(ServiceInvoiceNo),
 CONSTRAINT cs_orderCustName FOREIGN KEY (CustName) 
  REFERENCES cs_Customer(CustName),
 CONSTRAINT cs_vehicleserial_fk FOREIGN KEY (VehicleSerialNo) 
  REFERENCES cs_VehicleRecord(VehicleSerialNo)
);
