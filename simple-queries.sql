-- 1. Fetch all customer details
SELECT * FROM customers;

-- 2. Get a list of available rooms (status 'AV' means available)
SELECT room_ID, type_room, price 
FROM hotelrooms 
WHERE status = 'AV';

-- 3. View all reservations for a specific customer
-- Replace 'H5134789' with the desired customer ID
SELECT * 
FROM reservations 
WHERE cust_id = 'H5134789';

-- 4. Get the payment details for a specific reservation
-- Replace 'R123456' with the desired reservation ID
SELECT * 
FROM payment 
WHERE reservation_id = 'R123456';

-- 5. List all housekeeping tasks (rooms assigned to employees)
SELECT employee_ID, room_ID 
FROM HSK_Clean;

-- 6. List all reservations that are longer than 5 days
SELECT reservation_ID, checkin, checkout, (checkout - checkin) AS duration
FROM reservations
WHERE (checkout - checkin) > 5;

-- 7. Get all reservations for a specific date range
-- Replace '2023-09-01' and '2023-09-15' with desired date range
SELECT * 
FROM reservations 
WHERE checkin BETWEEN '2023-09-01' AND '2023-09-15';

-- 8. Get a list of all cancelled reservations
SELECT * 
FROM cancellation;

-- 9. View all rooms assigned to a specific reservation
-- Replace 'R123456' with the desired reservation ID
SELECT * 
FROM assignedrooms 
WHERE reservation_ID = 'R123456';

-- 10. Get employee details who cleaned a specific room
-- Replace 'R001' with the desired room ID
SELECT e.employee_ID, e.contact_num, e.contract_type 
FROM employees e
JOIN HSK_Clean h ON e.employee_ID = h.employee_ID
WHERE h.room_ID = 'R001';
