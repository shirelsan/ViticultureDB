# Phase 2: Integration: 
## Introduction:  

בשלב זה מתבצע מימוש מתקדם של יכולות התשאול והניהול של בסיס הנתונים שתוכנן ונבנה בשלב הראשון. המטרה העיקרית הייתה לבדוק את התאמת מבנה הנתונים לצרכים האמיתיים של מערכת לניהול גידול גפנים, ולוודא שהנתונים יכולים לשמש לניתוחים ופעולות שונות כמו תחזוקה, קטיף, ניתוח עובדים, ניהול זנים ועוד.

לצורך כך נכתבו שמונה שאילתות SELECT מורכבות, שחלקן כוללות שימוש בפקודות כמו JOIN, GROUP BY, ORDER BY, EXTRACT, תנאים לוגיים מורכבים ואף שאילתות מקוננות. השאילתות מספקות מידע מעשי ומשמעותי: החל בניתוח עבודת עובדים, דרך ניתוח כמויות קציר לפי זנים וחודשים, ועד ניתוח תפקוד תחזוקתי בכרמים עם זנים ספציפיים בלבד.

בנוסף, בוצעו שלוש שאילתות UPDATE שדימו תרחישים עסקיים אמיתיים, כמו שדרוג תפקיד של עובד לפי ביצועים, שינוי רמת ההבשלה של גפנים, ועדכון כמות מלאי בהתאם לתנאי זמן. תהליך זה לווה גם בפקודות ROLLBACK ו-COMMIT המדמות מצבי שינוי נתונים בזמן אמת.

כחלק מחיזוק האמינות והבקרה על הנתונים, נוספו שלושה אילוצים (CONSTRAINTS) מסוגים שונים לשלוש טבלאות שונות – כולל אילוץ NOT NULL על תאריך קציר, אילוץ CHECK על צבע זן הענבים, ואילוץ DEFAULT לרמת הבשלת הגפן – כל זאת במטרה להבטיח שמירה על שלמות ועדכניות המידע.  


## select queries

Provide the following SQL select queries:


### **Select Queries Script** – The SQL script containing all the `SELECT` queries used for data analysis and reporting is available in the repository.    

  •[📜 Select queries file.sql](SelectQueries-final.sql)

### **Query 1:** Get all workers with their roles and the tasks they performed 
 
 ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query1.jpg?raw=true)  

### **Query 2:** How many employees are there in each position?

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query2.jpg?raw=true)  

### **Query 3:** This query returns each worker's ID, name, role, and the number of maintenance tasks they have performed  
 
 ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query3.jpg?raw=true)  

### **Query 4:** How many grapes were picked from each type of vine/variety?

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query4.jpg?raw=true) 

### **Query 5:** Amount of grapes harvested each month in 2025 (analysis by month) 
 
 ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query5.jpg?raw=true)  

### **Query 6:** Details about each vineyard – location, soil type, grape type and quantity status (did the harvest exceed 100 kg?)

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query6.jpg?raw=true) 
