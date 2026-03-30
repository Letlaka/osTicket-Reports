SELECT COUNT(*) as ticket_count
FROM ost_ticket
WHERE created >= DATE_SUB(NOW(), INTERVAL {{days}} DAY);
