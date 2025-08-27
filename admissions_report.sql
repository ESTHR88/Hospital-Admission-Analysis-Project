--- Show all Patient's Records
SELECT * FROM Adm;

--Total number of admissions
SELECT COUNT(*) AS Total_Admissions FROM Adm;
--Find the type of admission 
SELECT  DISTINCT [TYPE_OF_ADMISSION_EMERGENCY_OPD] FROM Adm ;
---Admission per month
SELECT month_year,COUNT(*) AS Admissions FROM Adm GROUP BY month_year order by month_year;
-- Count of Emergency vs OPD Admissions
SELECT 
    [TYPE_OF_ADMISSION_EMERGENCY_OPD], 
    COUNT(*) AS AdmissionCount
FROM Adm
GROUP BY [TYPE_OF_ADMISSION_EMERGENCY_OPD];


--Gender distribution of patients
SELECT Gender, COUNT(*) AS PatientCount
FROM Adm
GROUP BY Gender;


-- Find the avaerage duration of stay in the hospital
SELECT 
    month_year,
    ROUND(AVG(CAST(DURATION_OF_STAY AS FLOAT)), 0) AS AvgStay
FROM Adm
GROUP BY month_year order by month_year

---Findings of patients having fatal disease conditon

SELECT 'STEMI' AS Condition, COUNT(*) as patients
FROM Adm WHERE STEMI = 1
UNION
SELECT 'HEART_FAILURE', COUNT(*) as pateints FROM Adm WHERE [HEART_FAILURE] = 1
UNION
SELECT 'ACS', COUNT(*) as patients FROM Adm WHERE ACS = 1;

---Patient Outcome after Hert Failure 
SELECT OUTCOME, COUNT(*) AS TOTAL
FROM Adm
WHERE [HEART_FAILURE] = 1
GROUP BY OUTCOME;

--Find the outcome Expiry, Discharge or DAMA
SELECT OUTCOME, COUNT(*) AS Count
FROM Adm
GROUP BY OUTCOME;


-- If any patient has comorbidity
SELECT COUNT(*) AS Multi_Comorbidity
FROM Adm
WHERE DM = 1 AND HTN = 1 AND CAD = 1;

SELECT COUNT(*) AS no_Comorbidity
FROM Adm
WHERE DM = 0 AND HTN = 0 AND CAD = 0;

--- STEMI Admissions to assess the prevalence trend
SELECT [month_year], COUNT(*) AS STEMI_admissions
FROM Adm
WHERE STEMI = 1
GROUP BY [month_year]
ORDER BY [month_year];
