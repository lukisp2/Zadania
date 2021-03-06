CREATE TABLE STATS (
        STAT_ID INT(11) AUTO_INCREMENT PRIMARY KEY,
        STAT_DATE DATETIME NOT NULL,
        STAT VARCHAR(20) NOT NULL,
        VALUE INT(11) NOT NULL
);

CREATE VIEW BESTSELLERS_COUNT AS
    SELECT COUNT(*) AS BESTSELLER_NUMBER FROM BOOKS
    WHERE BESTSELLER=1;


DELIMITER $$
CREATE PROCEDURE StatsUpdate()
BEGIN
    DECLARE result INT(10) DEFAULT 0;
    CALL UpdateBestSellers();
    SELECT BESTSELLER_NUMBER FROM BESTSELLERS_COUNT INTO result;
    INSERT INTO STATS (STAT_DATE, STAT, VALUE)
        VALUE (CURTIME(),"BESTSELLER",result);
END $$
DELIMITER ;


DELIMITER $$
CREATE EVENT UPDATE_STATS
    ON SCHEDULE EVERY 1 MINUTE
    DO BEGIN
    CALL StatsUpdate();
END$$
    DELIMITER ;


    DROP EVENT UPDATE_STATS;
