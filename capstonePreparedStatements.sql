CREATE VIEW OrdersView AS SELECT orderID, quantity, totalCost FROM orders WHERE quantity > 2;

SELECT customers.customerID, customers.fullName, orders.orderID, orders.totalCost, menus.menuName, menuItems.courseName, menuItems.starterName 
FROM customers 
INNER JOIN orders ON customers.customerID = orders.customerID 
INNER JOIN menus ON orders.menuID = menus.menuID 
INNER JOIN menuItems ON menus.menuItemsID = menuItems.menuItemsID
ORDER BY orders.totalCost ASC;

SELECT menus.menuName FROM menus INNER JOIN orders ON orders.menuID = menus.menuID WHERE orders.quantity > 2;

CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(quantity) FROM orders;

PREPARE GetOrderDetail FROM 'SELECT orderID, quantity, totalCost FROM orders WHERE orderID = ?';
SET @id=1;
 EXECUTE GetOrderDetail USING @id;

CREATE PROCEDURE CancelOrder(id INT)
DELETE FROM orders WHERE orderID =id;