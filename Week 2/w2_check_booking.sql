-- Week 2> Exercise: Create SQL queries to check available bookings based on user input

-- Task 1

-- INSERT INTO Bookings (BookingID, Date, TableNo, CustomerDetailsID)
-- VALUES (1, '2022-10-10', 5, 1),
-- (2, '2022-11-12', 3, 3),
-- (3, '2022-10-11', 2, 2),
-- (4, '2022-10-13', 2, 1);

-- Task 2

-- DELIMITER //
-- CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
-- BEGIN
-- IF EXISTS(SELECT CustomerDetailsID FROM Bookings
-- WHERE Date = booking_date AND TableNo = table_number) THEN
--     SET @status = CONCAT('Table ', table_number, ' is already booked');
-- ELSE SET @status = 'Booking Slot Available';
-- END IF;
-- SELECT @status AS 'Booking Status';
-- END;//
-- DELIMITER ;

-- CALL CheckBooking('2022-11-12', 3);  

-- Task 3

-- DELIMITER //
-- CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT)
-- BEGIN
-- START TRANSACTION;
-- INSERT INTO Bookings VALUES (11, booking_date, table_number, 1);
-- IF EXISTS(SELECT TableNo FROM Bookings WHERE Date = booking_date AND TableNo = table_number) THEN 
-- ROLLBACK;
-- SET @status = CONCAT('Table ', table_number, ' is already booked - booking cancelled');
-- ELSE
-- COMMIT;
-- SET @status = CONCAT('Table ', table_number, ' is booked successfully!');
-- END IF;
-- SELECT @status AS 'Booking Status';
-- END;//
-- DELIMITER ;

-- CALL AddValidBooking('2022-10-13', 2);
