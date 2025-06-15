# Developing a Graphical User Interface for DB Interaction

## ממשק גרפי לניהול מערכת כרם וייצור יין

## Table of Contents  

 •[Introduction](#introduction)
 
  •[about the aplication](#אודות-האפליקציה)

  •[Installation and commissioning instructions](#הוראות-הפעלה-וכניסה-לממשק)
  
  •[Explanation of the app screens](#מבנה-המסכים-באפליקציה)

   •[tools and technologies](#מבנה-הקבצים-בפרויקט)
    
  •[Code_Files](#Code_Files:)
  
### introduction:
## אודות האפליקציה

אפליקציית הניהול שפיתחנו מהווה חלק מפרויקט מסדי נתונים לניהול תהליכי עבודה בכרם ובמפעל ייצור יין.

האפליקציה בנויה בטכנולוגיות Flask בצד השרת בשילוב PostgreSQL כבסיס הנתונים, ומאפשרת למשתמשים לנהל בצורה יעילה את הנתונים המרכזיים של הארגון.

### מטרת הפרויקט
מטרת הפרויקט היא לספק כלי נוח לניהול פעילות יומיומית של הכרם, תוך שמירה על שלמות הנתונים ואפשרות לבצע בקרה בזמן אמת על העובדים,פעילויות התחזוקה והקטיף.

באמצעות הממשק, מנהלי הכרם יכולים לעקוב אחרי פעולות העובדים בזמן אמת, להפיק דוחות על משימות שבוצעו, ולוודא שהמלאי מעודכן בהתאם לקטיפים שנעשו.

בנוסף, המערכת מקלה על ניהול הנתונים לאורך זמן ומאפשרת תחזוקה פשוטה ונוחה של המידע.

### מאפיינים עיקריים
האפליקציה כוללת ממשק משתמש גרפי בדפדפן (מבוסס HTML ו־CSS) ומאפשרת:

• **ניהול עובדים (worker)** – צפייה בפרטי עובדים, הוספה, עדכון ומחיקה.

• **ניהול פעולות קציר (harvest)** – תיעוד קטיפים, צפייה, עדכון ומחיקה של אירועי קטיף.

• **ניהול פעולות שבוצעו (perform)** – קישור בין עובדים לקטיפים שביצעו.

• **שליפת נתונים באמצעות שאילתות מתקדמות** – הפעלת שאילתות SQL המציגות מידע משולב ממספר טבלאות.

• **הרצת פונקציות ופרוצדורות שנכתבו ב־PL/pgSQL** – לטיפול אוטומטי בעדכון תפקידים, כמו גם חישוב כמויות מלאי על בסיס קטיפים שבוצעו.

• **ממשק אינטרנטי נגיש ונוח** – הממשק פועל בדפדפן האינטרנט ומיועד למשתמשי קצה במפעל היין ובכרם, תוך הקפדה על ידידותיות למשתמש ועיצוב נקי עם אווירה חקלאית.

## הוראות הפעלה וכניסה לממשק:

1. **לוודא שה-PostgreSQL (או Docker אם הבסיס רץ דרכו) פעיל**
   
יש לוודא שהשרת של בסיס הנתונים מופעל והטבלאות הנדרשות קיימות.

2. **להריץ את הקוד**

לפתוח טרמינל/שורת פקודה בתיקיית הפרויקט ולהריץ את הפקודה: python app.py.

לאחר ההרצה תופיע הודעה שהשרת עלה, לדוגמה:
  ```python
* Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
  ```
3. **להיכנס לממשק בדפדפן**
לפתוח דפדפן ולהזין את הכתובת:
```cpp
http://127.0.0.1:5000/
```
הממשק ייטען ותוכלו להתחיל להשתמש במערכת.
 
## **מבנה המסכים באפליקציה:**

## 1. **מסך כניסה (Home Page)**

**תיאור:**
זהו המסך הראשי של האפליקציה, אליו מגיע המשתמש מיד לאחר פתיחת המערכת. הוא כולל תפריט ניווט המובילים לשאר המסכים: CRUD לעובדים, לקטיפים, לקישור בין עובדים לקטיפים, ומסך להרצת שאילתות ופרוצדורות.

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/home_page.jpg?raw=true)  


## 2. **מסך ניהול עובדים**

**תיאור:**
במסך זה ניתן לצפות ברשימת העובדים הקיימים, להוסיף עובד חדש, לערוך פרטי עובד, לעדכן תפקידים ושנות ותק, וכן למחוק עובדים ממסד הנתונים.

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/worker_management.jpg?raw=true)  


## 3. **מסך ניהול קצירים**

**תיאור:**
במסך זה ניתן לצפות בנתוני הקטיפים, להוסיף קטיף חדש, לערוך נתוני קטיף קיים (כמו תאריך וכמות), ולעדכן או למחוק קטיפים על פי הצורך.

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/harvests_list.jpg?raw=true)  


## 4. **מסך שיוך עובדים**

**תיאור:** 
במסך זה ניתן לשייך עובדים לקטיפים שבוצעו, לצפות בקשרים הקיימים בין עובדים לקטיפים, ולהוסיף או להסיר שיוכים בין עובדים לקטיפים.

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/worker_to_harvest.jpg?raw=true)  


## **5. מסך הפעלת שאילתות, פונקציות ופרוצדורות**

**תיאור:**
במסך זה ניתן להריץ שאילתות SQL מתקדמות לקבלת דוחות ומידע מהמערכת, להפעיל פונקציות מובנות לביצוע עדכונים מבוקרים בנתונים, ולהריץ פרוצדורה שמבצעת עדכונים במסד הנתונים, כגון עדכון כמויות מלאי או שינוי תפקידי עובדים בהתאם לנתוני קטיפים ותחזוקה.

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/queries.jpg?raw=true)  


• שאילתה להצגת עובדים עם תפקידים ומשימות:

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/Q1.jpg?raw=true)  


• שאילתה להצגת מספר משימות לכל עובד:
 
 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/Q2.jpg?raw=true) 

• שאילתה להצגת עובדים שבצעו גם פעולות תחזוקה וגם קציר:
 
 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/Q3.jpg?raw=true)
 
• פונקציה עדכון תפקידים לפני שנות עבודה:

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/func1.jpg?raw=true)

• פונקציה סיכום פעולות תחזוקה בהתאם לתאריך:

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/func2.jpg?raw=true)
 
• פרוצדורה עדכון מלאי לפי קציר:

 ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/pro1.jpg?raw=true)


### **מבנה הקבצים בפרויקט**
מבנה הפרויקט כולל את הקבצים והתיקיות הבאים:
```cpp
/project_root
│
├── app.py                
│
├── /templates             
│   ├── index.html
│   ├── worker.html
│   ├── edit_worker.html
│   ├── harvest.html
│   ├── edit_harvest.html
│   ├── perform.html
│   ├── queries.html
│
└── /static                
    └── style.css, תמונת רקע
```
• קובץ app.py – קובץ ראשי שבו מוגדרים הנתיבים (routes) של האפליקציה, החיבורים למסד הנתונים, ועיבוד הנתונים.

• תקיית templates/ – מכילה את כל קבצי התבניות (HTML) שאיתם Flask מייצר את דפי האפליקציה המוצגים בדפדפן.

• תקיית static/ – תיקייה עבור משאבים סטטיים כמו עיצוב (CSS), תמונות,Jt וכו'..

### שימוש טכנולוגי:

- **שפת תכנות**: Python (ספריית Flask)
- **מסד נתונים**: PostgreSQL (Dockerized)
- **שפות צד לקוח**: HTML, CSS
- **שרת**: SQLAlchemy
- **הרצה מקומית**: Flask (פועל מקומית או בענן)

## **Code Files:**

 • [📂 code_files](phrase5_code)
 
**קובץ הוראות הרצה:** instructions.txt
