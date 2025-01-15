-- Active: 1736940135075@@127.0.0.1@5432@sql101
-- Création de la table Products
CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    Product VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2) NOT NULL
);

-- Création de la table Customers
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50),
    Score INTEGER CHECK (Score >= 0 AND Score <= 100)
);

-- Création de la table Employees
CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    BirthDate DATE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Salary DECIMAL(10, 2) NOT NULL,
    ManagerID INTEGER REFERENCES Employees(EmployeeID)
);

-- Création de la table Orders
CREATE TABLE Orders (
    OrderID SERIAL PRIMARY KEY,
    ProductID INTEGER REFERENCES Products(ProductID),
    CustomerID INTEGER REFERENCES Customers(CustomerID),
    SalesPersonID INTEGER REFERENCES Employees(EmployeeID),
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    OrderStatus VARCHAR(20) CHECK (OrderStatus IN ('Pending', 'Shipped', 'Delivered', 'Cancelled')),
    ShipAddress TEXT,
    BillAddress TEXT,
    Quantity INTEGER CHECK (Quantity > 0),
    CreationTime TIMESTAMP NOT NULL DEFAULT NOW()
);
