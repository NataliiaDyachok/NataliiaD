# query #1 107ms -> 74ms
select * from employe order by last_name;

# query #2 237ms -> 202ms
SELECT e.first_name, e.last_name, e.employe_id, AVG(s.salary_sum) avg_sum
FROM salary s INNER JOIN employe e on s.employe_id = e.employe_id
GROUP BY e.employe_id
ORDER BY avg_sum DESC;

# query #3 169ms -> 132ms
SELECT p.position_id, p.position_name, AVG(s.salary_sum) avg_sum, MAX(s.salary_sum) max_sum
FROM position p
    INNER JOIN job j on p.position_id = j.position_id
    INNER JOIN salary s on j.employe_id = s.employe_id
WHERE s.salary_date BETWEEN j.job_bdate AND j.job_edate
GROUP BY p.position_id
ORDER BY max_sum DESC;

# query #4 1s49ms -> 967ms
SELECT e.employe_id, e.first_name, e.last_name,
    SUM(i.income_sum) total_sum, COUNT(i.income_item_id) count_days
FROM income i
    INNER JOIN employe e on i.employe_id = e.employe_id
GROUP BY  e.employe_id
ORDER BY total_sum DESC;

# query #5 1s668ms -> 1s191ms
SELECT i.transport_id, tt.transport_type_name, t.transport_number,
    SUM(i.income_sum) total_sum, AVG(i.income_sum) avg_sum, COUNT(i.income_item_id) count_days
FROM income i
    INNER JOIN transport t on i.transport_id = t.transport_id
    INNER JOIN transport_type tt on t.transport_type_id = tt.transport_type_id
GROUP BY i.transport_id
ORDER BY total_sum DESC;

# query #6 88ms -> 55ms
SELECT first_name, last_name, birthday
FROM employe
WHERE MONTH(birthday) = 5;

# query #7 109ms -> 77ms
SELECT first_name, last_name, birthday, YEAR(CURDATE())-YEAR(birthday) year_diff
FROM employe
ORDER BY year_diff

