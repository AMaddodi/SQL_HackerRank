SELECT 
          CASE WHEN Grade < 8 THEN 'NULL' ELSE Name END,
          Grade, 
          Marks
FROM      Students
LEFT JOIN Grades
    ON Marks BETWEEN Min_Mark AND Max_Mark
ORDER BY  Grade DESC, Name ASC, Marks ASC;
