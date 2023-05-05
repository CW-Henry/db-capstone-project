-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_capstone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_capstone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_capstone` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8mb3 ;
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` ;
USE `db_capstone` ;

-- -----------------------------------------------------
-- Table `db_capstone`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone`.`CustomerDetails` (
  `CustomerDetailsID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `ContactDetails` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerDetailsID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `TableNo` INT NOT NULL,
  `CustomerDetailsID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerDetailsID` ASC) VISIBLE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerDetailsID`)
    REFERENCES `db_capstone`.`CustomerDetails` (`CustomerDetailsID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone`.`OrderDeliveryStatus` (
  `OrderDeliveryStatusID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `Status` INT NOT NULL,
  PRIMARY KEY (`OrderDeliveryStatusID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `Starter` VARCHAR(45) NOT NULL,
  `Course` VARCHAR(45) NOT NULL,
  `Drink` VARCHAR(45) NOT NULL,
  `Dessert` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone`.`StaffInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone`.`StaffInfo` (
  `StaffInfoID` INT NOT NULL,
  `StaffRole` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  PRIMARY KEY (`StaffInfoID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_capstone`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_capstone`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL NOT NULL,
  `OrderDeliveryStatusID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `CustomerDetailsID` INT NOT NULL,
  `StaffInfoID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `status_id_fk_idx` (`OrderDeliveryStatusID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerDetailsID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`StaffInfoID` ASC) VISIBLE,
  CONSTRAINT `status_id_fk`
    FOREIGN KEY (`OrderDeliveryStatusID`)
    REFERENCES `db_capstone`.`OrderDeliveryStatus` (`OrderDeliveryStatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `db_capstone`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `customer_id_fk`
    FOREIGN KEY (`CustomerDetailsID`)
    REFERENCES `db_capstone`.`CustomerDetails` (`CustomerDetailsID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffInfoID`)
    REFERENCES `db_capstone`.`StaffInfo` (`StaffInfoID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB;

USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`CustomerDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`CustomerDetails` (
  `CustomerDetailsID` INT NOT NULL,
  `CustomerName` VARCHAR(45) NOT NULL,
  `ContactDetails` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerDetailsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `Date` DATE NOT NULL,
  `TableNo` INT NOT NULL,
  `CustomerDetailsID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customer_id_fk_idx` (`CustomerDetailsID` ASC) VISIBLE,
  CONSTRAINT `customer_id_booking_fk`
    FOREIGN KEY (`CustomerDetailsID`)
    REFERENCES `LittleLemonDB`.`CustomerDetails` (`CustomerDetailsID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `Course` VARCHAR(45) NOT NULL,
  `Starter` VARCHAR(45) NOT NULL,
  `Dessert` VARCHAR(45) NOT NULL,
  `Drink` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menu` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(45) NOT NULL,
  `MenuItemID` INT NOT NULL,
  `MenuName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `menu_item_id_fk_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `menu_item_id_fk`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `OrderDeliveryStatusID` INT NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `Status` INT NOT NULL,
  PRIMARY KEY (`OrderDeliveryStatusID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`StaffInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`StaffInfo` (
  `StaffInfoID` INT NOT NULL,
  `StaffRole` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  PRIMARY KEY (`StaffInfoID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(10,0) NOT NULL,
  `OrderDeliveryStatusID` INT NOT NULL,
  `MenuID` INT NOT NULL,
  `CustomerDetailsID` INT NOT NULL,
  `StaffInfoID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  INDEX `status_id_fk_idx` (`OrderDeliveryStatusID` ASC) VISIBLE,
  INDEX `menu_id_fk_idx` (`MenuID` ASC) VISIBLE,
  INDEX `customer_id_fk_idx` (`CustomerDetailsID` ASC) VISIBLE,
  INDEX `staff_id_fk_idx` (`StaffInfoID` ASC) VISIBLE,
  CONSTRAINT `customer_id_order_fk`
    FOREIGN KEY (`CustomerDetailsID`)
    REFERENCES `LittleLemonDB`.`CustomerDetails` (`CustomerDetailsID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `menu_id_fk`
    FOREIGN KEY (`MenuID`)
    REFERENCES `LittleLemonDB`.`Menu` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id_fk`
    FOREIGN KEY (`StaffInfoID`)
    REFERENCES `LittleLemonDB`.`StaffInfo` (`StaffInfoID`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `status_id_fk`
    FOREIGN KEY (`OrderDeliveryStatusID`)
    REFERENCES `LittleLemonDB`.`OrderDeliveryStatus` (`OrderDeliveryStatusID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `littlelemondb` ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- procedure AddBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `AddBooking`(
IN booking_id INT,
IN customer_id INT,
IN table_number INT,
IN booking_date DATE)
BEGIN
INSERT INTO Bookings(BookingID, Date, TableNo, CustomerDetailsID) VALUES
(booking_id, booking_date, table_number, customer_id);
SELECT @message := 'New Booking added' AS 'Confirmation';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure AddValidBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `AddValidBooking`(IN booking_date DATE, IN table_number INT)
BEGIN
START TRANSACTION;
INSERT INTO Bookings VALUES (11, booking_date, table_number, 1);
IF EXISTS(SELECT TableNo FROM Bookings WHERE Date = booking_date AND TableNo = table_number) THEN 
ROLLBACK;
SET @status = CONCAT('Table ', table_number, ' is already booked - booking cancelled');
ELSE
COMMIT;
SET @status = CONCAT('Table ', table_number, ' is booked successfully!');
END IF;
SELECT @status AS 'Booking Status';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `CancelBooking`(IN booking_id INT)
BEGIN
DELETE FROM Bookings WHERE BookingID = booking_id;
SELECT CONCAT('Booking ', booking_id, ' cancelled') AS 'Confirmation';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `CancelOrder`(IN user_order_id INT)
BEGIN
DELETE FROM Orders WHERE OrderID = user_order_id;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CheckBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `CheckBooking`(IN booking_date DATE, IN table_number INT)
BEGIN
IF EXISTS(SELECT CustomerDetailsID FROM Bookings
WHERE Date = booking_date AND TableNo = table_number) THEN
    SET @status = CONCAT('Table ', table_number, ' is already booked');
ELSE SET @status = 'Booking Slot Available';
END IF;
SELECT @status AS 'Booking Status';
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `GetMaxQuantity`()
BEGIN
SELECT MAX(Quantity) AS 'Max Quantity in Order' FROM Orders;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateBooking
-- -----------------------------------------------------

DELIMITER $$
USE `LittleLemonDB`$$
CREATE DEFINER=`admin1`@`%` PROCEDURE `UpdateBooking`(
IN booking_id INT,
IN booking_date DATE)
BEGIN
UPDATE Bookings SET Date = booking_date WHERE BookingID = booking_id;
SELECT CONCAT('Booking ', booking_id, ' updated') AS 'Confirmation';
END$$

DELIMITER ;
USE `littlelemondb` ;

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondb`.`orderview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`orderview` (`OrderID` INT, `Quantity` INT, `TotalCost` INT);

-- -----------------------------------------------------
-- View `littlelemondb`.`orderview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondb`.`orderview`;
USE `littlelemondb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`admin1`@`%` SQL SECURITY DEFINER VIEW `littlelemondb`.`orderview` AS select `littlelemondb`.`orders`.`OrderID` AS `OrderID`,`littlelemondb`.`orders`.`Quantity` AS `Quantity`,`littlelemondb`.`orders`.`TotalCost` AS `TotalCost` from `littlelemondb`.`orders` where (`littlelemondb`.`orders`.`Quantity` > 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
