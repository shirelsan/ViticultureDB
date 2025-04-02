## Phrase 1:  

# **מאגר נתונים לניהול גידול גפנים**  

מגישות: שיראל סננס - 31722145 טל שזיפי - 213878580  

## Table of Contents  

-[Phase 1: Design and Build the Database](#Phase 1: Design and Build the Database)  

-[introduction](introduction) 

-[ERD (Entity-Relationship Diagram)](ERD (Entity-Relationship Diagram))   
  
-[DSD (Data Structure Diagram)](DSD (Data Structure Diagram))  

-[SQL Scripts](#SQL Scripts) 

-[Data](Data)  

-[Backup](Backup)  


# Phase 1: Design and Build the Database

## introduction:  

מאגר הנתונים הזה מיועד לניהול מידע הקשור לגידול גפנים, טיפול בכרמים, סוגי זני הענבים, עובדים, תחזוקה, קטיף ומלאי.  

המערכת מבוססת על עקרונות של ארגון וייעול הפעולות השונות המתקיימות בתחום גידול הגפנים, ומספקת פתרון מבני ומסודר למעקב אחר פרטי הכרמים, הגפנים, העובדים וכלל התהליכים המתרחשים בשדה.  

### **מטרת המאגר:**  

המאגר נועד לשמש ככלי יעיל ומאורגן למעקב אחר כלל הפעולות הכרוכות בגידול גפנים:  

•	מעקב אחר גידול כרמים: ניהול החלקות השונות שבהן מגדלים את הגפנים, כולל מידע על המיקום, סוג האדמה וגודל השטח.  

•	ניהול הגפנים: אפשרות למעקב אחרי כל גפן בודדת בכרם, כולל רמות בשלות ותאריך נטיעה.  

•	מעקב אחר סוגי זני הענבים: מידע על סוגי הענבים השונים שנשתלים בכרם, כולל שם הזן וצבעו.  

•	ניהול עובדים: מידע על העובדים האחראים על התחזוקה והטיפול בגפנים, כולל שמותיהם, תפקידיהם ושנות העבודה.  

•	ניהול תחזוקה וקטיף: מעקב אחרי משימות תחזוקה בכרמים, קטיף הענבים ונתוני המלאי שנוצרים בעקבות הקטיף.   

המאגר מספק פתרון ארגוני ויעיל לניהול המידע הקשור לכל שלב בתהליך גידול הגפנים, משלב הנטיעה ועד שלב הקטיף ומכירת המלאי.  

## **ERD (Entity-Relationship Diagram)** 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/ERD.png?raw=true)  

## **DSD (Data Structure Diagram)**  

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/DSD.png?raw=true)   

## **DSD (Data Structure Diagram)**  

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/DSD%20(Data%20Structure%20Diagram)2.jpeg?raw=true)  

## **SQL Scripts**  

Provide the following SQL scripts:

**Create Tables Script** - The SQL script for creating the database tables is available in the repository:  

•[📜 View create_tables.sql](createTables.sql)

**Insert Data Script**- The SQL script for insert data to the database tables is available in the repository:  

•[📜 View Insert_Data.sql](insertTables.sql)  

**Drop Tables Script** - The SQL script for droping all tables is available in the repository:  

•[📜 View Drop_Tables.sql](dropTables.sql)

**Select All Data Script** - The SQL script for selectAll tables is available in the repository:  

•[📜 View Select_All Data.sql](selectAll.sql)  

## **Data**  
### **First tool: using mockaro to create csv file**</u>  
   
  • [📂 View File_Mockaroo](mockarooFiles)  
  
  for example:  
  
  ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/mockarooFiles/mockaroo.jpeg?raw=true)   
  
  for example from pgadmin:  
  
  ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/mockarooFiles/mockaroo-pgadmin.jpeg?raw=true)
  

### **Second tool: using python to create csv file**   
• [📂 View File_python](Programing)  
  
  for example:  
  
  ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/Programing/python.jpeg?raw=true)  
  
  for example from pgadmin:  
  
  ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/Programing/python-pgadmin.jpeg?raw=true) 

### **Third tool: using Excel to create csv file**  
• [📂 View File_Excel](DataImportFiles)  
  
   for example:   
   
  ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/DataImportFiles/Excel-pgadmin.jpeg?raw=true)   
  
  for example from pgadmin:  
  
  ![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase1/DataImportFiles/Excel.jpeg?raw=true)   
  
## **Backup**  

backups files are kept with the date and hour of the backup:  

• [📂 Backup_Folder](Backups)


