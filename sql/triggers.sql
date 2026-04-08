DELIMITER //
CREATE TRIGGER check_balance_before_insert
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
   DECLARE current_balance DECIMAL(15,2);
   IF NEW.transaction_type IN ('Withdrawal', 'Transfer') THEN
      IF NEW.from_account_id is NULL THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'from_account_id is required';
      END IF;
      SELECT balance INTO current_balance
      FROM Accounts 
      WHERE account_id = NEW.from_account_id; 
      IF current_balance < NEW.amount THEN
         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
      END IF;
   END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER update_balance
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.transaction_type = 'Deposit' THEN
    UPDATE Accounts 
    SET balance = balance + NEW.amount 
    WHERE account_id = NEW.to_account_id;
    END IF;
    IF NEW.transaction_type = 'Withdrawal' THEN
    UPDATE Accounts 
    SET balance = balance - NEW.amount 
    WHERE account_id = NEW.from_account_id;
    END IF;
    IF NEW.transaction_type = 'Transfer' THEN
    UPDATE Accounts SET balance = balance - NEW.amount 
    WHERE account_id = NEW.from_account_id;
    UPDATE Accounts SET balance = balance + NEW.amount 
    WHERE account_id = NEW.to_account_id;     
    END IF;
END //
DELIMITER ;