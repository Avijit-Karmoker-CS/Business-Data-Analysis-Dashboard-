# Business Data Analysis Dashboard

Personal project for analyzing operational business data using **Excel, SQL, and reporting**.

## Project Summary

This project uses a structured order dataset to identify business trends, clean and organize information, and create reporting outputs for decision-making. It includes SQL analysis queries, a Python reporting script, sample operational data, and an Excel dashboard workbook.

## Tools Used

- Microsoft Excel: Pivot Tables, formulas, charts, slicer-ready tables, dashboard layout
- SQL / SQLite: data aggregation, grouping, filtering, data quality checks
- Python: loading CSV data, running SQL queries, exporting summary reports
- GitHub: project documentation and version control

## Project Files

```text
business-data-analysis-dashboard/
├── data/
│   └── orders.csv
├── excel/
│   └── Business_Data_Analysis_Dashboard.xlsx
├── scripts/
│   └── generate_reports.py
├── sql/
│   ├── schema.sql
│   └── analysis_queries.sql
├── requirements.txt
├── .gitignore
└── README.md
```

## Business Questions Answered

1. Which product categories generate the most revenue and profit?
2. Which regions perform best?
3. How do monthly revenue and profit change over time?
4. Which customers contribute the most revenue?
5. Are there data quality issues such as missing categories or negative values?

## How to Run the Project

### 1. Clone the repository

```bash
git clone https://github.com/YOUR-USERNAME/business-data-analysis-dashboard.git
cd business-data-analysis-dashboard
```

### 2. Create and activate a virtual environment

```bash
python -m venv venv
source venv/bin/activate
```

For Windows:

```bash
venv\Scripts\activate
```

### 3. Install requirements

```bash
pip install -r requirements.txt
```

### 4. Generate SQL-based reports

```bash
python scripts/generate_reports.py
```

This creates summary CSV files in the `output/` folder.

## Excel Dashboard

Open:

```text
excel/Business_Data_Analysis_Dashboard.xlsx
```

The workbook includes:

- Raw order data
- Monthly summary
- Category summary
- Region summary
- Dashboard page with KPI cards and charts

## Key Insights From the Sample Data

- Revenue and profit can be reviewed by month, category, and region.
- Category and region summaries help identify high-performing business areas.
- Data quality checks support consistency and reporting accuracy.

## Resume Bullet Alignment

This project supports the following resume points:

- Organized and analyzed operational datasets using Excel and SQL to identify trends and summarize business information.
- Created reports and dashboards using Pivot Tables, filtering, and data aggregation techniques to support decision-making.
- Worked with structured datasets to improve data consistency, categorization, and reporting accuracy.

## Author

Avijit Karmoker
