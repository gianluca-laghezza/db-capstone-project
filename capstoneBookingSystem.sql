INSERT INTO bookings VALUES (1,'2022-10-10',5,1,1),(2,'2022-11-12',3,3,1),(3,'2022-10-11',2,2,1),(4,'2022-10-13',2,1,1);

DELIMITER //
CREATE PROCEDURE CheckBooking(bookingDate DATE, tableNum INT)
BEGIN
 IF EXISTS (SELECT * FROM bookings WHERE date=bookingDate AND tableNumber=tableNum) THEN
  SELECT concat( 'Table ', tableNum, ' is booked');
 ELSE
  SELECT concat( 'Table ', tableNum, ' is not booked');
END IF;
END//
DELIMITER ;

CALL CheckBooking('2022-10-10',5)

DELIMITER //
CREATE PROCEDURE AddValidBookbookingsbookingIDing(bookingDate DATE, tableNum INT)
BEGIN
START TRANSACTION;
INSERT INTO bookings (date, tableNumber, customerID, staffID) VALUES (bookingDate, tableNum, 1, 1);

IF EXISTS (SELECT * FROM bookings WHERE date=bookingDate AND tableNumber=tableNum) THEN
  ROLLBACK;
  SELECT concat( 'Table ', tableNum, ' is already  booked');
 ELSE
  COMMIT;
  SELECT concat( 'Table ', tableNum, ' has been booked');
END IF;
END//

DELIMITER ;


CALL AddValidBooking('2023-10-10',5);

/*DROP PROCEDURE AddValidBooking;*/