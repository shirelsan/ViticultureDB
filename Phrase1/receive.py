import random

# יצירת רשימה של מספרי משימות ומספרי כרמים
task_id = list(range(100, 500))
vineyard_id = list(range(100, 500))

random.shuffle(vineyard_id) # ערבוב רשימת ה-vineyard_id כדי למנוע התאמה ישירה ל-task_id

sql_queries = [f"INSERT INTO receive (task_id, vineyard_id) VALUES ({t}, {v});" for t, v in zip(task_id, vineyard_id)]

# שמירת הנתונים לקובץ SQL
with open("receive.sql", "w") as f:
    f.write("\n".join(sql_queries))