create database Ola;
use Ola;
select * from bookings;

#1 retrive all Sucessful Bookings;
create view Sucessful_Bookings as
select * from bookings 
where Booking_Status= 'Success';
#1 retrive all Sucessful Bookings;
select * from Sucessful_Bookings;

#2 find the average ride distance for each vehical type;
create view ride_distance_for_each_vehical as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type; 
#2 find the average ride distance for each vehical type;
select * from ride_distance_for_each_vehical;

#3 get the total number of canceled rides by customer:
create view canceled_rides_by_customer as
select count(*) from bookings where Booking_Status= 'Canceled by Customer';
#3 get the total number of canceled rides by customer:
select * from canceled_rides_by_customer;

#4 list the top 5 customer who booked the highest number of rides:
create view top_5_customer as
select Customer_ID, count(Booking_ID) as total_rides
from bookings group by Customer_id
order by Total_rides desc limit 5;
#4 list the top 5 customer who booked the highest number of rides:
select * from top_5_customer;

#5 get the number of rides cancelled due to personal and car-related issues:
create view Canceled_Rides_by_Driver_P_C_Issue as
select count(*) from bookings where Canceled_Rides_by_Driver = 'Personal and car-related issue';
#5 get the number of rides cancelled due to personal and car-related issues:
select * from  Canceled_Rides_by_Driver_P_C_Issue;

#6 find the maximum and minimum driver ratings for prime sedan bookings;
create view maximum_and_minimum_driver_ratings as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating from bookings 
where vehicle_Type = 'Prime Sedan';
#6 find the maximum and minimum driver ratings for prime sedan bookings;
select * from maximum_and_minimum_driver_ratings;

#7 retieve all rides where payments was using UPI:
create view UPI_Payment as
select count(*) from bookings where Payment_Method = 'UPI';
#7 retieve all rides where payments was using UPI:
select * from UPI_Payment;

#8 find the average customer ratings per vehicle type:
create view average_customer_ratings as
select Vehicle_Type, avg(Customer_Rating) as avg_Customer_Rating from bookings 
group by Vehicle_Type;
#8 find the average customer ratings per vehicle type:
select * from average_customer_ratings;

#9 calcutale the total booking value of rides completed successfully:
create view total_successful_Ride_value as
select sum(Booking_Value) as total_successful_Ride_value from bookings
where Booking_Status = 'Successfully';
#9 calcutale the total booking value of rides completed successfully:
select * from total_successful_Ride_value;

#10 list all incomplete rides along with the reason;
create view incomplete_Rides_Reason as
select Booking_ID, incomplete_Rides_Reason from bookings
where Incomplete_Rides ='Yes'; 
#10 list all incomplete rides along with the reason;
select * from incomplete_Rides_Reason;


