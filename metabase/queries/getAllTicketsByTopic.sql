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
LEFT JOIN ost_thread th ON th.object_id = t.ticket_id AND th.object_type = 'T'
LEFT JOIN ost_thread_entry te ON te.id = (
    SELECT MIN(te1.id)
    FROM ost_thread_entry te1
    WHERE te1.thread_id = th.id
)
LEFT JOIN ost_help_topic ht ON t.topic_id = ht.topic_id
WHERE ht.topic = {{topic}};
