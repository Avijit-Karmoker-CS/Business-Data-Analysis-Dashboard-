import sqlite3
import pandas as pd
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DB_PATH = ROOT / "business_dashboard.db"
DATA_PATH = ROOT / "data" / "orders.csv"
SQL_PATH = ROOT / "sql" / "schema.sql"
OUTPUT_DIR = ROOT / "output"

def run_query(conn, query):
    return pd.read_sql_query(query, conn)

def main():
    OUTPUT_DIR.mkdir(exist_ok=True)

    conn = sqlite3.connect(DB_PATH)

    with open(SQL_PATH, "r", encoding="utf-8") as f:
        conn.executescript(f.read())

    orders = pd.read_csv(DATA_PATH)
    orders.to_sql("orders", conn, if_exists="append", index=False)

    reports = {
        "monthly_summary.csv": """
            SELECT strftime('%Y-%m', OrderDate) AS Month,
                   ROUND(SUM(Revenue), 2) AS TotalRevenue,
                   ROUND(SUM(Profit), 2) AS TotalProfit,
                   ROUND(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0), 2) AS ProfitMarginPercent
            FROM orders
            GROUP BY Month
            ORDER BY Month;
        """,
        "category_summary.csv": """
            SELECT Category,
                   COUNT(*) AS OrderCount,
                   SUM(Quantity) AS UnitsSold,
                   ROUND(SUM(Revenue), 2) AS TotalRevenue,
                   ROUND(SUM(Profit), 2) AS TotalProfit
            FROM orders
            GROUP BY Category
            ORDER BY TotalRevenue DESC;
        """,
        "region_summary.csv": """
            SELECT Region,
                   COUNT(*) AS OrderCount,
                   ROUND(SUM(Revenue), 2) AS TotalRevenue,
                   ROUND(SUM(Profit), 2) AS TotalProfit
            FROM orders
            GROUP BY Region
            ORDER BY TotalRevenue DESC;
        """
    }

    for filename, query in reports.items():
        df = run_query(conn, query)
        df.to_csv(OUTPUT_DIR / filename, index=False)
        print(f"Created {OUTPUT_DIR / filename}")

    conn.close()
    print("Done. Use the CSV files in output/ to build or refresh Excel Pivot Tables and charts.")

if __name__ == "__main__":
    main()
