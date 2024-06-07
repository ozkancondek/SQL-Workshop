--Second Day Confirmation

SELECT *
FROM emails
JOIN texts ON texts.email_id = emails.email_id
WHERE  texts.action_date = emails.signup_date + INTERVAL '1 day'
AND texts.signup_action = 'Confirmed';
  
;
