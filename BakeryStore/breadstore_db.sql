CREATE DATABASE IF NOT EXISTS breadstore_db;
USE breadstore_db;

CREATE TABLE bread (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(50),
    stock INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    expired DATE
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    addres TEXT,
    phone_number VARCHAR(15),
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255)
);

CREATE TABLE orders (
    id_orders INT AUTO_INCREMENT PRIMARY KEY,
    id_customers INT,
    id_employees INT,
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE,
    payment_method VARCHAR(50),
    FOREIGN KEY (id_customers) REFERENCES customers(id),
    FOREIGN KEY (id_employees) REFERENCES employees(id)
);

CREATE TABLE orders_detail (
    id_orders_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_orders INT,
    id_bread INT,
    total_quantity INT,
    total_price DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (id_orders) REFERENCES orders(id_orders),
    FOREIGN KEY (id_bread) REFERENCES bread(id)
);

INSERT INTO bread (name, type, stock, price, expired) VALUES
('Roti Tawar', 'Tawar', 50, 15000, '2025-07-30'),
('Roti Manis', 'Manis', 30, 12000, '2025-07-25');

INSERT INTO customers (name, email, phone_number) VALUES
('Andi', 'andi@example.com', '08123456789'),
('Budi', 'budi@example.com', '08123456780');

INSERT INTO employees (name, email, addres, phone_number, username, password) VALUES
('Admin', 'admin@bread.com', 'Jl. Mawar No.1', '08123456781', 'admin', 'admin123');
