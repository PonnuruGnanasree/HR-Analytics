
🚀 HR Analytics Dashboard (End-to-End Project)

---
📌 Project Overview


This project presents an end-to-end HR Analytics Dashboard built using Excel, SQL, Power BI, and Tableau.

The objective is to analyze employee data to uncover insights related to Attrition, Employee performance, Salary distribution and Workforce trends, helping HR teams make data-driven decisions.

🎯 Business Problem
--
Organizations often struggle with:

* High employee attrition
* Lack of visibility into workforce trends
* Inefficient decision-making in HR processes

This project aims to solve these challenges by providing **interactive dashboards and actionable insights**.

---

## 🛠️ Tools & Technologies

* **Excel** → Data Cleaning & Preprocessing
* **MySQL** → Data Extraction & KPI Queries
* **Power BI** → Interactive Dashboard & Visualization
* **Tableau** → Advanced Visual Storytelling

---
## 📂 Dataset

The dataset contains employee-related information such as:

* Employee ID
* Age
* Gender
* Department
* Job Role
* Salary
* Years at Company
* Attrition (Yes/No)
* Job Satisfaction
* Education Level

*(Sample dataset included in repository)*

---

## 📊 Key KPIs

* 🔹 Total Employees
* 🔹 Attrition Rate (%)
* 🔹 Active Employees
* 🔹 Average Salary
* 🔹 Average Age
* 🔹 Average Tenure

---

## 📈 Key Insights

* High attrition observed in specific departments
* Employees with lower job satisfaction are more likely to leave
* Salary and experience play a key role in retention
* Certain job roles show consistently higher turnover
* Workforce is concentrated in specific age groups

---

## 📊 Dashboard Features

### 🔹 Filters (Slicers)

* Department
* Gender
* Education
* Job Role

### 🔹 Visualizations

* 📊 Attrition by Department
* 📊 Salary Distribution
* 📊 Age Group Analysis
* 📊 Attrition by Job Role
* 📈 Employee Trend Over Time

---

## 📁 Project Structure

```
HR-Analytics-Project/
│
├── 00_DATA/          → Dataset files  
├── 01_EXCEL/         → Excel dashboard  
├── 02_POWERBI/       → Power BI dashboard  
├── 03_TABLEAU/       → Tableau dashboard  
├── 04_MYSQL/         → SQL queries  
└── README.md         → Project documentation  
```

---

## 💡 Skills Demonstrated

* Data Cleaning & Transformation
* SQL Query Writing & KPI Extraction
* Dashboard Design (Power BI & Tableau)
* Data Visualization & Storytelling
* Business Insight Generation

---

## 📸 Dashboard Preview

*(Add screenshots of your Excel, Power BI, and Tableau dashboards here)*

---

## 📊 Sample SQL KPIs

```sql
-- Attrition Rate
SELECT 
ROUND(SUM(attrition = 'Yes') / COUNT(*) * 100, 2) AS attrition_rate
FROM employees;

-- Average Salary
SELECT AVG(salary) AS avg_salary FROM employees;

-- Attrition by Department
SELECT department, COUNT(*) AS total,
SUM(attrition = 'Yes') AS attrition_count
FROM employees
GROUP BY department;
```

---

## 🚀 How to Run the Project

1. Load dataset into MySQL
2. Run SQL queries from `/04_MYSQL`
3. Open dashboards:

   * Excel → `/01_EXCEL`
   * Power BI → `/02_POWERBI`
   * Tableau → `/03_TABLEAU`

---

## 📬 Connect With Me

📧 Email: [ponnurugnanasree004@gmail.com]
🔗 LinkedIn: https://www.linkedin.com/in/gnanasree-ponnuru/

---

## ⭐ Conclusion

This project demonstrates how HR data can be transformed into **meaningful insights** using modern data analytics tools, enabling better decision-making and improved employee retention strategies.


