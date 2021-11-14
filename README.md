# Pewlett_Hackard_Analysis

## Project Overview
Pewlett Hackard has requested an employee analysis to determine the impact of the upcoming silver tsunamai of retirees. In addition, they requested an analysis to determine who among their current employees would be eligible for their mentorship program.

## Resources
* Software: PostGreSql 14, PGAdmin 4 v6

## Results
* The main position that will be impacted by retirement will be Senior Engineers
* To replace the retiring Senior Engineers, there are currently 528 Senior Engineers, 191 Engineers, and 29 Assistant Engineers eligible for the mentorship program
* Currently, there are 2 Managers in retirement age block
* There is a total 1,549 employees in total eligible for the Mentorship program based on Pewlett Hackard's current criteria

## Summary
The silver tsunamai will see approx 133,776 employees retire. Most of these are in Senior development roles and other high level positions. Pewlett Hackard certainly has enough retiring employees within each title to mentor their future replacements. They may want to consider opening up their mentorship program to younger employees rather than just a small range of those that will be retiring with the following decade. Instead of limiting the mentorship program to those born in 1965, PH should open this window up to all employees born after 1965 as below:

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
	AND E.birth_date >'1965-01-01';

One final thing the PH should keep take into consideration when deciding on who should be a part of their mentorship program would be the length of time the employee has been with the company.

SELECT DISTINCT ON (E.emp_no) E.emp_no
	, E.first_name
	, E.last_name
	, E.birth_date
	, DE.from_date
	, DE.to_date
	, T.title
  , NOW() - E.hire_date AS DaysEmployed
-- INTO mentorship_eligibility
FROM employees E
	JOIN dept_emp DE
		ON DE.emp_no = E.emp_no
	JOIN titles T
		ON T.emp_no = E.emp_no
WHERE DE.to_date > '2021-11-14'
	AND E.birth_date >'1965-01-01';

