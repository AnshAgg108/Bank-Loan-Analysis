SELECT * FROM bank_loan_data



--Dashboard 1 - Summary Dashboard

--Total Loan Applications KPI
SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data

SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--(MTD-PMTD)/PMTD




--Total Funded Amount KPI

SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

--Month To Date of Total Funded Amount KPI

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--Previous Month To Date of Total Funded Amount KPI

SELECT SUM(loan_amount)AS PMTD_Total_Funded_amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021




--Total Amount Received KPI

SELECT SUM(total_payment) AS Total_Amount_Recieved FROM bank_loan_data

--Month to Date of Total Amount Received KPI

SELECT SUM(total_payment) AS MTD_Total_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--Previous Month to Date of Total Amount Received KPI

SELECT SUM(total_payment) AS PMTD_Total_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021




--Average Interest Rate

SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate FROM bank_loan_data

--Month to Date of Average Interest Rate
SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--Previous Month to Date of Average Interest Rate
SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021




--Average Debt-to-income Ratio
SELECT ROUND(AVG(dti),4) * 100 AS AVG_DTI FROM bank_loan_data

--Month to Date of Average Debt-to-income Ratio
SELECT ROUND(AVG(dti),4) * 100 AS MTD_AVG_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

--Previous  Month to Date of Average Debt-to-income Ratio
SELECT ROUND(AVG(dti),4) * 100 AS PMTD_AVG_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021



--Good Loan Application Percentage

SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
	/
	COUNT(id) as Good_loan_percentage
FROM bank_loan_data

--Good Loan Application 

SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Funded Amount 

SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--Good Loan Total Received Amount 

SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'




--Bad Loan Application percentage 

SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END)*100.0)
	/
	COUNT(id) as Bad_loan_percentage
FROM bank_loan_data

--Bad Loan Applications

SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Funded Amount


SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

--Bad Loan Total Received Amount


SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'




--Loan Status Grid View 

SELECT
        loan_status,
        COUNT(id) AS Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        bank_loan_data
    GROUP BY
        loan_status

--Month To Date Loan Status

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status




--Dashboard 2 - Overview Dashboard

--Monthly Trends By Issue Date

SELECT
	MONTH(issue_date) AS Month_Number,
	DATENAME(MONTH, issue_date) AS Month_Name, 
	COUNT(id) AS Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)


--Regional Analysis by State

SELECT
	address_state,
	COUNT(id) AS Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY count(id) DESC


--Loan term Analysis

SELECT
	term,
	COUNT(id) AS Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY term


--Employee Length Analysis

SELECT
	emp_length,
	COUNT(id) AS Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY COUNT(id) DESC

--Loan Purpose Breakdown

SELECT
	purpose,
	COUNT(id) AS Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY COUNT(id) DESC

--Home Ownership Analysis

SELECT
	home_ownership,
	COUNT(id) AS Total_loan_Applications,
	SUM(loan_amount) as Total_Funded_Amount,
	SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
WHERE grade = 'A'
GROUP BY home_ownership
ORDER BY COUNT(id) DESC



--Dashboard 3 - gridview 

SELECT * FROM bank_loan_data







