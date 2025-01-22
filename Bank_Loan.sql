-- Retrieve all records from the `bank_loan_data` table
SELECT * FROM bank_loan_data;

-- KPI: Total Loan Applications
-- Count the total number of loan applications
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data;

-- KPI: MTD Loan Applications
-- Count the loan applications for the current month (December in this case)
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- KPI: PMTD Loan Applications
-- Count the loan applications for the previous month (November in this case)
SELECT COUNT(id) AS Total_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- KPI: Total Funded Amount
-- Calculate the total loan amount funded
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;

-- KPI: MTD Total Funded Amount
-- Calculate the total loan amount funded for the current month (December)
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- KPI: PMTD Total Funded Amount
-- Calculate the total loan amount funded for the previous month (November)
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- KPI: Total Amount Received
-- Calculate the total amount received from loans
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data;

-- KPI: MTD Total Amount Received
-- Calculate the total amount received from loans for the current month (December)
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- KPI: PMTD Total Amount Received
-- Calculate the total amount received from loans for the previous month (November)
SELECT SUM(total_payment) AS Total_Amount_Collected FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- KPI: Average Interest Rate
-- Calculate the average interest rate for all loans
SELECT AVG(int_rate) * 100 AS Avg_Int_Rate FROM bank_loan_data;

-- KPI: MTD Average Interest
-- Calculate the average interest rate for loans issued in the current month (December)
SELECT AVG(int_rate) * 100 AS MTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- KPI: PMTD Average Interest
-- Calculate the average interest rate for loans issued in the previous month (November)
SELECT AVG(int_rate) * 100 AS PMTD_Avg_Int_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11;

-- KPI: Average Debt-to-Income (DTI) Ratio
-- Calculate the average DTI ratio for all loans
SELECT AVG(dti) * 100 AS Avg_DTI FROM bank_loan_data;

-- KPI: MTD Average DTI
-- Calculate the average DTI ratio for loans issued in the current month (December)
SELECT AVG(dti) * 100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12;

-- KPI: PMTD Average DTI
-- Calculate the average DTI ratio for loans issued in the previous month (November)
SELECT AVG(dti) * 100 AS PMTD_Avg_DTI FROM bank_loan_data;

-- KPI: Good Loan Percentage
-- Calculate the percentage of loans with a status of "Fully Paid" or "Current"
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) /
    COUNT(id) AS Good_Loan_Percentage
FROM bank_loan_data;

-- KPI: Good Loan Applications
-- Count the total number of loans with a status of "Fully Paid" or "Current"
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- KPI: Good Loan Funded Amount
-- Calculate the total loan amount funded for "Fully Paid" or "Current" loans
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- KPI: Good Loan Amount Received
-- Calculate the total amount received for "Fully Paid" or "Current" loans
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

-- KPI: Bad Loan Percentage
-- Calculate the percentage of loans with a status of "Charged Off"
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) /
    COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;

-- KPI: Bad Loan Applications
-- Count the total number of loans with a status of "Charged Off"
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- KPI: Bad Loan Funded Amount
-- Calculate the total loan amount funded for loans with a status of "Charged Off"
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- KPI: Bad Loan Amount Received
-- Calculate the total amount received for loans with a status of "Charged Off"
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off';

-- Loan Status Overview
-- Summarise loans by status, including counts, total amount received, total funded amount, average interest rate, and average DTI
SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM
    bank_loan_data
GROUP BY
    loan_status;

