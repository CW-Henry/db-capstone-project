-- Week 2> Exercise: Create SQL queries to add and update bookings

-- Task 1

DELIMITER //
CREATE PROCEDURE AddBooking(
IN booking_id INT,
IN customer_id INT,
IN table_number INT,
IN booking_date DATE)
BEGIN
INSERT INTO Bookings(BookingID, Date, TableNo, CustomerDetailsID) VALUES
(booking_id, booking_date, table_number, customer_id);
-- SELECT @message := 'New Booking added' AS 'Confirmation';
END;//
DELIMITER ;

CALL AddBooking(11, 2, 4, '2022-12-29');

-- Task 2

DELIMITER //
CREATE PROCEDURE UpdateBooking(
IN booking_id INT,
IN booking_date DATE)
BEGIN
UPDATE Bookings SET Date = booking_date WHERE BookingID = booking_id;
-- SELECT CONCAT('Booking ', booking_id, ' updated') AS 'Confirmation';
END;//
DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');

-- Task 3

DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = booking_id;
-- SELECT CONCAT('Booking ', booking_id, ' cancelled') AS 'Confirmation';
END;//
DELIMITER ;

CALL CancelBooking(9);