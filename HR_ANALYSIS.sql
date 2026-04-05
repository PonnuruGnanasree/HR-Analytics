CREATE DATABASE hr_analysis;
USE hr_analysis;

SHOW VARIABLES LIKE 'secure_file_priv';

SELECT database();

CREATE TABLE HR_1 (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(30),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT PRIMARY KEY,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(10),
    HourlyRate INT,
    Job_Involvement INT,
    Job_Level INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    Exists_in_HR_2 VARCHAR(5)
);

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/HR_1.csv'
INTO TABLE HR_1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM HR_1;

CREATE TABLE HR_2 (
    EmployeeID INT PRIMARY KEY,
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(5),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/HR_2.csv'
INTO TABLE HR_2
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) FROM HR_2;

## KPI 1: Job Role vs Work-Life Balance
SELECT
    h1.JobRole,
    ROUND(AVG(h2.WorkLifeBalance), 2) AS avg_work_life_balance,
    COUNT(*) AS employee_count
FROM HR_1 h1
JOIN HR_2 h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h1.JobRole
ORDER BY avg_work_life_balance DESC;


## KPI 2: Attrition Rate vs Years Since Last Promotion
SELECT
    h2.YearsSinceLastPromotion,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR_1 h1
JOIN HR_2 h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h2.YearsSinceLastPromotion
ORDER BY h2.YearsSinceLastPromotion;


## KPI 3: Average Hourly Rate of Male Research Scientist
SELECT
    ROUND(AVG(HourlyRate), 2) AS avg_hourly_rate
FROM HR_1
WHERE Gender = 'Male'
  AND JobRole = 'Research Scientist';
  
## KPI 4: Average Attrition Rate for All Departments
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR_1
GROUP BY Department
ORDER BY attrition_rate DESC;

## KPI 5: Average Working Years for Each Department
SELECT
    h1.Department,
    ROUND(AVG(h2.TotalWorkingYears), 2) AS avg_working_years,
    COUNT(*) AS employee_count
FROM HR_1 h1
JOIN HR_2 h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY h1.Department
ORDER BY avg_working_years DESC;

## KPI 6: Attrition Rate vs Monthly Income
SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN h1.Attrition = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM HR_1 h1
JOIN HR_2 h2
    ON h1.EmployeeNumber = h2.EmployeeID
GROUP BY
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low Income'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium Income'
        ELSE 'High Income'
    END
ORDER BY attrition_rate DESC;
  
