-- Declare a user-defined variable for the number of days
SET @days := 30;  -- Adjust the number of days as needed


SELECT COUNT(*) as ticket_count
FROM ost_ticket
WHERE created >= DATE_SUB(NOW(), INTERVAL @days DAY);
