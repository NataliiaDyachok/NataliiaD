# query #1
select * from employe order by last_name;

# query #2
SELECT e.first_name, e.last_name, AVG(s.salary_sum) avg_sum
FROM salary s INNER JOIN employe e on s.employe_id = e.employe_id
GROUP BY e.first_name, e.last_name
ORDER BY e.last_name;

# query #3
SELECT p.position_id, p.position_name, AVG(s.salary_sum), MAX(salary_sum)
FROM position p
    INNER JOIN job j on p.position_id = j.position_id
    INNER JOIN salary s on (j.employe_id = s.employe_id AND s.salary_date BETWEEN job_bdate AND j.job_edate)
GROUP BY p.position_id, p.position_name
ORDER BY p.position_name;

# query #4
SELECT e.first_name, e.last_name, SUM(i.income_sum) total_sum, COUNT(*) count_days
FROM income i
    INNER JOIN employe e on i.employe_id = e.employe_id
GROUP BY  e.first_name, e.last_name
ORDER BY e.last_name;

# query #5
SELECT i.transport_id, tt.transport_type_name, t.transport_number,
    SUM(i.income_sum) total_sum, AVG(i.income_sum) avg_sum, COUNT(*) count_days
FROM income i
    INNER JOIN transport t on i.transport_id = t.transport_id
    INNER JOIN transport_type tt on t.transport_type_id = tt.transport_type_id
GROUP BY i.transport_id, tt.transport_type_name, t.transport_number
ORDER BY tt.transport_type_name, t.transport_number;

# query #6
SELECT first_name, last_name, birthday
FROM employe
WHERE MONTH(birthday) = 5;

# query #7
SELECT first_name, last_name, birthday, YEAR('20191203')-YEAR(birthday) year_diff
FROM employe
ORDER BY YEAR('20191203')-YEAR(birthday)

