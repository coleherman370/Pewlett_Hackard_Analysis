-- Get retirement titles
SELECT E.emp_no
	, E.first_name
	, E.last_name
	, T.title
	, T.from_date
	, T.to_date
-- INTO retirement_titles
FROM employees E
	JOIN titles T
		ON T.emp_no = E.emp_no
WHERE E.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY E.emp_no ASC;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
-- INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Get count of retiring titles
SELECT COUNT(title) AS count
	, title
-- INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC;

-- Create mentorship eligibility table
SELECT DISTINCT ON (E.emp_no) E.emp_no
	, E.first_name
	, E.last_name
	, E.birth_date
	, DE.from_date
	, DE.to_date
	, T.title
-- INTO mentorship_eligibility
FROM employees E
	JOIN dept_emp DE
		ON DE.emp_no = E.emp_no
	JOIN titles T
		ON T.emp_no = E.emp_no
WHERE DE.to_date > '2021-11-14'
	AND (E.birth_date BETWEEN '1965-01-01' AND '1965-12-31');