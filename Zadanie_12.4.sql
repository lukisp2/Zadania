SELECT  I.SUMMARY , I.DESCRIPTION, IL.NAME
FROM ISSUES I
         JOIN ISSUESLISTS IL ON I.ISSUESLIST_ID = IL.ID;

SELECT I.SUMMARY, I.DESCRIPTION, U.FIRSTNAME, U.LASTNAME
FROM ISSUES I
         JOIN USERS U on I.USER_ID_ASSIGNEDTO = U.ID;

SELECT U.FIRSTNAME, U.LASTNAME, COUNT(*) AS NO_OF_TASKS
FROM USERS U JOIN ISSUES I on U.ID = I.USER_ID_ASSIGNEDTO
GROUP BY U.ID
HAVING COUNT(*) >=1