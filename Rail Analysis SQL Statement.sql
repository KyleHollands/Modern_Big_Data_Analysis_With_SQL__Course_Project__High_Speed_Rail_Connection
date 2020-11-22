SELECT origin AS Origin,
       dest as Destination,
       ROUND(AVG(f.distance)) AS Average_Distance,
       ROUND(COUNT(f.flight) / 10) AS Annual_Average_Number_of_Flights,
       ROUND(SUM(p.seats) / 10) AS Annual_Average_Seat_Capacity,
       ROUND(SUM(f.arr_delay) / 10) As Annual_Average_Arrival_Delay
    FROM fly.flights f LEFT OUTER JOIN fly.planes p
    ON f.tailnum = p.tailnum --Join the planes table by unique ID tailnum to the flights table by unique ID tailnum.
       WHERE f.distance >= 300 AND distance <= 400 --Filter results that are between 300 and 400 miles.
       GROUP BY Origin, Destination
       HAVING Annual_Average_Number_of_Flights >= 5000 --Filter results over 5000 average number of flights annually.
       ORDER BY Annual_Average_Seat_Capacity DESC
       LIMIT 10;