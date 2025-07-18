# Phase 2: Integration: 

## Table of Contents  

- [Phase 2: Integration](#Integration)
  
  •[Introduction](#Introduction) 
  
  •[Select Queries](#Select-Queries)   
    
  •[Update Queries](#Update-Queries)

  •[Delete Queries](#Delete-Queries )
  
  •[Rollback & Commit](#Rollback-And-Commit)
  
  •[Constraint queries](#Constraint-queries)
    
  •[Backup](#backup) 
## Introduction:  

בשלב זה מתבצע מימוש מתקדם של יכולות התשאול והניהול של בסיס הנתונים שתוכנן ונבנה בשלב הראשון. המטרה העיקרית הייתה לבדוק את התאמת מבנה הנתונים לצרכים האמיתיים של מערכת לניהול גידול גפנים, ולוודא שהנתונים יכולים לשמש לניתוחים ופעולות שונות כמו תחזוקה, קטיף, ניתוח עובדים, ניהול זנים ועוד.

לצורך כך נכתבו שמונה שאילתות SELECT מורכבות, שחלקן כוללות שימוש בפקודות כמו JOIN, GROUP BY, ORDER BY, EXTRACT, תנאים לוגיים מורכבים ואף שאילתות מקוננות. השאילתות מספקות מידע מעשי ומשמעותי: החל בניתוח עבודת עובדים, דרך ניתוח כמויות קציר לפי זנים וחודשים, ועד ניתוח תפקוד תחזוקתי בכרמים עם זנים ספציפיים בלבד.

בנוסף, בוצעו שלוש שאילתות UPDATE  ו DELETE שדימו תרחישים עסקיים אמיתיים, כמו שדרוג תפקיד של עובד לפי ביצועים, שינוי רמת ההבשלה של גפנים, ועדכון כמות מלאי בהתאם לתנאי זמן. תהליך זה לווה גם בפקודות ROLLBACK ו-COMMIT המדמות מצבי שינוי נתונים בזמן אמת.

כחלק מחיזוק האמינות והבקרה על הנתונים, נוספו שלושה אילוצים (CONSTRAINTS) מסוגים שונים לשלוש טבלאות שונות – כולל אילוץ NOT NULL על תאריך קציר, אילוץ CHECK על צבע זן הענבים, ואילוץ DEFAULT לרמת הבשלת הגפן – כל זאת במטרה להבטיח שמירה על שלמות ועדכניות המידע.  


## Select queries

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

### **Query 7:** Maintenance in vineyards with only white grapes carried out during 2025 
 
 ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query7.jpg?raw=true)  

### **Query 8:** Introducing workers who did both maintenance and harvesting

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/SelectQueriesSQL/query8.jpg?raw=true)   


## **Update Queries:**

### **Update Queries Script** – The SQL script containing all the `UPDATE` queries.    
  
  •[📜 Update queries file.sql](UpdateQueriesnew.sql)

### **Query 1:**

Upgrade worker role to "Senior Harvester" if they harvested more than 50 grapes in a single event  
 
![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query1.1update.jpg?raw=true)   

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query1.2update.jpg?raw=true)  

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query1.3update.jpg?raw=true)  


### **Query 2:** 

Change the maturity level to 'Stressed' for vines related to harvests with more than 65 units picked in January
 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query2.1update.jpg?raw=true)   

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query2.2update.jpg?raw=true)  

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query2.3update.jpg?raw=true)

### **Query 3:**

Increase inventory quantity by 10% where harvested quantity is greater than inventory quantity, but only for red grapes
  
 
 ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query3.1update.jpg?raw=true)   

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query3.2update.jpg?raw=true)  

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/RollbackCommit.sql/query3.3update.jpg?raw=true) 


## **Delete Queries:**
 
 •[📜 Delete Queriess file.sql](delete_queries.sql)
 
### Delete query 1:

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/1A.png?raw=true) 

#### הסבר על השאילתא:
השאילתה מוחקת מטבלה grape_variety  את כל סוגי הענבים שצבעם אדום,
ונשתלו בחודש יולי.
המחיקה מתבצעת על בסיס זיהוי  grape_variety_id דרך שאילתה פנימית שמבצעת JOIN  עם טבלת vine,כדי לבדוק את תאריך השתילה (v_date) ולוודא שהוא בחודש 7 (יולי), תוך שימוש ב־EXTRACT(MONTH)

#### דוגמה לנתון שימחק לאחר הרצת השאילתא:

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/2A.png?raw=true) 

#### תיאור תהליך בסיס הנתונים לאחר מחיקה ביצוע Rollback$Comit לטובת החזרה הנתונים והרצת שאילתת המחיקה בשנית: 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/3A.png?raw=true) 


### Delete query 2:

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/1B.png?raw=true) 

#### הסבר על השאילתא:
שאילתה זו מוחקת את הקשרים בין עובדים לקטיפים בטבלת perform, אך רק עבור עובדים שהם קוטפים (Harvester) ולא ביצעו משימות תחזוקה בחודש פברואר 2025.
השאילתה מורכבת משלוש רמות: השאילתה הראשית מוחקת מטבלת perform, התת-שאילתה האמצעית מאתרת את כל הקוטפים, והתת-שאילתה הפנימית מסננת החוצה עובדים שביצעו תחזוקה בפברואר 2025.
השימוש ב-GROUP BY מאפשר חלוקה לקבוצות לפי מזהה עובד, בעוד הפונקציה EXTRACT מפרקת את התאריך למרכיבי חודש ושנה, מה שמאפשר סינון מדויק יותר של הנתונים.


#### תיאור תהליך בסיס הנתונים לאחר מחיקה ביצוע Rollback$Comit לטובת החזרה הנתונים והרצת שאילתת המחיקה בשנית: 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/3B.png?raw=true) 



### Delete query 3:

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/1.png?raw=true) 

#### הסבר על השאילתא:
שאילתה זו מסירה את הקשרים בין משימות תחזוקה לכרמים בטבלת Receive, תוך התמקדות בכרמים שסוג האדמה שלהם חולי ('sandy') ושהקטיף שבוצע בהם התרחש אחרי היום החמישי בחודש.
השאילתה משתמשת ב-JOIN כדי לקשר בין טבלת vineyard לטבלת harvest, מה שמאפשר גישה לתאריכי הקטיף. 
הפונקציה EXTRACT משמשת לפירוק תאריך הקטיף ליום בחודש, 
ה-GROUP BY מקבץ את התוצאות לפי מזהה הכרם, וה -ORDER BY ממיין את התוצאות לפי כמות הקטיף הגדולה ביותר בסדר יורד.

#### דוגמה לנתון שימחק לאחר הרצת השאילתא:

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/2C.png?raw=true) 

#### תיאור תהליך בסיס הנתונים לאחר מחיקה ביצוע Rollback$Comit לטובת החזרה הנתונים והרצת שאילתת המחיקה בשנית: 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/Delete%20Queries/3C.png?raw=true) 

## Rollback And Commit

Provide the following SQL RollbackCommit queries

את שאילתות העדכון והמחיקה ביצענו תוך שימוש ב־COMMIT ו־ROLLBACK, כדי להדגים את תהליך שינוי הנתונים בטבלאות 

מצורפים שני קבצים הכוללים את שאילתות העדכון והמחיקה, יחד עם הרצה של הפקודות ROLLBACK ו־COMMIT :
### **RollbackCommitUpdate Queries Script** – 
The SQL script containing all the `UPDATE` queries with rollback and commit.    

  •[📜 Rollback And Commit Update queries file.sql](RollbackCommitUpdate.sql)  

### **RollbackCommitDelete Queries Script** – 
The SQL script containing all the `DELETE` queries with rollback and commit.    

  •[📜 Rollback And Commit Delete queries file.sql](delete_rollback&commit.sql)  




## Constraint queries:  

Provide the following SQL Constraint queries:  

### **ALTERTABLES Queries Script** – The SQL script containing all the `CONSTRAINT` queries.    

  •[📜 Constraint queries file.sql](ALTER_TABLES.SQL)

### **Constraint 1: Adding NOT NULL Harvest date cannot be empty.**  
 
![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/ALTER_TABLES.SQL/query1.1constraint.jpg?raw=true)   

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/ALTER_TABLES.SQL/query1.2constraint.jpg?raw=true)  



### **Constraint 2:Adding a CHECK constraint to ensure the grape variety color is either 'Red' or 'White'** 
![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/ALTER_TABLES.SQL/query2.1constraint.jpg?raw=true)   

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/ALTER_TABLES.SQL/query2.2constraint.jpg?raw=true)  

### **Constraint 3:Adding a DEFAULT value to the maturity_level column in the vine table** 

 ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/ALTER_TABLES.SQL/query3.1constraint.jpg?raw=true)   

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase2/ALTER_TABLES.SQL/query3.2constraint.jpg?raw=true)  



## **Backup**  

backups files are kept with the date and hour of the backup:  

  • [📂 Backup_Folder](Backups)
