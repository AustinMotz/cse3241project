CREATE TABLE AUTHOR (
    Name varchar(25),
    PRIMARY KEY (Name)
);

CREATE TABLE WROTE(
    AuthorName varchar(25),
    ISBN char(13),
    FOREIGN KEY (AuthorName) REFERENCES AUTHOR(Name),
    FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN),
    PRIMARY KEY (AuthorName, ISBN)
);

CREATE TABLE BOOK (
    ISBN char(13),
    Title varchar(30),
    Publisher int,
    Year int,
    Genre varchar(25),
    FOREIGN KEY (Publisher) REFERENCES PUBLISHER(ID),
    primary key (ISBN)
);

CREATE TABLE BOOK_INVENTORY (
    ISBN char(13),
    InventoryID int,
    Price decimal,
    Cost decimal,
    StoreID int,
    ShipmentNumber int,
    TransactionNumber int,
    foreign key (ISBN) references BOOK(ISBN),
    foreign key (StoreID) references STORE(ID),
    foreign key (ShipmentNumber) references SHIPMENT(ShipmentNumber),
    foreign key (TransactionNumber) references TRANSACTION(TransactionNumber),
    primary key (InventoryID)
);

CREATE TABLE PUBLISHER (
    ID int,
    Name varchar(25),
    Location varchar (75),
    PRIMARY KEY (ID)
);

CREATE TABLE EMPLOYEE (
  SSN char(9),
  First varchar(15),
  Last varchar(15),
  Position varchar(15),
  Salary int,
  Phone char(10),
  Email varchar(30),
  EndDate date,
  StoreManagedID int,
  StoreWorkedAtID int,
  foreign key (StoreManagedID) references STORE(ID),
  foreign key (StoreWorkedAtID) references STORE(ID),
  PRIMARY KEY (SSN)
);

CREATE TABLE CUSTOMER (
    ID int,
    First varchar(15),
    Last varchar(15),
    Email varchar(30),
    Phone char(10),
    PRIMARY KEY (ID)
);

CREATE TABLE SHIPMENT (
    ShipmentNumber int,
    ArrivalDate date,
    OrderDate date,
    TrackingNumber int,
    Supplier varchar(30),
    SentToStoreID int,
    primary key (ShipmentNumber)
);

CREATE TABLE TRANSACTION (
    TransactionNumber int,
    TransactionDate date,
    TotalAmount decimal,
    StoreID int,
    CustomerID int,
    EmployeeSSN char(9),
    foreign key (CustomerID) references CUSTOMER(ID),
    foreign key (EmployeeSSN) references EMPLOYEE(SSN),
    primary key (TransactionNumber)
);

CREATE TABLE STORE (
    ID int,
    BackupLocation int,
    Location varchar(60),
    InOperation int,
    foreign key (ID) references STORE(ID),
    primary key (ID)
);

CREATE TABLE COMPETITOR (
    Address varchar(60),
    Company varchar(30),
    NearestID int,
    FOREIGN KEY (NearestID) REFERENCES STORE(ID),
    PRIMARY KEY (Company)
);

CREATE TABLE NEWS_OUTLET (
    CompanyName varchar(30),
    PRIMARY KEY (CompanyName)
);

CREATE TABLE ARTICLE (
    Name varchar(30),
    Date date,
    Company varchar(30),
    BookReferenced char(13),
    primary key (Name)
);