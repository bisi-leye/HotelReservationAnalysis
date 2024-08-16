---CREATE DATABASE mentorness
---USE mentorness
---import dataset as hotel reservation_table---

--- select_all_from hotel reservation_table---
SELECT *
FROM hotelreservation_table;

--- Total number of reservation in the dataset ---
SELECT COUNT(Booking_ID) as Total_reservations
FROM hotelreservation_table;

--- most popular meal plan among guests ---
SELECT type_of_meal_plan, COUNT(*) AS no_of_reservations
FROM hotelreservation_table
GROUP BY type_of_meal_plan
ORDER BY no_of_reservations DESC
LIMIT 1;

--- average price per room for reservations involving children ---
SELECT AVG(avg_price_per_room) AS Avg_price_with_children
FROM hotelreservation_table
WHERE no_of_children > 0;

--- Number_of_reservations made in_year_2018, the string_method was used because my date_is_in_text datatype ---
SELECT COUNT(*) AS number_of_2018_reservations
FROM hotelreservation_table
WHERE STR_TO_DATE(arrival_date, '%m/%d/%Y') >= '2018-01-01';

--- most commonly booked room ---
SELECT room_type_reserved, COUNT(*) AS number_of_bookings
FROM hotelreservation_table
GROUP BY room_type_reserved
ORDER BY number_of_bookings DESC
LIMIT 1;

--- number_of_reservations that fall on a weekend for (no_of_weekend_nights > 0) ---
SELECT COUNT(no_of_weekend_nights) AS total_weekend_reservations
FROM hotelreservation_table
WHERE no_of_weekend_nights > 0;

--- highest and lowest lead_time for reservations ---
SELECT MAX(lead_time) AS highest_lead_time, 
	   MIN(lead_time) AS lowest_lead_time
FROM hotelreservation_table;

--- the most common market segment type for reservations ---
SELECT market_segment_type, COUNT(*) AS no_of_segment_reservation
FROM hotelreservation_table
GROUP BY market_segment_type
ORDER BY no_of_segment_reservation DESC
LIMIT 1;

--- no_of_reservations that have a booking status of "Confirmed" ---
SELECT COUNT(booking_status) AS confirmed_bookings
FROM hotelreservation_table
WHERE booking_status = 'Not_Canceled';

--- total no_of_adults and children across all reservations ---
SELECT SUM(no_of_adults) AS total_no_of_adults, SUM(no_of_children) AS total_no_of_children
FROM hotelreservation_table;

--- average no_of_weekend_nights for reservations involving children ---
SELECT AVG(no_of_weekend_nights) AS avg_weekend_with_children
FROM hotelreservation_table
WHERE no_of_children > 0;

--- no_of_reservations that were made in each month of the year ---
SELECT MONTH(STR_TO_DATE(arrival_date, '%m/%d/%y')) AS month_number, COUNT(*) AS no_of_monthly_reservations
FROM hotelreservation_table
GROUP BY MONTH(STR_TO_DATE(arrival_date, '%m/%d/%y'))
ORDER BY month_number;

--- average no_of_nights (both weekend and weekday) spent by guests for each room_type ---
SELECT room_type_reserved, AVG(no_of_weekend_nights + no_of_week_nights) AS avg_no_of_nights
FROM hotelreservation_table
GROUP BY room_type_reserved;

--- For reservations involving children, what is the most common room_type, and what is the average price for that room_type? ---
SELECT room_type_reserved,
	COUNT(*) AS no_of_reservations, 
    AVG(avg_price_per_room) AS avg_room_type_price
FROM hotelreservation_table
WHERE no_of_children > 0
GROUP BY room_type_reserved
ORDER BY no_of_reservations DESC
LIMIT 1;

--- Find the market segment type that generates the highest average price per room ---
SELECT market_segment_type, AVG(avg_price_per_room) AS avg_price
FROM hotelreservation_table
GROUP BY market_segment_type
ORDER BY avg_price DESC
LIMIT 1;
