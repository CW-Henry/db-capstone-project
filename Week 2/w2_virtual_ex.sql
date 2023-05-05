-- Week 2> Exercise: Create a virtual table to summarize data

-- Task 1:

-- use LittleLemonDB;
-- CREATE VIEW OrderView AS SELECT OrderID, Quantity, TotalCost FROM Orders WHERE Quantity > 2;

-- Task 2:

-- SELECT c.CustomerDetailsID, c.CustomerName, 
-- o.OrderID, o.TotalCost, m.MenuName, 
-- mi.Course, mi.Starter FROM CustomerDetails c 
-- INNER JOIN
-- Orders o ON c.CustomerDetailsID = o.CustomerDetailsID
-- INNER JOIN 
-- Menu m ON o.MenuID = m.MenuID
-- INNER JOIN
-- MenuItems mi ON m.MenuItemID = mi.MenuItemID
-- ORDER BY o.TotalCost;

-- Task 3:

-- SELECT MenuName FROM Menu WHERE 
-- 2 < ANY(SELECT Quantity FROM Orders WHERE MenuID = Menu.MenuID);