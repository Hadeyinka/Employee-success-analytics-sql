# Employee-success-analytics-sql
SQL analysis of employee retention, performance, turnover and salary patterns for a fictional technology company.

# Employee Success Analytics

## Project Overview

This project analyses employee data for **NextGen Corp.**, a growing technology company experiencing challenges related to employee turnover, performance variability, and salary differences across departments.

The objective of the analysis was to use SQL to identify patterns in:

- Employee retention and turnover
- Employee performance
- Salary distribution
- The relationship between salary and performance

The analysis was designed to provide data-driven insights that could support HR decision-making around employee retention, development, performance management, and compensation.

## Business Questions

The analysis explored the following key questions:

### Employee Retention

- Who are the longest-serving employees?
- What is the turnover rate by department?
- Which employees may be at risk of leaving?
- What are the main reasons employees leave the company?

### Employee Performance

- How many employees have left the company?
- How many employees have performance scores of 5.0 or below 3.5?
- Which departments have the highest number of employees with extreme performance scores?
- What is the average performance score by department?

### Salary Analysis

- What is the company's total salary expense?
- What is the average salary by job title?
- How many employees earn above £80,000?
- How strongly is salary related to employee performance across departments?

## Key Findings

### Employee Retention

The analysis found that the five longest-serving employees had been with the organisation for more than nine years, with David Moore having the longest tenure at approximately 10 years.

Marketing recorded the highest departmental turnover rate at **92.86%**, followed by Engineering at **66.67%**. Sales and HR had turnover rates below 30%.

Overall, **28 of the 60 employees** had left the company.

The most common recorded reason for leaving was personal reasons, accounting for **39.29% of exits**, followed by finding another job at **25.00%**.

### Employee Performance

The analysis identified **47 employees** with a performance score of either 5.0 or below 3.5.

Engineering and Marketing each had **17 employees** within these performance-score categories.

The analysis also identified Grace Wilson in Sales as requiring attention based on an average performance score of **3.43**.

### Salary Analysis

The company's total salary expense was **£4,850,000 for 60 employees**.

Sales Representatives had the highest average salary among the listed job titles at **£84,285.71**, while Marketing Specialists had the lowest at **£77,857.14**.

A total of **26 employees earned above £80,000 annually**.

The analysis found relatively weak correlations between salary and performance across departments, indicating that the two variables were not strongly linked overall.

## Recommendations

Based on the analysis, the project proposed several areas for consideration:

- Provide coaching, skills development and feedback for lower-performing employees.
- Introduce personal development plans linked to goals and performance reviews.
- Create clearer career progression and upskilling opportunities.
- Investigate the retention and performance patterns within Engineering and Marketing.
- Encourage internal mobility before employees seek external opportunities.
- Use experienced employees in mentorship and onboarding activities.
- Recognise long-serving employees and their contributions.
- Conduct individual check-ins where performance concerns have been identified.

## Tools & Skills

**Tools**

- PostgreSQL
- SQL

**SQL Skills**

- Data aggregation
- Filtering
- Sorting
- Grouping
- Joins
- Aggregate functions
- CASE statements
- Window functions
- Date calculations
- Correlation analysis
- Numeric formatting

**Business Analysis**

- Translating business questions into analytical questions
- Identifying trends and patterns
- Interpreting analytical results
- Developing data-driven recommendations

## Project Evidence

The repository includes the SQL scripts used for the analysis and the accompanying project presentation.

The presentation documents the business context, analytical questions, findings, and recommendations from the project.

## Project Presentation

The original SQL capstone presentation is included in the `presentation` folder.

## Repository Structure

```text
employee-success-analytics-sql/
│
├── README.md
│
├── sql/
│   ├── 01_employee_retention.sql
│   ├── 02_employee_performance.sql
│   └── 03_salary_analysis.sql
│
├── presentation/
│   └── Employee_Success_Analytics_Presentation.pdf
│
└── insights/
    └── key-findings.md
```

## Author

**Adeyinka Ibitayo**

Data Analyst | SQL | Power BI | Excel | Tableau
