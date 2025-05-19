# Phase 3: Integration & View: 

## Table of Contents  

 •[Phase 3: Introduction](#introduction)
  
•[Backup file of wine production](#backup-file-of-wine-production) 
  
•[DSD (Data Structure Diagram from the PgAdmin)](#dsd-data-structure-diagram-from-the-pgadmin)   
    
•[ERD (Entity-Relationship Diagram)](#erd-entity-relationship-diagram)

•[DSD (Data Structure Diagram Second from the ERD)](#dsd-data-structure-diagram-second-from-the-erd)
  
•[Merged DSD of the 2 DB from ERDplus](#merged-dsd-of-the-2-db-from-erdplus)
  
•[Merged DSD of the 2 DB from PgAdmin](#merged-dsd-of-the-2-db-from-pgadmin)
  
  •[הסבר על הERD הממוזג](#הסבר-על-הERD-הממוזג)
  
  •[Views](#views)
    
  •[Backup](#backup)

## Introduction:  
# שלב ג - אינטגרציה ומבטים: שילוב מערכות ייצור יין וניהול כרם

## מבוא

בשלב זה אנו מתמקדים באינטגרציה של שתי מערכות משלימות בענף היין: מערכת ייצור יין ומערכת ניהול הכרמים. המטרה היא ליצור מאגר נתונים משולב המכסה את שרשרת הערך המלאה של ייצור היין - מטיפוח הגפנים בכרם ועד לייצור היין הסופי ובקבוקיו.

## מטרת האינטגרציה

האינטגרציה בין מערכת ייצור יין למערכת ניהול הכרמים נועדה:

• **לספק תמונה מלאה של שרשרת הערך**: יצירת רצף מידע מהכרם ועד לבקבוק, שיאפשר מעקב אחר מקור הענבים בכל מנת ייצור.

• **לייעל את תהליכי העבודה**: חיבור הנתונים מאפשר תכנון טוב יותר של מועדי קטיף, קליטת ענבים ותהליכי ייצור בהתאם לבשלות הענבים ולצרכי היקב.

• **לשפר את ניהול האיכות**: שילוב המידע מהכרם והיקב מאפשר הבנה טובה יותר של הקשר בין תנאי גידול, זני ענבים ואיכות היין הסופי.

• **לאפשר יכולות ניתוח מתקדמות**: אינטגרציה של הנתונים מאפשרת ניתוחים חוצי-מערכת, כגון השפעת תנאי גידול וזני ענבים על יעילות תהליכי הייצור ואיכות המוצר הסופי.

## תהליך האינטגרציה שבוצע

במסגרת השלב הנוכחי:

**ביצענו הינדוס לאחור** של מערכת ניהול הכרמים, כדי להבין את מבנה הנתונים ואת היחסים בין הישויות.

 **יצרנו תרשימי DSD ו-ERD** למערכת החיצונית, שמשקפים את מבנה הנתונים והקשרים הלוגיים בין הישויות.

 **ניתחנו נקודות ממשק פוטנציאליות** בין מערכת ניהול היקב למערכת ניהול הכרמים, תוך התמקדות בישויות משותפות כגון זני ענבים, עובדים ותהליכי עבודה.

 **תכננו מודל משולב** שמאחד את שתי המערכות תוך שמירה על שלמות הנתונים והלוגיקה העסקית של כל מערכת.

## תובנות מהאינטגרציה

תהליך האינטגרציה אפשר לנו:

• להבין כיצד שתי מערכות שפותחו בנפרד יכולות להשלים זו את זו וליצור מערכת מקיפה יותר.

• לזהות פערים או כפילויות במידע בין המערכות, ולתכנן פתרונות לטיפול בהם.

• להעמיק את ההבנה של שרשרת הערך המלאה בתעשיית היין, מהכרם ועד לבקבוק.

• לתכנן מבטים (Views) שיאפשרו להציג מידע משולב משתי המערכות, כגון מעקב אחר ענבים מזן מסוים מרגע הנטיעה ועד להפיכתם ליין בבקבוק.

המודל המשולב שיצרנו מהווה בסיס איתן למערכת מידע מקיפה שתתמוך בכל שלבי הייצור והעיבוד של היין, ותאפשר ניהול מיטבי של משאבי היקב והכרם כאחד.   

## Backup file of wine production

 •[📜Backup file of wine production ](Backup_22042025%20(1).backup)  
 
## **DSD (Data Structure Diagram from the PgAdmin)**  

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/DSDfromthepgadmin.png?raw=true)  

## **ERD (Entity-Relationship Diagram)** 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/ERDfromtheDSDfromthepgadmin.png?raw=true)  

## **DSD (Data Structure Diagram Second from the ERD)**  

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/DSDfromtheERD.png?raw=true)   

## **Merged ERD of the 2 DB** 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/ERDproductiomwineandgrowinggrapes.png?raw=true) 

## **Merged DSD of the 2 DB from ERDplus**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/dsdfinal.png?raw=true)

## **Merged DSD of the 2 DB from PgAdmin**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/DSDend.png?raw=true) 

## **הסבר על הERD הממוזג:**  

 •[📜Integrate file of wine production and growing grapes ](merge/Integrate.sql)  

ניתן לראות בתמונה ERD שממזג בין ייצור יין לגידול גפנים. ניתן לראות שיש קשר בין 2 התחומים בכמה דברים כגון קשר בין מלאי לתהליך ייצור, קשר בין עובד לתהליך ייצור ועוד...  

נפרט פה על השינויים העיקריים שעשינו, ראשית מה שנשאר אותו דבר זה מכיוון שלא היה שייך ליצור קשרים בין היישויות האלו.  

### **שינוי ראשון שעשינו זה יצירת קשר חדש בין inventory -מלאי ל,productionprocess- תהליך ייצור.**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/merge1.jpg?raw=true) 


**הסבר על הקשר החדש:**

הקשר "inventory_process" בין טבלת המלאי לטבלת תהליך הייצור הוא קשר מסוג רבים-לרבים שמשקף מציאות עסקית בה פריט מלאי אחד יכול לשמש במספר תהליכי ייצור שונים, ותהליך ייצור אחד יכול לדרוש מספר פריטי מלאי. קשר זה מאפשר ניהול יעיל של המלאי ותכנון הייצור, תומך בחישובי עלויות ומספק בסיס לקבלת החלטות יעילות לגבי רכש וייצור. 


### **שינוי שני שעשינו זה יצירת קשר חדש בין worker -עובד ל,productionprocess- תהליך ייצור.**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/merge2.jpg?raw=true) 


**הסבר על הקשר החדש:**

הקשר "worker_performs_process" שהוספנו מייצג קשר רבים-לרבים  בין עובדים לתהליכי ייצור, ומתואר באמצעות טבלת קישור. קשר זה מתעד אילו עובדים מבצעים אילו תהליכי ייצור, ומאפשר גמישות רבה בניהול כוח האדם בסביבת הייצור. המשמעות העסקית היא שעובד אחד יכול להיות מעורב במספר תהליכי ייצור שונים, ובמקביל תהליך ייצור ספציפי יכול להיות מבוצע על ידי מספר עובדים. טבלה זו מאפשרת לארגון לעקוב אחר הקצאת עובדים, לנהל מיומנויות וכשירויות, לתכנן משמרות עבודה, ולנתח יעילות ופרודוקטיביות של עובדים בתהליכי ייצור שונים.

### **שינוי שלישי שעשינו זה הכנסת employee לworker** 

מכיוון שבemployee היה את כל הששדות שיש לנו בworker ואפילו בworker יש לנו שדה נוסף של שנת תחילת עבודה החלטנו לעשות כך. 

עשיני את זה בדרך הבאה: השארנו את worker כמו שהוא, העברנו את כל הנתונים שבemplloyee לטבלת worker ובשדה שלא קיים בemplloyee שזה שנת תחילת עבודה שמנו בהם null.

**תמונה שממחישה זאת:**


![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/merge4.jpg?raw=true) 


![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/merge3.jpg?raw=true) 


### **שינוי רביעי שעשינו זה הכנסת הנתונים מטבלת Grapes בDB שקיבלנו לטבלאות Harvest וVineyard** 
המטרה: מיזוג הנתונים מהטבלה grapes (DB שקיבלנו) אל תוך הטבלאות הקיימות ב־DB שלנו ללא כפילויות.

כיוון שהטבלה grapes מכילה שתי עמודות עם נתונים הקיימים אצלנו בטבלאות נפרדות נעשה זאת בשני שלבים. 

התאמת בין השדות : 

| טבלת היעד (DB שלך) | טבלת המקור (grapes) |
| ------------------ | ------------------- |
| `vine_id`          | `grapeid`           |
| `harvest_date`     | `harvestdate_`      |

ואת שאר העמודות אצלנו (vineyard_id, location, quantity, inventory_id וכו’) כיוון שהן לא קיימות ב־grapes, נכניס NULL.

**הרצה שלב 1 לטבלת Harvest :**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/1.2.jpeg?raw=true) 

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/1.1.jpeg?raw=true) 


• הכנסו רק harvest_date ול- quantity או inventory_id מכניסים NULL.

על מנת למנוע כפילויות עם harvest_id השתמשנו בROW_NUMBER() OVER () כדי לייצר מספר רץ שיתחיל ב1000. 

בנוסף אנחנו בודקות עם NOT EXISTS כדי לא להכניס תאריכים שכבר קיימים בטבלה harvest.


**הרצה שלב 2 לטבלת וVineyard :**

• הכנסה ל-vineyard וצירוף harvest_id שמתאים ל־harvestdate_ בנוסף בדיקה שאין רשומה זהה. 

• אם grapeid לא קיים בטבלת vine – נכניס אותו לטבלה vine עם ערכים NULL (לשדות v_date ו־maturity_level) ואז נוכל להמשיך להכניס את הנתונים לטבלת vineyard. 

חלק א - הוספת ערכים חסרים ל־vine כלומר מוסיף ל־vine את כל ה־grapeids שלא קיימים שם, עם ערכים חסרים.

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/2.1.jpeg?raw=true) 

חלק ב - ההכנסה ל־vineyard רק עבור רשומות שעדיין לא קיימות, עם vine_id תקף.

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/2.2.jpeg?raw=true) 

**תמונה שממחישה את המיזוג:**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/merge/2.3.jpeg?raw=true) 


# Views:  

 •[📜View file of wine production and growing grapes](view/Views.sql)  

## **View 1 - view_maintenance_task_info
**תיאור מילולי:**
המבט maintenance_task_info נועד להציג מידע מרוכז עבור משימות תחזוקה שהתבצעו בכרמים.

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/view1.jpg?raw=true) 

**הטבלה שנוצרה לאחר הרצת הview:**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/Q1-V1-2.png?raw=true) 


**הסבר על המבט:**   

המבט maintenance_task_info נועד להציג מידע מרוכז עבור משימות תחזוקה שהתבצעו בכרמים.
המבט מאגד מידע ממספר טבלאות:

•	הטבלה  Maintenace - שמכילה פרטי משימות (סוג המשימה, תאריך),

•	הטבלה  Worker-שממנה נמשכת זהות העובד שביצע את המשימה,

•	הטבלה - Receive שמחברת בין משימה לבין כרם מסוים,

•	הטבלה vineyard  -שמספקת מידע נוסף על הכרם עצמו (מיקום, סוג קרקע).

באמצעות שילוב זה, ניתן לקבל תמונה מלאה על משימות שבוצעו:
מי ביצע אותן, מתי, מה היה סוג המשימה, ובאיזה מיקום וסוג קרקע היא בוצעה.

### **שאילתה 1:**

מציגה את מספר משימות התחזוקה שבוצעו בכל סוג קרקע.
המטרה היא להבין אילו סוגי קרקע דורשים הכי הרבה תחזוקה, על ידי ספירה של מספר המשימות שבוצעו בכל אחד מהם.
התוצאה ממוינת כך שסוג הקרקע עם הכי הרבה משימות יופיע ראשון.

**תמונה של הרצת השאילתה+הטבלה שנוצרה:**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/Q1-V1-3.png?raw=true) 


### **שאילתה 2:**   

מזהה עבור כל כרם את העובד שביצע בו את מספר משימות התחזוקה הגבוה ביותר.
השאילתה עושה שימוש בתת-שאילתה כדי למצוא את מספר המשימות המקסימלי בכל כרם, ומשווה אליו את מספר המשימות של כל עובד באותו כרם.
כך מתקבל עובד מוביל לכל כרם – זה שעבד בו הכי הרבה.

**תמונה של הרצת השאילתה+הטבלה שנוצרה:**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/Q2-V1-2.png?raw=true) 

## **View 2 - view_container_process_info 

**תיאור מילולי:**

המבט container_process_info נועד להציג מידע מרוכז על תהליכי ייצור והשימוש שנעשה במיכלים במסגרת תהליכים אלו.


![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/1.jpeg?raw=true) 


**הטבלה שנוצרה לאחר הרצת הview:**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/2.jpeg?raw=true) 



**הסבר על המבט:** 
המבט container_process_info מציג מידע מקיף על השימוש במיכלים בתהליכי הייצור.
הוא מחבר בין טבלאות המיכלים, תהליכי הייצור והקשרים ביניהם, כדי לספק תצוגה אינטגרטיבית הכוללת:

• מזהה המיכל, סוגו וקיבולת הליטרים שלו.

• מזהה התהליך בו נעשה שימוש במיכל.

• סוג התהליך, תאריך התחלה ותאריך סיום.

• מספר האצווה של המוצר הסופי הקשור לתהליך.

באמצעות מבט זה ניתן להבין אילו מיכלים שימשו באילו תהליכים, לנתח את ההתאמה בין סוג התהליך לקיבולת המיכל, ולעקוב אחר השפעת בחירת המיכל על תהליך הייצור והמוצר המוגמר.


### **שאילתה 1:**

תיאור מילולי:השאילתה מחשבת את סך קיבולת המיכלים (בליטרים) שנעשה בהם שימוש, לפי סוג תהליך הייצור.
המטרה היא להבין אילו סוגי תהליכים דורשים שימוש רב יותר במיכלים מבחינת נפח כולל.



**תמונה של הרצת השאילתה+הטבלה שנוצרה:**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/3.jpeg?raw=true) 


### **שאילתה 2:**   

תיאור מילולי:תהליכי הייצור שנמשכו הכי הרבה זמן, ושנעשה בהם שימוש במיכלים הגדולים ביותר.
המטרה היא לזהות אילו תהליכים ממושכים דרשו שימוש במיכלים הגדולים ביותר, כדי להסיק על הקשר בין משך התהליך לציוד הדרוש.



**תמונה של הרצת השאילתה+הטבלה שנוצרה:**

![ERD diagram](https://github.com/shirelsan/ViticultureDB/blob/main/Phrase3/view/4.jpeg?raw=true) 

## **Backup**  

backups files are kept with the date and hour of the backup:  

  • [📂 Backup_Folder](Backups)

