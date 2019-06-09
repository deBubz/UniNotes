/* Database Fundamentals, Assignment Part D, Autumn 2019) */
/* Author:      Bao Hoang */
/* Email:       Bao.T.Hoang@student.uts.edu.au */
/* ScriptName:  insertName*/
/* Purpose:     Basic PgSql scritp for deliveroo database containing 3 related tables*/
/* Date:        insert date */
/* Note:        Due to the limitation of only allowing 3 tables for the script,
                The presented tables in this script are moddified to better
                fit the requirements.*/

-- DROP
DROP TABLE ordermeal_t;
DROP TABLE ordermeal_t;
DROP TABLE meal_t;
-- NOTE: cascade incase of there are dependant tables

-- 2.a CREATE / INSERT

-- 2.a.1 order_t
CREATE TABLE order_t(
    orderid         VARCHAR(8),
    orderdate       DATE,
    ordertime       TIME,
    orderstatus     VARCHAR(10),
    userid          VARCHAR(8),
    addressid       VARCHAR(8),
    paymentid       VARCHAR(8),
    CONSTRAINT Order_PK PRIMARY KEY(orderid)
);
-- NOTE: userid,addressid, payment will be a foreign key if there is a user_t

-- date format: yyyy-mm-dd
-- time format: hh:mm:ss
INSERT INTO order_t VALUES ('o0000506', '2018-12-18', '13:14:15', 'Delivered', 'c0010101', 'ad091725', 'p0012388');
INSERT INTO order_t VALUES ('o0000510', '2019-01-16', '23:01:59', 'Delivered', 'c0010101', 'ad091725', 'p0012385');
INSERT INTO order_t VALUES ('o0000525', '2019-02-02', '10:57:05', 'PickedUp','c0011111', 'ad008232', 'p0011156');
INSERT INTO order_t VALUES ('o0000527', '2019-02-02', '11:05:01', 'Pending', 'c0010287', 'ad012993', 'p0072615');
INSERT INTO order_t VALUES ('o0000528', '2019-02-02', '11:07:10', 'Pending', 'c0010101','ad099181', 'p0012388');

-- 2.a.2 meal_t
CREATE TABLE meal_t(
    mealid          VARCHAR(8),
    restaurant      VARCHAR(20),
    mealdesc        VARCHAR(25),
    mealstndprice   real,
    CONSTRAINT Meal_PK PRIMARY KEY (mealid)   
);
-- NOTE: restaurantid will be a foreign key if there is a restaurant_t;

INSERT INTO meal_t VALUES ('m0004137','Tommy\'s Kebab','Beef Snack Pack',15.99);
INSERT INTO meal_t VALUES ('m0004138','Tommy\'s Kebab','Chicken Snack Pack',16.99);
INSERT INTO meal_t VALUES ('m0004139','Tommy\s Kebab','Chips',6.99);
INSERT INTO meal_t VALUES ('m0010940','Maccas','Big Mac Burger',5.99);
INSERT INTO meal_t VALUES ('m0010935','Maccas','Frozen Coke',1.00);

-- 2.a.3 ordermeal_t-- 2.a.2 ordermeal_t
CREATE TABLE ordermeal_t(
    orderid         VARCHAR(8),
    mealid          VARCHAR(8),
    quantity        INT,
    CONSTRAINT OrderMeal_PK PRIMARY KEY (orderid, mealid),
    CONSTRAINT OrderMeal_Fk1 FOREIGN KEY (orderid) REFERENCES order_t,
    CONSTRAINT OrderMeal_FK2 FOREIGN KEY (mealid) REFERENCES meal_t
);
-- data type tiny int does not exist in pgsql :/

INSERT INTO ordermeal_t VALUES ( 'o0000528', 'm0004137', 2);
INSERT INTO ordermeal_t VALUES ( 'o0000528', 'm0004138', 1);
INSERT INTO ordermeal_t VALUES ( 'o0000528', 'm0004139', 3);
INSERT INTO ordermeal_t VALUES ( 'o0000510', 'm0004139', 1);
INSERT INTO ordermeal_t VALUES ( 'o0000525', 'm0004137', 2);
INSERT INTO ordermeal_t VALUES ( 'o0000527', 'm0010940', 2);
INSERT INTO ordermeal_t VALUES ( 'o0000506', 'm0010935', 2);

-- 2.b.1 Question:
-- SELECT * statement
SELECT * FROM order_t;

--  2.b.1 result table

--  orderid  | orderdate  | ordertime | orderstatus |  userid  | addressid | paymentid 
-- ----------+------------+-----------+-------------+----------+-----------+-----------
--  o0000506 | 2018-12-18 | 13:14:15  | Delivered   | c0010101 | ad091725  | p0012388
--  o0000510 | 2019-01-16 | 23:01:59  | Delivered   | c0010101 | ad091725  | p0012385
--  o0000525 | 2019-02-02 | 10:57:05  | PickedUp    | c0011111 | ad008232  | p0011156
--  o0000527 | 2019-02-02 | 11:05:01  | Pending     | c0010287 | ad012993  | p0072615
--  o0000528 | 2019-02-02 | 11:07:10  | Pending     | c0010101 | ad099181  | p0012388


-- 2.b.2 Question:
-- SELECT * statement
SELECT * FROM meal_t;

--  2.b.2 result table

--   mealid  |  restaurant   |      mealdesc      | mealstndprice 
-- ----------+---------------+--------------------+---------------
--  m0004137 | Tommy's Kebab | Beef Snack Pack    |         15.99
--  m0004138 | Tommy's Kebab | Chicken Snack Pack |         16.99
--  m0004139 | Tommys Kebab  | Chips              |          6.99
--  m0010940 | Maccas        | Big Mac Burger     |          5.99
--  m0010935 | Maccas        | Frozen Coke        |             1

-- 2.b.3 Question:
-- SELECT * statement
SELECT * FROM ordermeal_t;

--  2.b.3 result table

--  orderid  |  mealid  | quantity 
-- ----------+----------+----------
--  o0000528 | m0004137 |        2
--  o0000528 | m0004138 |        1
--  o0000528 | m0004139 |        3
--  o0000510 | m0004139 |        1
--  o0000525 | m0004137 |        2
--  o0000527 | m0010940 |        2
--  o0000506 | m0010935 |        2


-- 3.a Question: Select Statement with GroupBy
-- Count the number of orders each user made

SELECT DISTINCT userid, COUNT(orderid) AS OrderCount
FROM order_t GROUP BY userid;

--  3.a result table
-----------------------
--   userid  | ordercount 
-- ----------+------------
--  c0010101 |          3
--  c0010287 |          1
--  c0011111 |          1

-- 3.b Question: Inner Join
-- show the details of meals ordered by user c0010101

SELECT * FROM meal_t 
WHERE mealid IN (
    SELECT mealid FROM order_t o INNER JOIN ordermeal_t om
    ON o.orderid = om.orderid 
    WHERE userid = 'c0010101');
-- join statement in the subquery

--  3.b result table
---------------------------------------------------------------
--   mealid  |  restaurant   |      mealdesc      | mealstndprice 
-- ----------+---------------+--------------------+---------------
--  m0004137 | Tommy's Kebab | Beef Snack Pack    |         15.99
--  m0004138 | Tommy's Kebab | Chicken Snack Pack |         16.99
--  m0004139 | Tommys Kebab  | Chips              |          6.99
--  m0010935 | Maccas        | Frozen Coke        |             1


-- 3.c Question: Subquery
-- show details of all orders that bought the 'Beef Snack Pack'

SELECT o.orderid, o.orderdate, o.ordertime, o.orderstatus
FROM order_t o, ordermeal_t om 
WHERE   o.orderid = om.orderid AND 
        om.mealid = (
            SELECT mealid FROM meal_t 
            WHERE mealdesc ='Beef Snack Pack');

--  3.c result table
-------------------------------------------------
--  orderid  | orderdate  | ordertime | orderstatus 
-- ----------+------------+-----------+-------------
--  o0000525 | 2019-02-02 | 10:57:05  | PickedUp
--  o0000528 | 2019-02-02 | 11:07:10  | Pending