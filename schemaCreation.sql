CREATE TABLE BOOK (
    Title varchar(25),
    Author varchar(40),
    Genre varchar(25),
    ReleaseDate date,
    ISBN char(13),
    InventoryID char(6),
    Price decimal,
    Cost decimal,
    StoreID char(4),
    ShipmentID char(4),
    TransactionID char(4),
    PublisherID char(4),
    PRIMARY KEY (InventoryID)
);

CREATE TABLE PUBLISHER (
    ID char(4),
    Name varchar(25),
    Books char(13),
    Location varchar (75),
    PRIMARY KEY (ID)
);

CREATE TABLE EMPLOYEE (
  SSN char(9),
  First varchar(15),
  Last varchar(15),
  Position varchar(15),
  Salary varchar(15),
  Phone char(10),
  Email varchar(30),
  EndDate date,
  Manages varchar(20),
  WorksAt varchar(20),
  PRIMARY KEY (SSN)
);

CREATE TABLE CUSTOMER (
    ID char(4),
    First varchar(15),
    Last varchar(15),
    Email varchar(30),
    Phone char(10),
    PRIMARY KEY (ID)
);
