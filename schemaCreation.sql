CREATE TABLE AUTHOR (
    Name varchar(30),
    PRIMARY KEY (Name)
);

CREATE TABLE WROTE(
    AuthorName varchar(30),
    ISBN char(13),
    FOREIGN KEY (AuthorName) REFERENCES AUTHOR(Name),
    FOREIGN KEY (ISBN) REFERENCES BOOK(ISBN),
    PRIMARY KEY (AuthorName, ISBN)
);

CREATE TABLE BOOK (
    ISBN char(13),
    Title varchar(200),
    Publisher varchar(50),
    Year int,
    Genre varchar(25),
    primary key (ISBN)
);

CREATE TABLE BOOK_INVENTORY (
    ISBN char(13),
    InventoryID int,
    Price decimal,
    Cost decimal,
    StoreID int,
    ShipmentID int,
    TransactionNo int,
    foreign key (ISBN) references BOOK(ISBN),
    foreign key (StoreID) references STORE(StoreID),
    foreign key (ShipmentID) references SHIPMENT(ShipmentID),
    foreign key (TransactionNo) references TRANS(TransactionNo),
    primary key (InventoryID)
);

CREATE TABLE EMPLOYEE (
  SSN char(9),
  First varchar(15),
  Last varchar(15),
  Position varchar(15),
  Salary int,
  Phone char(11),
  Email varchar(40),
  EndDate date,
  Manages int,
  WorksAt int,
  foreign key (Manages) references STORE(StoreID),
  foreign key (WorksAt) references STORE(StoreID),
  PRIMARY KEY (SSN)
);

CREATE TABLE CUSTOMER (
    CustomerID int,
    First varchar(15),
    Last varchar(15),
    Email varchar(30),
    Phone char(11),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE SHIPMENT (
    ShipmentID int,
    ArrivalDate date,
    OrderDate date,
    TrackingNo int,
    Supplier varchar(30),
    SentTo int,
    foreign key (SentTo) references STORE(StoreID),
    primary key (ShipmentID)
);

CREATE TABLE TRANS (
    TransactionNo int,
    Date date,
    StoreID int,
    CustomerID int,
    EmployeeSSN char(9),
    foreign key (CustomerID) references CUSTOMER(CustomerID),
    foreign key (EmployeeSSN) references EMPLOYEE(SSN),
    primary key (TransactionNo)
);

CREATE TABLE STORE (
    StoreID int,
    BackupLocation int,
    Location varchar(60),
    InOperation int,
    foreign key (BackupLocation) references STORE(StoreID),
    primary key (StoreID)
);

CREATE TABLE COMPETITOR (
    Location varchar(90),
    Company varchar(30),
    NearestID int,
    FOREIGN KEY (NearestID) REFERENCES STORE(StoreID),
    PRIMARY KEY (Company)
);

CREATE TABLE NEWS_OUTLET (
    CompanyName varchar(30),
    PRIMARY KEY (CompanyName)
);

CREATE TABLE ARTICLE (
    Name varchar(30),
    Date date,
    Company varchar(50),
    BookReferenced char(10),
    primary key (Name)
);