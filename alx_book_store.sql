-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Create Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create Books 
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) 
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- Create Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Create Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Insert sample data (Optional)
INSERT INTO Authors (author_name) VALUES ('J.K. Rowling'), ('George R.R. Martin'), ('J.R.R. Tolkien');
INSERT INTO Books (title, author_id, price, publication_date) 
VALUES 
('Harry Potter', 1, 29.99, '1997-06-26'),
('A Game of Thrones', 2, 39.99, '1996-08-06'),
('The Lord of the Rings', 3, 49.99, '1954-07-29');

INSERT INTO Customers (customer_name, email, address) 
VALUES 
('Alice Johnson', 'alice@example.com', '123 Maple Street'),
('Bob Smith', 'bob@example.com', '456 Oak Street');

INSERT INTO Orders (customer_id, order_date) 
VALUES (1, '2024-10-01'), (2, '2024-10-15');

INSERT INTO Order_Details (order_id, book_id, quantity) 
VALUES (1, 1, 2), (1, 2, 1), (2, 3, 1);
