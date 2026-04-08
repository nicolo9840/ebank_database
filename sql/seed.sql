INSERT INTO Customers (first_name, last_name, email, phone, date_of_birth, country, registration_date) 
VALUES ('Paolo', 'Attico', 'attico.p@gmail.com', '+39 3923754312', '1998-02-10', 'Italy', '2025-02-26');

INSERT INTO Customers (first_name, last_name, email, phone, date_of_birth, country, registration_date) 
VALUES ('Sara', 'Maglia', 'maglia.s@gmail.com', '+39 3892555612', '1975-12-04', 'Italy', '2024-09-15'); 

INSERT INTO Customers (first_name, last_name, email, phone, date_of_birth, country, registration_date) 
VALUES ('Ivan', 'Muschik', 'muschik.i@gmail.com', '+41 3437564368', '1966-08-15', 'Germany', '2025-12-22');

INSERT INTO Accounts (account_number, account_type, balance, status, opened_date, customer_id) VALUES ('IT84I020080950565756', 'Checking', 0, 'Active', '2025-03-14', 1); 

INSERT INTO Accounts (account_number, account_type, balance, status, opened_date, customer_id) VALUES ('IT84I020000756567249', 'Savings', 0, 'Active', '2025-03-10', 1); 

INSERT INTO Accounts (account_number, account_type, balance, status, opened_date, customer_id) VALUES ('IT86I500000758981644', 'Checking', 0, 'Frozen', '2024-10-22', 2); 

INSERT INTO Accounts (account_number, account_type, balance, status, opened_date, customer_id) VALUES ('IT77I030000758981523', 'Savings', 0, 'Active', '2025-06-29', 2); 

INSERT INTO Accounts (account_number, account_type, balance, status, opened_date, customer_id) VALUES ('DE54I037780356987684', 'Checking', 0, 'Active', '2026-01-20', 3);

INSERT INTO Cards (card_number, card_type, status, expiry_date, account_id)
VALUES ('4532-1127-3444-9010', 'Debit', 'Frozen', '2026-10-22', 2);

INSERT INTO Cards (card_number, card_type, status, expiry_date, account_id)
VALUES ('2886-5555-4269-4565', 'Credit', 'Active', '2028-01-20', 4);

INSERT INTO Cards (card_number, card_type, status, expiry_date, account_id)
VALUES ('2323-4462-6591-3335', 'Debit', 'Active', '2027-03-14', 5);

INSERT INTO Transactions (transaction_type, amount, description, status, transaction_date, from_account_id, to_account_id)
VALUES 
('Deposit', 3000.00, 'Initial deposit', 'Completed', '2024-10-29  09:23:32', NULL, 2),
('Deposit', 2000.00, 'Deposit', 'Completed', '2025-05-15 14:25:06', NULL, 5),
('Deposit', 335.50, 'First deposit', 'Completed', '2026-01-21 17:34:57', NULL, 4),
('Withdrawal', 150, 'ATM withdrawal', 'Completed', '2025-02-15 12:13:24', 2, NULL),
('Withdrawal', 200, 'ATM', 'Completed', '2026-02-15 16:54:31', 4, NULL),
('Transfer', 1800, 'Monthly transfer', 'Completed', '2025-03-17 10:23:19', 2, 1),
('Transfer', 850, 'Savings', 'Completed', '2025-09-16 19:35:48', 5, 1),
('Transfer', 900, 'Birthday present', 'Completed', '2026-03-10 09:12:56', 5, 4);