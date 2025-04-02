-- שליפת כל הנתונים מכל הטבלאות
SELECT * FROM vine;
SELECT * FROM worker;
SELECT * FROM maintenace;
SELECT * FROM inventory;
SELECT * FROM grape_variety;
SELECT * FROM harvest;
SELECT * FROM perform;
SELECT * FROM vineyard;
SELECT * FROM Receive;

-- בדיקת מספר השורות בכל טבלה
SELECT COUNT(*) AS total_rows FROM vine;
SELECT COUNT(*) AS total_rows FROM worker;
SELECT COUNT(*) AS total_rows FROM maintenace;
SELECT COUNT(*) AS total_rows FROM inventory;
SELECT COUNT(*) AS total_rows FROM grape_variety;
SELECT COUNT(*) AS total_rows FROM harvest;
SELECT COUNT(*) AS total_rows FROM perform;
SELECT COUNT(*) AS total_rows FROM vineyard;
SELECT COUNT(*) AS total_rows FROM Receive;