EXPLAIN SELECT * FROM READERS
WHERE FIRSTNAME = "UPDATED JOHN";

CREATE INDEX FIRSTNAME_INDEX ON READERS (FIRSTNAME);
CREATE INDEX LASTNAME_INDEX ON READERS (LASTNAME);
CREATE INDEX TITLE_INDEX ON BOOKS (TITLE);

EXPLAIN SELECT * FROM READERS
        WHERE FIRSTNAME = "UPDATED JOHN";