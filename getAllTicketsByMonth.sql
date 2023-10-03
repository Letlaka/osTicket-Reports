-- Declare a user-defined variable for the user ID
SET @months := 1; -- Adjust the number of months as needed

SELECT
    t.number AS ticket_number,
    t.created AS date_created,
    ts.name AS ticket_status,
    u.name AS logged_by,
    CONCAT(s.firstname, ' ', s.lastname) AS staff_name,
    t.sla_id AS sla_id,
    t.source AS ticket_source,
    t.isoverdue AS is_overdue,
    t.duedate AS due_date,
    t.est_duedate AS estimated_due_date,
    t.reopened AS reopened,
    t.closed AS closed_date,
    ht.topic AS help_topic,
    te.title AS title,
    te.body AS body
FROM ost_ticket t
JOIN ost_user u ON t.user_id = u.id
JOIN ost_staff s ON t.staff_id = s.staff_id
JOIN ost_ticket_status ts ON t.status_id = ts.id
LEFT JOIN ost_thread_entry te ON t.ticket_id = te.staff_id
LEFT JOIN ost_help_topic ht ON t.topic_id = ht.topic_id
WHERE t.created >= DATE_SUB(NOW(), INTERVAL 2 WEEK);