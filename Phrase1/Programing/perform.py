import pandas as pd
import random

df = pd.read_csv(r"C:\Users\שיראל סננס\Desktop\פרוייקט  בסיסי נתונים\שלב 1\worker.csv")  # קריאת קובץ האקסל

# יצירת רשימה של מספרי המשימה הייחודיים וערבול הרשימה
harvest_ids = list(range(100, 500))
random.shuffle(harvest_ids)

# יצירת שאילתות INSERT INTO
sql_queries = []
for i, worker_id in enumerate(df.iloc[:, 0]):  # שימוש בעמודה הראשונה כמספר עובד
    harvest_id = harvest_ids[i]
    query = f"INSERT INTO perform (worker_id, harvest_id) VALUES ({worker_id}, {harvest_id});"
    sql_queries.append(query)

# שמירה לקובץ SQL
with open("perform.sql", "w") as f:
    f.write("\n".join(sql_queries))
