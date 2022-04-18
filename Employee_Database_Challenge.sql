--SQL Challenge

--Create retirement_titles table
SELECT e.emp_no,
e.first_name,
e.last_name,
i.title,
i.from_date,
i.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as i
ON (e.emp_no=i.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no) r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r
WHERE (to_date='9999-01-01')
ORDER BY r.emp_no ASC, r.to_date DESC;

---Create Retiring Titles Table
SELECT COUNT (u.title),
	title
	INTO retiring_titles
	FROM unique_titles as u
	GROUP BY u.title
	ORDER BY COUNT(u.title) DESC;

--Create Mentorship Table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	i.title
INTO mentorship_elegibility
FROM employees as e
	INNER JOIN titles as i
		ON (e.emp_no=i.emp_no)
	INNER JOIN dept_emp as de
		ON (e.emp_no=de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

