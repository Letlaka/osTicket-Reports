# Suggested Metabase Dashboard

## Dashboard name

`osTicket Support Overview`

## Suggested cards

1. **Ticket Count for Last N Days**
   - Source question: `Ticket Count for Last N Days`
   - Visualization: Number
   - Dashboard filter: `days`

2. **All Tickets**
   - Source question: `All Tickets`
   - Visualization: Table
   - Useful columns: `ticket_number`, `date_created`, `ticket_status`, `staff_name`, `help_topic`

3. **Tickets Created by Day Offset**
   - Source question: `Tickets Created by Day Offset`
   - Visualization: Table
   - Dashboard filter: `days`

4. **Tickets Created in Last N Months**
   - Source question: `Tickets Created in Last N Months`
   - Visualization: Table
   - Dashboard filter: `months`

5. **Tickets by Agent**
   - Source question: `Tickets by Agent`
   - Visualization: Table
   - Dashboard filter: `user_id`

6. **Tickets by Topic**
   - Source question: `Tickets by Topic`
   - Visualization: Table
   - Dashboard filter: `topic`

## Recommended dashboard filters

| Filter | Type | Connect to |
| --- | --- | --- |
| `days` | Number | `Ticket Count for Last N Days`, `Tickets Created by Day Offset` |
| `months` | Number | `Tickets Created in Last N Months` |
| `user_id` | Number | `Tickets by Agent` |
| `topic` | Text | `Tickets by Topic` |

## Notes

- Keep `All Tickets` unfiltered so it acts as the baseline report.
- If you want chart-based summaries later, you can duplicate the table questions in Metabase and summarize by `ticket_status`, `help_topic`, or `staff_name`.
- If your Metabase instance supports collections, save the six questions and the dashboard in a collection named `osTicket Reports`.
