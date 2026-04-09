DELIMITER //
CREATE PROCEDURE transfer_funds( IN from_id INT, IN to_id INT, IN amount DECIMAL(15,2) )
BEGIN
   START TRANSACTION;
   IF (SELECT balance FROM Accounts WHERE account_id = from_id) < amount THEN
      ROLLBACK;
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance for transfer';
   ELSE
      INSERT INTO Transactions (transaction_type, amount, description, status, transaction_date, from_account_id, to_account_id)
      VALUES ('Transfer', amount, 'Transfer', 'Completed', NOW(), from_id, to_id);
      COMMIT;
   END IF;
END //
DELIMITER ; 

DELIMITER //
CREATE PROCEDURE get_account_statement(IN acc_id INT, IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT transaction_id, transaction_type, amount, description, transaction_date, status
    FROM Transactions
    WHERE (from_account_id = acc_id OR to_account_id = acc_id)
    AND transaction_date BETWEEN start_date AND end_date;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE freeze_account(IN acc_id INT)
BEGIN
   DECLARE current_status VARCHAR(20);
   SELECT status INTO current_status FROM Accounts WHERE account_id = acc_id;
   IF current_status = 'Active' THEN
      UPDATE Accounts SET status = 'Frozen' WHERE account_id = acc_id;
   ELSE
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Account is not active';
   END IF;
END //
DELIMITER ;
