# Developing a Graphical User Interface for DB Interaction

# DBProject - שלב ה' | ממשק גרפי לניהול מערכת ייצור יין  

## Table of Contents  

 •[Phase 5: Introduction](#introduction)
 
  •[about the aplication](#אודות-האפליקציה)
   
  •[tools and technologies](#כלים-וטכנולוגיות)

  •[Installation and commissioning instructions](#הוראות-התקנה-והרצה)
  
  •[Explanation of the app screens](#הסבר-על-המסכים-של-האפליקציה)
    
  •[Files](#קבצים)
### introduction:
## אודות האפליקציה

אפליקציית ניהול זו נבנתה כחלק מפרויקט מסד נתונים לתהליך ניהול גפנים וייצור יין. המערכת מתממשקת עם בסיס נתונים PostgreSQL באמצעות Flask ומאפשרת ביצוע פעולות CRUD על ישויות עיקריות בפרויקט: עובדים (worker), פעולות שבוצעו (perform), וקטיף ענבים (harvest). 

האפליקציה מאפשרת:
- שליפה, הוספה, עדכון ומחיקה של נתונים בטבלאות.
- הפעלת שאילתות SQL מתקדמות.
- הפעלת פרוצדורות ופונקציות שנכתבו ב-PL/pgSQL.
- ממשק משתמש נוח ואינטואיטיבי בגוון חקלאי, המותאם למשתמש הקצה במפעל יין.

## כלים וטכנולוגיות

- **שפת תכנות**: Python 3.10
- **Framework**: Flask
- **מסד נתונים**: PostgreSQL (Dockerized)
- **Frontend**: HTML5, CSS3, Bootstrap 5
- **אחסון נתונים**: SQLAlchemy
- **הרצה מקומית**: Docker + pgAdmin

## הוראות התקנה והרצה

1. **הרצת בסיס הנתונים**:
   ודאו שה-Docker מותקן, והריצו את הקונטיינר של PostgreSQL והקובץ `docker-compose.yml` או את הפקודה:
   ```bash
   docker run --name postgres-db -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -e POSTGRES_DB=mydatabase -p 5432:5432 -d postgres

2.**התקנת ספריות Python:**




3.**הרצת האפליקציה:**
pip install -r requirements.txt


4.**כניסה למערכת:**
python app.py

היכנסו דרך הדפדפן לכתובת:
http://localhost:5000




## **הסבר על המסכים של האפליקציה:**
### מבנה המסכים באפליקציה
### 1. **מסך כניסה (Home Page)**
📷 ראו תמונה: ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/home_page.jpg?raw=true)  


**תיאור:**

זהו המסך הראשי של האפליקציה, אליו מגיע המשתמש מיד לאחר פתיחת המערכת. הוא כולל תפריט ניווט (למשל כפתורים או לינקים) המובילים לשאר המסכים: CRUD לעובדים, לקטיפים, לקישור בין עובדים לקטיפים, ומסך להרצת שאילתות ופרוצדורות.

**התרומה למערכת:**

יוצר נקודת פתיחה אחידה ונגישה, משפר את חוויית המשתמש ומאפשר ניווט מהיר לכל פעולה חשובה במערכת. תורם גם להפרדה ברורה בין חלקי המערכת.


### **2. מסך CRUD עבור טבלת worker**

📷 ראו תמונה: ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/worker_management.jpg?raw=true)  

**טבלאות רלוונטיות:** worker -טבלת עובדים.


**פעולות אפשריות במסך:**

-שליפה של כלל העובדים

-הוספה של עובד חדש

-עדכון של פרטי עובד קיים

-מחיקה של עובד

**שדות:**

*worker_id (מפתח ראשי)

*name

*age

*role

**הטמעה טכנית:**

שליפות מתבצעות עם שאילתות SELECT * FROM worker.

פעולות ההוספה/עדכון/מחיקה מתבצעות עם שאילתות INSERT, UPDATE, DELETE בהתאם.

**התרומה למערכת:**


העובדים הם משאב מרכזי בתהליך ייצור היין. ניהול יעיל של פרטי העובדים מאפשר בקרה על כוח האדם, הקצאת משימות, ושיוך של פעולות כמו קטיפים ועיבודים לעובדים מתאימים.

### **3. מסך CRUD עבור טבלת harvest**
📷 ראו תמונה: ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/harvests_list.jpg?raw=true)  

**טבלאות רלוונטיות:** harvest- נתוני קטיפים בפועל.


grape_variety: טבלת סוגי ענבים (משמשת כטבלת עזר ליצירת קשר בין קטיף לזן ענבים)

**פעולות אפשריות במסך:**

-צפייה ברשימת קטיפים קיימים

-הוספת קטיף חדש

-עדכון קטיף

-מחיקת קטיף

**שדות:**

*harvest_id

*harvest_date

*grape_variety_id (מפתח זר ל־grape_variety)

*amount_kg

**הטמעה טכנית:**

הצגת הקטיפים באמצעות SELECT * FROM harvest JOIN grape_variety USING (grape_variety_id)

שאילתות INSERT, UPDATE, DELETE לפי פעולה נבחרת

**התרומה למערכת:**

קטיף הענבים הוא תחילת תהליך הייצור. איסוף נתונים על תאריכים, כמויות וסוגים מאפשר בקרה חקלאית, תכנון מלאי ומעקב אחרי התוצר.

### **4. מסך CRUD עבור טבלת perform**

📷 ראו תמונה: ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/worker_to_harvest.jpg?raw=true)  



**טבלאות רלוונטיות:** perform  שמקשרת בין worker ו-harvest.



**פעולות אפשריות במסך:**

-צפייה בהקשרים בין עובדים לקטיפים

-הוספת פעולה (כלומר שיבוץ עובד לקטיף)

-עדכון נתוני ביצוע

-מחיקת שיבוץ

**שדות:**

*worker_id (FK)

*harvest_id (FK)

*date_participated

**הטמעה טכנית:**

SELECT perform.*, worker.name, harvest.harvest_date FROM perform JOIN worker USING (worker_id) JOIN harvest USING (harvest_id)

INSERT INTO perform (...), UPDATE, DELETE

**התרומה למערכת:**

טבלה זו מתעדת אילו עובדים לקחו חלק באילו קטיפים. מאפשרת בקרה על חלוקת העבודה, הפקת דו"חות, וניהול שכר או תגמולים על בסיס השתתפות.

## **5. מסך הפעלת שאילתות ופרוצדורות**

📷 ראו תמונה: ![screen1](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase5/Screenshots/queries.jpg?raw=true)  


**טבלאות רלוונטיות:**

כל טבלאות המערכת עשויות להשתתף לפי השאילתות והפרוצדורות שנבחרו.

**רכיבי המסך:**

-כפתורים להפעלת שאילתות מתקדמות

-כפתורים להפעלת פרוצדורות ופונקציות

-תיבת טקסט או טבלה להצגת התוצאות

🟢 שאילתה לדוגמה 1 – סיכום קטיפים:

SELECT harvest_date, SUM(amount_kg) AS total_harvested
FROM harvest
GROUP BY harvest_date
ORDER BY harvest_date;
**מטרה:** הצגת כמויות ענבים שנקטפו לפי תאריכים – כלי חשוב לתכנון ותיעוד תהליך הייצור.

🟢 שאילתה לדוגמה 2 – עובדים פעילים ביותר:

SELECT w.name, COUNT(*) AS num_of_participations
FROM perform p
JOIN worker w ON p.worker_id = w.worker_id
GROUP BY w.name
ORDER BY num_of_participations DESC;
**מטרה:** להבין מי מהעובדים לקח חלק בקטיפים הרבים ביותר.

🔵 פרוצדורה לדוגמה 1 – עדכון מלאי חומרים:

CALL update_material_stock(harvest_id := 5, usage_kg := 200);
תיאור: פרוצדורה שמעדכנת את המלאי בהתאם לקטיף שבוצע וכמות החומר שנצרכה.

🔵 פונקציה לדוגמה 2 – כמות קטיפים לעובד:

SELECT count_harvests_by_worker(3);
תיאור: מקבלת מזהה של עובד ומחזירה את מספר הקטיפים בהם השתתף.

**התרומה למערכת:**

זהו מסך עוצמתי למשתמשים מתקדמים או מנהלים. מאפשר תובנות עסקיות, תכנון, בדיקת ביצועים וסטטיסטיקות תפעוליות, וכן שליטה ישירה בפרוצדורות ניהול כמו עדכון מלאים או הפקת דו"חות משתנים.

## **קבצים**

**קוד מקור:**  בתיקייה app/

**הוראות הרצה:** בקובץ זה ובקובץ (לשנות ---instructions.txt

**תמונות מסך:** בתיקייה screenshots/


