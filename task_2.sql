-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the database
USE alx_book_store;

-- Create `authors` table
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Create `books` table
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL,
    author_id INT,
    CONSTRAINT fk_books_author FOREIGN KEY (author_id) 
    REFERENCES authors(author_id) 
    ON DELETE SET NULL
);

-- Create `customers` table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20)
);

-- Create `orders` table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) 
    REFERENCES customers(customer_id) 
    ON DELETE CASCADE
);

-- Create `order_details` table
CREATE TABLE IF NOT EXISTS order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_order_details_order FOREIGN KEY (order_id) 
    REFERENCES orders(order_id) 
    ON DELETE CASCADE,
    CONSTRAINT fk_order_details_book FOREIGN KEY (book_id) 
    REFERENCES books(book_id) 
    ON DELETE RESTRICT
);
