-- Week 2> Exercise: Create optimized queries to manage and analyze data

-- Task 1

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM Orders;
END;// 
DELIMITER ;

CALL GetMaxQuantity(); 

-- Task 2

PREPARE GetOrderDetail FROM 
'SELECT OrderID, Quantity, TotalCost FROM Orders 
WHERE OrderID = ?'

SET @id = 1;
EXECUTE GetOrderDetail USING @id;

-- Task 3

DELIMITER //
CREATE PROCEDURE CancelOrder(IN user_order_id INT)
BEGIN
DELETE FROM Orders WHERE OrderID = user_order_id;
END;//
DELIMITER ;

CALL CancelOrder(5);

