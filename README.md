# 🏨 Hotel Reservation System Database

## 🌟 Project Overview
This project involves designing a relational database system for hotel management, aimed at efficiently handling customer bookings, room assignments, payments, and housekeeping tasks. It provides a scalable solution that supports both individual and group reservations, helping hotels streamline operations, reduce errors, and improve overall efficiency.


## 🎯 Business Problem
Hotels often face challenges managing bookings, ensuring accurate payment tracking, and efficiently allocating housekeeping resources. This system is designed to solve these challenges by:

• **Peak Demand Management**: Tracks room availability in real time to prevent double bookings and optimize occupancy during busy periods.<br/>
• **Accurate Payment Tracking**: Automates payment processing, ensuring real-time, error-free financial reporting.<br/>
• **Housekeeping Efficiency**: Automates housekeeping schedules, reducing room turnover time and improving operational efficiency.<br/>

## 🔑 Key Features
• **Customer Management & Reservation Management**: Efficiently tracks customer data, preferences, and multiple reservations.<br/>
• **Room Assignments**: Real-time tracking of room availability and status.<br/>
• **Payments**: Integrated payment processing and recording.<br/>
• **Housekeeping Assignments**: Streamlined housekeeping and maintenance scheduling.<br/>

## 🛠️ Database Structure
The database is built around seven main entities:<br/>

• **Customers**: Stores customer details, preferences, and history.<br/>
• **Reservations**: Tracks bookings, check-in/check-out dates, and group reservations.<br/>
• **Payments**: Manages transaction records related to reservations.<br/>
• **Hotel Rooms**: Contains information on room types, statuses, and availability.<br/>
• **Employees**: Stores data about hotel staff, including those responsible for cleaning.<br/>
• **Housekeeping Assignments**: Records which employees clean specific rooms and the status of these tasks.<br/>
• **Group Reservations**: Manages larger bookings with multiple rooms and special requests.<br/>

## 🧠 SQL Queries & Analysis
Here are a few examples of the SQL queries used in the project to address specific business problems:

• **Room Availability**:

>SELECT room_id, status FROM hotelrooms WHERE status = 'available' ORDER BY room_type;

_Insight: This query helps track which rooms are available for new bookings, allowing for efficient room allocation._

• **High-Value Reservations:**

>SELECT customer_id, reservation_id, amount 
>FROM payments 
>WHERE amount >= 400 
>ORDER BY amount DESC;

_Insight: This query identifies high-value customers, useful for targeted marketing and promotions._

• **Peak Booking Insights**:

>SELECT reservation_id, MAX(check_out - check_in) AS stay_duration<br/> 
>FROM reservations<br/> 
>GROUP BY reservation_id <br/>
>HAVING stay_duration > 5 <br/>
>ORDER BY stay_duration DESC;

_Insight: Helps identify guests with long stays, allowing the hotel to provide better service and plan staffing accordingly._

For more advanced SQL queries, check the [Advanced SQL Queries file](https://github.com/leemansing1102/Hotel-Booking-Database/blob/main/advanced-queries.sql). 

## 🏢 ER Diagram
<img width="724" alt="image" src="https://github.com/user-attachments/assets/7593fbdc-9acf-411b-923b-cead0ad74459">

_The ER diagram showcases relationships between key entities such as Customers, Reservations, Hotel Rooms, Payments, and Employees, demonstrating a well-structured relational database._

## 📊 Key Insights from the Project
• **Optimized Room Allocation**: By tracking room availability in real-time, the system helps minimize double bookings and ensures optimal room usage.<br/>
• **Improved Revenue Tracking**: Automated payment reconciliation processes reduce errors, helping hotels track revenue more effectively.<br/>
• **Housekeeping Efficiency**: Automated task assignment improves room turnover times, making rooms available for new guests faster.<br/>

## 🔍 Challenges Addressed
• **Data Integrity**: Ensured that customer and reservation data is consistent and accurate, particularly when handling group bookings.<br/>
• **Scalability**: Designed the system to scale easily, whether for a small boutique hotel or a large chain, without sacrificing performance.<br/>
• **Complex Queries**: Addressed the need for complex reporting (e.g., long-stay guests, high-value reservations) through advanced SQL queries.<br/>

## 💻 Technology Stack
• **Database:** MySQL<br/>
• **Tools**: SQL for query optimization, data retrieval, and business reporting.<br/>
• **ER Diagram**

### 💡 How to Use the System

1. **Clone the Repository**:
git clone https://github.com/yourusername/hotel-reservation-system-db.git<br/>
2. **Setup the Database**: Run the provided SQL scripts in [SQL Schema](https://github.com/leemansing1102/Hotel-Booking-Database/blob/main/sql-schema-setup) to create the necessary tables and relationships.<br/>
3. **Test Queries**: Use the SQL queries provided in the [Simple SQL Queries file](https://github.com/leemansing1102/Hotel-Booking-Database/blob/main/simple-queries.sql) [Advanced SQL Queries file](https://github.com/leemansing1102/Hotel-Booking-Database/blob/main/advanced-queries.sql). and  to generate key insights and reports for hotel operations.<br/>


