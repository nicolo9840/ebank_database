CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    date_of_birth DATE,
    registration_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    country VARCHAR(50)
);

CREATE TABLE Accounts (
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) NOT NULL UNIQUE,
    account_type VARCHAR(20) NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    status VARCHAR(20) NOT NULL DEFAULT 'Active',
    opened_date DATE NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Cards ( 
    card_id INT AUTO_INCREMENT PRIMARY KEY, 
    card_number VARCHAR(20) NOT NULL UNIQUE, 
    card_type VARCHAR(20) NOT NULL, 
    status VARCHAR(20) NOT NULL DEFAULT 'Active', 
    expiry_date DATE NOT NULL, 
    account_id INT NOT NULL, 
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) 
);

CREATE TABLE Transactions ( 
    transaction_id INT AUTO_INCREMENT PRIMARY KEY, transaction_type VARCHAR(20) NOT NULL, 
    amount DECIMAL(15, 2) NOT NULL, 
    description VARCHAR(250), 
    transaction_date DATETIME NOT NULL DEFAULT NOW(), 
    status VARCHAR(20) NOT NULL DEFAULT 'Pending', from_account_id INT NULL, 
    to_account_id INT NULL,
    FOREIGN KEY (from_account_id) REFERENCES Accounts(account_id), 
    FOREIGN KEY (to_account_id) REFERENCES Accounts(account_id) 
);