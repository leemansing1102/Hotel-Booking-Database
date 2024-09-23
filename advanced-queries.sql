-- 1. List all customers who have made more than 1 reservation
SELECT c.name, COUNT(r.reservation_ID) AS reservation_count
FROM customers c
JOIN reservations r ON c.cust_ID = r.cust_id
GROUP BY c.name
HAVING COUNT(r.reservation_ID) > 1;

-- 2. Retrieve the total payment amount for each customer
SELECT c.name, SUM(p.amount) AS total_spent
FROM customers c
JOIN payment p ON c.cust_ID = p.cust_id
GROUP BY c.name
ORDER BY total_spent DESC;

-- 3. Find all rooms that have not been cleaned (i.e., not assigned to any housekeeping staff)
SELECT room_ID, type_room 
FROM hotelrooms hr
WHERE NOT EXISTS (
    SELECT 1 
    FROM HSK_Clean hc 
    WHERE hr.room_ID = hc.room_ID
);

-- 4. Get the list of reservations with special requests
SELECT r.reservation_ID, r.special_requests, c.name
FROM reservations r
JOIN customers c ON r.cust_id = c.cust_ID
WHERE r.special_requests IS NOT NULL;

-- 5. Find employees who have cleaned more than 2 rooms
SELECT e.employee_ID, e.name, COUNT(h.room_ID) AS rooms_cleaned
FROM employees e
JOIN HSK_Clean h ON e.employee_ID = h.employee_ID
GROUP BY e.employee_ID, e.name
HAVING COUNT(h.room_ID) > 2;

-- 6. Find customers who spent more than the average payment amount
SELECT c.name, p.amount
FROM customers c
JOIN payment p ON c.cust_ID = p.cust_ID
WHERE p.amount > (
    SELECT AVG(amount) FROM payment
);

-- 7. List the highest-paying customers and their payment details
SELECT c.name, MAX(p.amount) AS highest_payment
FROM customers c
JOIN payment p ON c.cust_ID = p.cust_ID
GROUP BY c.name
ORDER BY highest_payment DESC;

-- 8. Get the most frequently reserved room type
SELECT hr.type_room, COUNT(ar.room_ID) AS reservation_count
FROM hotelrooms hr
JOIN assignedrooms ar ON hr.room_ID = ar.room_ID
GROUP BY hr.type_room
ORDER BY reservation_count DESC
LIMIT 1;

-- 9. Find customers who stayed more than 10 days and their total payment amount
SELECT c.name, r.checkin, r.checkout, p.amount
FROM customers c
JOIN reservations r ON c.cust_ID = r.cust_id
JOIN payment p ON r.reservation_ID = p.reservation_id
WHERE (r.checkout - r.checkin) > 10;

-- 10. Get a list of reservations and the number of days between booking and check-in
SELECT r.reservation_ID, (r.checkin - r.date) AS days_to_checkin, c.name
FROM reservations r
JOIN customers c ON r.cust_id = c.cust_ID
WHERE (r.checkin - r.date) > 0
ORDER BY days_to_checkin DESC;

-- 11. List all reservations that were cancelled after the payment was processed
SELECT c.name, r.reservation_ID, p.pay_ID, can.cancel_ID
FROM customers c
JOIN reservations r ON c.cust_ID = r.cust_id
JOIN payment p ON r.reservation_ID = p.reservation_id
JOIN cancellation can ON can.reservation_id = r.reservation_ID
WHERE can.cancel_ID IS NOT NULL AND p.date < r.date;

-- 12. Find rooms that have been reserved but not cleaned during the reservation period
SELECT hr.room_ID, hr.type_room, r.reservation_ID
FROM hotelrooms hr
JOIN assignedrooms ar ON hr.room_ID = ar.room_ID
JOIN reservations r ON ar.reservation_ID = r.reservation_ID
WHERE NOT EXISTS (
    SELECT 1 
    FROM HSK_Clean hc 
    WHERE hc.room_ID = hr.room_ID
    AND hc.employee_ID IS NOT NULL
    AND hc.room_ID = ar.room_ID
);

-- 13. Get the most active customer in terms of reservations made
SELECT c.name, COUNT(r.reservation_ID) AS total_reservations
FROM customers c
JOIN reservations r ON c.cust_ID = r.cust_id
GROUP BY c.name
ORDER BY total_reservations DESC
LIMIT 1;

-- 14. Find the average number of people per reservation by travel purpose
SELECT r.travel_purpose, AVG(r.num_ppl) AS avg_people
FROM reservations r
GROUP BY r.travel_purpose
ORDER BY avg_people DESC;

-- 15. Get the total revenue generated from each room type
SELECT hr.type_room, SUM(p.amount) AS total_revenue
FROM hotelrooms hr
JOIN assignedrooms ar ON hr.room_ID = ar.room_ID
JOIN reservations r ON ar.reservation_ID = r.reservation_ID
JOIN payment p ON r.reservation_ID = p.reservation_id
GROUP BY hr.type_room
ORDER BY total_revenue DESC;
