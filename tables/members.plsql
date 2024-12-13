CREATE TABLE MEMBERS (
    MEMBER_ID NUMBER PRIMARY KEY,
    FIRST_NAME VARCHAR2(40) NOT NULL,
    LAST_NAME VARCHAR2(80) NOT NULL,
    MOTHERS_NAME VARCHAR2(120) NOT NULL,
    MOTHERS_TELEPHONE_NUMBER VARCHAR2(12) NOT NULL,
    MOTHERS_EMAIL VARCHAR2(60) NOT NULL,
    MEMBER_EMAIL VARCHAR2(60),
    MEMBER_TELEPHONE_NUMBER VARCHAR2(12),
    ADDRESS_ID NUMBER,
    BIRTH_DATE DATE,
    ORS_ID NUMBER,
    PATROL_ID NUMBER,
    CONSTRAINT MEMBERS_EMAIL_U UNIQUE (MEMBER_EMAIL),
    CONSTRAINT MEMBERS_TELEPHONE_NUMBER_U UNIQUE (MEMBER_TELEPHONE_NUMBER),
    CONSTRAINT MEMBERS_ORS_FK FOREIGN KEY (ORS_ID) REFERENCES ORS(ORS_ID),
    CONSTRAINT MEMBERS_PATROL_FK FOREIGN KEY (PATROL_ID) REFERENCES PATROL(PATROL_ID),
    CONSTRAINT MEMBERS_ADDRESS_FK FOREIGN KEY (ADDRESS_ID) REFERENCES ADDRESS(ADDRESS_ID)
) TABLESPACE USERS;

CREATE TABLE MEMBER_HIS (
    CHANGE_ID NUMBER PRIMARY KEY,
    CHANGER VARCHAR2(40) NOT NULL,
    LOG_MSSG VARCHAR2(4000) NOT NULL,
    TR_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION GET_RANDOM_GROUP_LEADER_FUNC RETURN MEMBERS%ROWTYPE IS
    V_RESULT MEMBERS%ROWTYPE;
BEGIN
    SELECT T2.* INTO V_RESULT
    FROM (
            SELECT T1.*
            FROM (
                    SELECT *
                    FROM MEMBERS
                    WHERE HAVE_MEMBER_RANK_BY_NAME_FUNC(
                            P_MEMBER_ID => MEMBERS.MEMBER_ID /*IN NUMBER*/,
                            P_RANK_NAME => 'GROUP_LEADER' /*IN VARCHAR2*/
                        ) = 1 AND
                        ROWNUM = 1
                ) T1
            ORDER BY DBMS_RANDOM.VALUE
        ) T2;
    RETURN V_RESULT;
END GET_RANDOM_GROUP_LEADER_FUNC;
/