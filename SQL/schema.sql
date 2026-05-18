-- Database schema for Business Data Analysis Dashboard
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    OrderID INTEGER PRIMARY KEY,
    OrderDate DATE NOT NULL,
    Customer TEXT NOT NULL,
    Region TEXT NOT NULL,
    Category TEXT NOT NULL,
    Product TEXT NOT NULL,
    SalesChannel TEXT NOT NULL,
    Quantity INTEGER NOT NULL,
    UnitPrice NUMERIC(10,2) NOT NULL,
    Discount NUMERIC(5,2) NOT NULL,
    Revenue NUMERIC(10,2) NOT NULL,
    Cost NUMERIC(10,2) NOT NULL,
    Profit NUMERIC(10,2) NOT NULL
);
