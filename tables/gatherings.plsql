CREATE OR REPLACE TABLE GATHERING_REPORTS (
    REPORT_ID NUMBER PRIMARY KEY,
    REPORT_CONTENT CLOB NOT NULL,
    AUTHOR_ID NUMBER NOT NULL,
    ORS_ID NUMBER NOT NULL,
);

ALTER TABLE GATHERING_REPORTS
    ADD CONSTRAINT GATHERING_AUTHOR_FK FOREIGN KEY (
        AUTHOR_ID
    )
        REFERENCES MEMBERS(
            MEMBER_ID
        );

ALTER TABLE GATHERING_REPORTS
    ADD CONSTRAINT GATHERING_ORS_FK FOREIGN KEY (
        ORS_ID
    )
        REFERENCES ORS(
            ORS_ID
        );

CREATE OR REPLACE TABLE GATHERING_HIS (
    LOG_ID NUMBER PRIMARY KEY,
    CHANGER_ID NUMBER NOT NULL,
    LOG_MSSG VARCHAR2(4000) NOT NULL,
    TR_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE GATHERING_HIS
    ADD CONSTRAINT GATHERING_HIS_CHANGER_FK FOREIGN KEY (
        CHANGER_ID
    )
        REFERENCES MEMBERS(
            MEMBER_ID
        );