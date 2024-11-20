-- TODO: Create user
DECLARE
    V_COUNT NUMBER;
BEGIN
    SELECT
        COUNT(*) INTO V_COUNT
    FROM
        DBA_USERS T
    WHERE
        T.USERNAME='CSERKESZ_ADMIN';
    SELECT
        COUNT(*) INTO V_COUNT
    FROM
        DBA_USERS T
    WHERE
        T.USERNAME='DOG_MANAGER';
    IF V_COUNT = 1 THEN
        EXECUTE IMMEDIATE 'DROP USER CSERKESZ_ADMIN CASCADE';
    END IF;
END;
/

CREATE USER CSERKESZ_ADMIN IDENTIFIED BY 12345678 DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

/

GRANT CREATE TRIGGER TO CSERKESZ_ADMIN;

GRANT CREATE SESSION TO CSERKESZ_ADMIN;

GRANT CREATE TABLE TO CSERKESZ_ADMIN;

GRANT CREATE VIEW TO CSERKESZ_ADMIN;

GRANT CREATE SEQUENCE TO CSERKESZ_ADMIN;

GRANT CREATE PROCEDURE TO CSERKESZ_ADMIN;

GRANT CREATE TYPE TO CSERKESZ_ADMIN;

ALTER SESSION SET CURRENT_SCHEMA=CSERKESZ_ADMIN;

-- TODO: Taglista tábla

CREATE TABLE MEMBERS (
    MEMBER_ID NUMBER PRIMARY KEY,
 
    --Személyes adatok
    FIRST_NAME VARCHAR2(40) NOT NULL,
    LAST_NAME VARCHAR2(80) NOT NULL,
    MOTHERS_NAME VARCHAR2(120) NOT NULL,
    MOTHERS_TELEPHONE_NUMBER VARCHAR2(12) NOT NULL,
    MOTHERS_EMAIL VARCHAR2(60) NOT NULL,
    MEMBER_EMAIL VARCHAR2(60),
    MEMBER_TELEPHONE_NUMBER VARCHAR2(12),
    ADDRESS_ID NUMBER NOT NULL,
    BIRTH_DATE DATE,
    ORS_ID NUMBER,
    PATROL_ID NUMBER
) TABLESPACE USERS;

-- TODO: CONSTRAINTS FOR THE TABLE (address, ors, patrol)

-- TODO: Levelezési cim tábla
-- Create a new relational table with 3 columns

CREATE TABLE ADDRESS (
    ADDRESS_ID NUMBER PRIMARY KEY,
    ZIP_CODE VARCHAR2(10) NOT NULL,
    COUNTRY VARCHAR2(50) NOT NULL,
    CITY VARCHAR2(50) NOT NULL,
    STREET_NAME VARCHAR2(100) NOT NULL,
    STREET_TYPE VARCHAR2(40) NOT NULL,
    HOUSE_NUMBER VARCHAR2(30) NOT NULL,
);

-- TODO: Őrs tábla
    CREATE TABLE ORS (
    ORS_ID NUMBER PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    PATROL_ID NUMBER NOT NULL,
);

-- FOREIGN KEY (patrol_id) REFERENCES patrol (patrol_id)
-- TODO: Raj tábla

-- TODO: Státusz, jogosultság tábla
-- TODO: History taglista és Státusz,jogosultság táblához

-- TODO: Gyűlésjelentések tábla
-- TODO: Gyűlésjelentések History

-- TODO: Megbeszélés tábla
-- TODO: Megbeszélés szerkesztési history

-- TODO: Programlista tábla
-- TODO: Feladatlista tábla
-- TODO: Program/feladat history

-- TODO: Tudásbázis tábla

-- TODO: Blog/news tábla