CREATE OR REPLACE TABLE EVENTS (
    EVENT_ID NUMBER PRIMARY KEY,
    EVENT_NAME VARCHAR2(100) NOT NULL,
    EVENT_DESCRIPTION VARCHAR2(2000) NOT NULL,
    DATE_START TIMESTAMP NOT NULL,
    DATE_END TIMESTAMP NOT NULL
);

CREATE OR REPLACE TABLE DUTIES (
    DUTY_ID NUMBER PRIMARY KEY,
    DUTY_NAME VARCHAR2(100) NOT NULL,
    DUTY_DESCRIPTION VARCHAR2(500),
    EVENT_ID NUMBER NOT NULL,
);

ALTER TABLE DUTIES
    ADD CONSTRAINT DUTIES_EVENT_FK FOREIGN KEY (
        EVENT_ID
    )
        REFERENCES EVENTS(
            EVENT_ID
        );

CREATE OR REPLACE TABLE EVENT_DUTIES_HIS (
    LOG_ID NUMBER PRIMARY KEY,
    AUTHOR_ID NUMBER NOT NULL,
    LOG_MSSG VARCHAR2(2000) NOT NULL,
    TR_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE EVENT_DUTIES_HIS
    ADD CONSTRAINT EVENT_DUTIES_HIS_AUTHOR_FK FOREIGN KEY (
        AUTHOR_ID
    )
        REFERENCES MEMBERS(
            MEMBER_ID
        );