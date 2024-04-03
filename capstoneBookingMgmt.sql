
CREATE PROCEDURE AddBooking(bookingId INT, customerId INT, bookingDate DATE, tableNumber INT)
INSERT INTO bookings VALUES(bookingId, bookingDate, tableNumber, customerId, 1);

CALL AddBooking(6,1,'2021-01-01',1);


CREATE PROCEDURE UpdateBooking(ID INT, bookingDate DATE)
UPDATE bookings SET date = bookingDate WHERE bookingID = ID;


CALL UpdateBooking(6, '2021-01-02');


CREATE PROCEDURE CancelBooking(ID INT)
DELETE FROM bookings  WHERE bookingID = ID;

CALL CancelBooking(12);
