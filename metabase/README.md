# Metabase Setup

This folder contains Metabase-ready versions of the SQL reports in the repository root.

## 1. Connect osTicket to Metabase

1. Open Metabase as an administrator.
2. Go to **Admin settings** -> **Databases**.
3. Add your osTicket MySQL database.
4. Run an initial sync so Metabase can discover the `ost_*` tables.

## 2. Create native questions

For each file in `/metabase/queries`:

1. Open **New** -> **SQL query**.
2. Select the osTicket database.
3. Paste the SQL from the matching file.
4. Configure the Metabase variables listed below.
5. Save the query as a question with the suggested name.

| File | Suggested question name | Variables |
| --- | --- | --- |
| `getAllTickets.sql` | `All Tickets` | none |
| `getAllAgentTickets.sql` | `Tickets by Agent` | `user_id` (Number) |
| `getAllTicketsByDays.sql` | `Tickets Created by Day Offset` | `days` (Number) |
| `getAllTicketsByMonth.sql` | `Tickets Created in Last N Months` | `months` (Number) |
| `getAllTicketsByTopic.sql` | `Tickets by Topic` | `topic` (Text) |
| `getAllTicketsFromDateGoingBackDays.sql` | `Ticket Count for Last N Days` | `days` (Number) |

Notes:

- `getAllTicketsByDays.sql` returns tickets from the single day `N` days ago, so it is best used as a day-offset report.
- `topic` is an exact text filter in Metabase. Use the same help topic label that exists in `ost_help_topic.topic`.

## 3. Recommended Metabase variable settings

- `days`: **Number**
- `months`: **Number**
- `user_id`: **Number**
- `topic`: **Text**

Recommended defaults:

- `days = 7`
- `months = 1`
- `topic = Support`

## 4. Build the dashboard

After saving the questions:

1. Open **New** -> **Dashboard**.
2. Name it `osTicket Support Overview`.
3. Add the saved questions.
4. Add dashboard filters for:
   - `days`
   - `months`
   - `topic`
   - `user_id`
5. Connect each filter only to the cards that use the matching variable.

Use `/metabase/dashboard.md` for the recommended card order and chart types.
