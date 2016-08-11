--------------------------------------------------------
--  File created - Thursday-August-11-2016   
--------------------------------------------------------
DROP TABLE "STUDENTALUMNI"."FRIENDS" cascade constraints;
DROP TABLE "STUDENTALUMNI"."LOGINTABLE" cascade constraints;
DROP TABLE "STUDENTALUMNI"."PROFILE" cascade constraints;
DROP TABLE "STUDENTALUMNI"."REUNION" cascade constraints;
DROP TABLE "STUDENTALUMNI"."SCRAP" cascade constraints;
DROP TABLE "STUDENTALUMNI"."STUDENTSDATA" cascade constraints;
DROP TABLE "STUDENTALUMNI"."SUGGESTION" cascade constraints;
--------------------------------------------------------
--  DDL for Table FRIENDS
--------------------------------------------------------

  CREATE TABLE "STUDENTALUMNI"."FRIENDS" 
   (	"FROM_GRNO" VARCHAR2(20 BYTE), 
	"TO_GRNO" VARCHAR2(20 BYTE), 
	"STATUS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LOGINTABLE
--------------------------------------------------------

  CREATE TABLE "STUDENTALUMNI"."LOGINTABLE" 
   (	"USERID" VARCHAR2(20 BYTE), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"ROLE" VARCHAR2(20 BYTE), 
	"GRNO" VARCHAR2(20 BYTE), 
	"STATUS" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PROFILE
--------------------------------------------------------

  CREATE TABLE "STUDENTALUMNI"."PROFILE" 
   (	"GRNO" VARCHAR2(20 BYTE), 
	"EMAILADDRESS" VARCHAR2(20 BYTE), 
	"PHOTO" VARCHAR2(2000 BYTE), 
	"COMPANY" VARCHAR2(20 BYTE), 
	"FIRSTNAME" VARCHAR2(20 BYTE), 
	"LASTNAME" VARCHAR2(20 BYTE), 
	"USERID" VARCHAR2(20 BYTE), 
	"ABOUTFAMILY" VARCHAR2(20 BYTE), 
	"MARITUALSTATUS" VARCHAR2(20 BYTE), 
	"HOME" VARCHAR2(20 BYTE), 
	"OFFICE" VARCHAR2(20 BYTE), 
	"MOBILE" VARCHAR2(20 BYTE), 
	"FAX" VARCHAR2(20 BYTE), 
	"CURRENTADDRESS" VARCHAR2(20 BYTE), 
	"PERMANENTADDRESS" VARCHAR2(20 BYTE), 
	"DEGREE" VARCHAR2(20 BYTE), 
	"ORGANIZATION" VARCHAR2(20 BYTE), 
	"JOBDETAIL" VARCHAR2(20 BYTE), 
	"SPECIFICATIONS" VARCHAR2(20 BYTE), 
	"CURRENTPROJECT" VARCHAR2(20 BYTE), 
	"SKILL" VARCHAR2(20 BYTE), 
	"SALARY" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table REUNION
--------------------------------------------------------

  CREATE TABLE "STUDENTALUMNI"."REUNION" 
   (	"RDATE" VARCHAR2(20 BYTE), 
	"VENUE" VARCHAR2(20 BYTE), 
	"YEARBRANCH" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SCRAP
--------------------------------------------------------

  CREATE TABLE "STUDENTALUMNI"."SCRAP" 
   (	"RGRNO" VARCHAR2(20 BYTE), 
	"REMAIL" VARCHAR2(20 BYTE), 
	"SGRNO" VARCHAR2(20 BYTE), 
	"SEMAIL" VARCHAR2(20 BYTE), 
	"MESSAGE" VARCHAR2(2000 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table STUDENTSDATA
--------------------------------------------------------

  CREATE TABLE "STUDENTALUMNI"."STUDENTSDATA" 
   (	"GRNO" VARCHAR2(20 BYTE), 
	"FIRSTNAME" VARCHAR2(20 BYTE), 
	"LASTNAME" VARCHAR2(20 BYTE), 
	"YEAROFPASSING" VARCHAR2(20 BYTE), 
	"BRANCH" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(20 BYTE), 
	"BIRTHDATE" VARCHAR2(20 BYTE), 
	"ADDMISSION" VARCHAR2(20 BYTE), 
	"AGGREGATE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SUGGESTION
--------------------------------------------------------

  CREATE TABLE "STUDENTALUMNI"."SUGGESTION" 
   (	"FIRSTNAME" VARCHAR2(20 BYTE), 
	"LASTNAME" VARCHAR2(20 BYTE), 
	"GRNO" VARCHAR2(20 BYTE), 
	"SUGGESTION" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into STUDENTALUMNI.FRIENDS
SET DEFINE OFF;
Insert into STUDENTALUMNI.FRIENDS (FROM_GRNO,TO_GRNO,STATUS) values ('3','1','ACTIVE');
Insert into STUDENTALUMNI.FRIENDS (FROM_GRNO,TO_GRNO,STATUS) values ('1','3','ACTIVE');
Insert into STUDENTALUMNI.FRIENDS (FROM_GRNO,TO_GRNO,STATUS) values ('4','3','ACTIVE');
Insert into STUDENTALUMNI.FRIENDS (FROM_GRNO,TO_GRNO,STATUS) values ('3','5','ACTIVE');
REM INSERTING into STUDENTALUMNI.LOGINTABLE
SET DEFINE OFF;
Insert into STUDENTALUMNI.LOGINTABLE (USERID,PASSWORD,ROLE,GRNO,STATUS) values ('5','aa','User','5','PENDING');
Insert into STUDENTALUMNI.LOGINTABLE (USERID,PASSWORD,ROLE,GRNO,STATUS) values ('2','aabb','User','2','ACTIVE');
Insert into STUDENTALUMNI.LOGINTABLE (USERID,PASSWORD,ROLE,GRNO,STATUS) values ('3','aa','User','3','ACTIVE');
Insert into STUDENTALUMNI.LOGINTABLE (USERID,PASSWORD,ROLE,GRNO,STATUS) values ('4','aa','User','4','ACTIVE');
Insert into STUDENTALUMNI.LOGINTABLE (USERID,PASSWORD,ROLE,GRNO,STATUS) values ('1','aa','Admin','1','ACTIVE');
REM INSERTING into STUDENTALUMNI.PROFILE
SET DEFINE OFF;
Insert into STUDENTALUMNI.PROFILE (GRNO,EMAILADDRESS,PHOTO,COMPANY,FIRSTNAME,LASTNAME,USERID,ABOUTFAMILY,MARITUALSTATUS,HOME,OFFICE,MOBILE,FAX,CURRENTADDRESS,PERMANENTADDRESS,DEGREE,ORGANIZATION,JOBDETAIL,SPECIFICATIONS,CURRENTPROJECT,SKILL,SALARY) values ('1','a@a.com','/Student-Alumni/images/Waterfall.jpg','aa','aa','aa','1',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
Insert into STUDENTALUMNI.PROFILE (GRNO,EMAILADDRESS,PHOTO,COMPANY,FIRSTNAME,LASTNAME,USERID,ABOUTFAMILY,MARITUALSTATUS,HOME,OFFICE,MOBILE,FAX,CURRENTADDRESS,PERMANENTADDRESS,DEGREE,ORGANIZATION,JOBDETAIL,SPECIFICATIONS,CURRENTPROJECT,SKILL,SALARY) values ('3','c@c.com','/Student-Alumni/images/Garden.jpg','cc','aa','cc','3','aaa','Married','aa','aa','aa','aa','  aa','aa  ','B.E./B.Tech','aa','aa  ','aa  ','aa','aa  ','aa');
Insert into STUDENTALUMNI.PROFILE (GRNO,EMAILADDRESS,PHOTO,COMPANY,FIRSTNAME,LASTNAME,USERID,ABOUTFAMILY,MARITUALSTATUS,HOME,OFFICE,MOBILE,FAX,CURRENTADDRESS,PERMANENTADDRESS,DEGREE,ORGANIZATION,JOBDETAIL,SPECIFICATIONS,CURRENTPROJECT,SKILL,SALARY) values ('2','b@b.com','/Student-Alumni/images/Creek.jpg','bb','aa','bb','2','2anull','-------','null','null','null','null',' null','null ','select','null','null ','null ','null','null ','null');
Insert into STUDENTALUMNI.PROFILE (GRNO,EMAILADDRESS,PHOTO,COMPANY,FIRSTNAME,LASTNAME,USERID,ABOUTFAMILY,MARITUALSTATUS,HOME,OFFICE,MOBILE,FAX,CURRENTADDRESS,PERMANENTADDRESS,DEGREE,ORGANIZATION,JOBDETAIL,SPECIFICATIONS,CURRENTPROJECT,SKILL,SALARY) values ('4','d@d.com','/Student-Alumni/images/Forest.jpg','dd','aa','dd','4',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
Insert into STUDENTALUMNI.PROFILE (GRNO,EMAILADDRESS,PHOTO,COMPANY,FIRSTNAME,LASTNAME,USERID,ABOUTFAMILY,MARITUALSTATUS,HOME,OFFICE,MOBILE,FAX,CURRENTADDRESS,PERMANENTADDRESS,DEGREE,ORGANIZATION,JOBDETAIL,SPECIFICATIONS,CURRENTPROJECT,SKILL,SALARY) values ('5','e@e.com',null,'ee','aa','ee',null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null);
REM INSERTING into STUDENTALUMNI.REUNION
SET DEFINE OFF;
Insert into STUDENTALUMNI.REUNION (RDATE,VENUE,YEARBRANCH) values ('aaaa','dss','2010CE');
REM INSERTING into STUDENTALUMNI.SCRAP
SET DEFINE OFF;
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('3','aa','3','aa','this is test message');
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('2','b@b.com','3','c@c.com','Test1 message');
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('2','b@b.com','3','c@c.com','Test2 message');
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('2','b@b.com','3','c@c.com','Test3  message');
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('2','b@b.com','3','c@c.com','Test4 message');
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('2','b@b.com','3','c@c.com','Test5 meaage');
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('2','b@b.com','3','c@c.com','Test6 message');
Insert into STUDENTALUMNI.SCRAP (RGRNO,REMAIL,SGRNO,SEMAIL,MESSAGE) values ('3','c@c.com','2','b@b.com','asdf 1');
REM INSERTING into STUDENTALUMNI.STUDENTSDATA
SET DEFINE OFF;
Insert into STUDENTALUMNI.STUDENTSDATA (GRNO,FIRSTNAME,LASTNAME,YEAROFPASSING,BRANCH,GENDER,BIRTHDATE,ADDMISSION,AGGREGATE) values ('5','Meeli','VVyas','2010','I.T.','Female','229/09/77','B.E.','3.5');
Insert into STUDENTALUMNI.STUDENTSDATA (GRNO,FIRSTNAME,LASTNAME,YEAROFPASSING,BRANCH,GENDER,BIRTHDATE,ADDMISSION,AGGREGATE) values ('1','aaqq','qq','qq','qq','qq','qq','qq','qq');
REM INSERTING into STUDENTALUMNI.SUGGESTION
SET DEFINE OFF;
Insert into STUDENTALUMNI.SUGGESTION (FIRSTNAME,LASTNAME,GRNO,SUGGESTION) values ('cc','cc','3','ccccccccccccccccc');
Insert into STUDENTALUMNI.SUGGESTION (FIRSTNAME,LASTNAME,GRNO,SUGGESTION) values ('b','b','2','vvvv');
--------------------------------------------------------
--  Constraints for Table LOGINTABLE
--------------------------------------------------------

  ALTER TABLE "STUDENTALUMNI"."LOGINTABLE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "STUDENTALUMNI"."LOGINTABLE" MODIFY ("GRNO" NOT NULL ENABLE);
  ALTER TABLE "STUDENTALUMNI"."LOGINTABLE" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "STUDENTALUMNI"."LOGINTABLE" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "STUDENTALUMNI"."LOGINTABLE" MODIFY ("USERID" NOT NULL ENABLE);
