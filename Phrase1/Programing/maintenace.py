import pandas as pd
import random
from datetime import datetime, timedelta

df = pd.read_excel(r"C:\Users\שיראל סננס\Desktop\פרוייקט  בסיסי נתונים\שלב 1\workers.xlsx")  # קריאת קובץ האקסל
list_worker_ids = df.iloc[:, 0].tolist()

task_id = list(range(100, 500))
random.shuffle(task_id)                          # יצירת רשימה של מספרי המשימה ייחודיים וערבול הרשימה

task_types = ["maintenace", "Harvesting", "Planting"]

# יצירת רשימה של תאריכים בטווח שנת 2025
start_date = datetime(2025, 1, 1)
end_date = datetime(2025, 12, 31)
date_range = [(start_date + timedelta(days=i)).strftime("%Y-%m-%d") for i in range((end_date - start_date).days + 1)]

# יצירת פקודות SQL
sql_queries = []
for task_id in range(100, 500):
    task_type = random.choice(task_types)  # בחירת סוג משימה רנדומלי
    m_date = random.choice(date_range)  # בחירת תאריך רנדומלי
    worker_id = random.choice(list_worker_ids)  # שיוך עובד רנדומלי

    query = f"INSERT INTO maintenace (task_id, task_type, m_date, worker_id) VALUES " \
            f"({task_id}, '{task_type}', '{m_date}', {worker_id});"
    sql_queries.append(query)

with open("maintenace.sql", "w") as f:
    f.write("\n".join(sql_queries))
