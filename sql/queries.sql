INSERT INTO Customers (first_name, last_name, email, phone, country)
VALUES ('Marco', 'Rossi', 'rossi.m@gmail.com', '+39 3334445556', 'Italy');

UPDATE Customers 
SET country = 'Germany' 
WHERE customer_id = 3;

DELETE FROM Customers 
WHERE email = 'rossi.m@gmail.com';

SELECT transaction_id, transaction_date, transaction_type 
FROM Transactions 
WHERE DATEDIFF(NOW(), transaction_date) <= 30;

SELECT transaction_type,SUM(amount) AS tot 
FROM Transactions 
GROUP BY transaction_type;

SELECT customer_id, first_name, last_name 
FROM Customers 
WHERE customer_id IN (
   SELECT customer_id 
   FROM Accounts 
   WHERE balance > (SELECT AVG(balance) 
   FROM Accounts)
);

SELECT c.customer_id, c.first_name, c.last_name, a.account_number, a.account_type, a.balance
FROM Customers c
INNER JOIN Accounts a ON c.customer_id = a.customer_id;

SELECT a.account_number, a.account_type, c.card_number, c.card_type
FROM Accounts a
LEFT JOIN Cards c ON c.account_id = a.account_id;

SELECT c.first_name, c.last_name, a.account_number, t.transaction_type, t.amount, t.transaction_date
FROM Customers c
INNER JOIN Accounts a ON c.customer_id = a.customer_id
INNER JOIN Transactions t ON t.from_account_id = a.account_id OR t.to_account_id = a.account_id;

SELECT account_type, AVG(balance) AS avg_balance 
FROM Accounts 
GROUP BY account_type 
HAVING AVG(balance) > 5000
ORDER BY avg_balance ASC;

SELECT transaction_id, amount, 
CASE 
   WHEN amount < 500 THEN 'Small'
   WHEN amount BETWEEN 500 AND 1000 THEN 'Medium'
   ELSE 'Large'
END AS transaction_size 
FROM Transactions; 