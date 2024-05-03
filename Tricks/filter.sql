SELECT m.id as member_id, COUNT(*) as member_count, COUNT(*) FILTER(WHERE m.expiration_date > current_date) as active_member_count
FROM members_m;

--get the members you have not hit their expiration date yet.
