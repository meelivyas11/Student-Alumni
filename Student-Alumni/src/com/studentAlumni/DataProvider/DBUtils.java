package com.studentAlumni.DataProvider;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.sql.DataSource;
import oracle.jdbc.pool.OracleDataSource;

public class DBUtils {
		
	// Oracle DB Credentials
	public static String ORACLE_DRIVER = "oracle.jdbc.OracleDriver";
	public static String ORACLE_DB_URL = "jdbc:oracle:thin:@//localhost:1521/xe";
	public static String ORACLE_DB_USERNAME = "StudentAlumni";
	public static String ORACLE_DB_PASSWORD = "StudentAlumni";
	
	
	// LOGINTABLE
	public static String LOGIN_CHK = "Select * from LOGINTABLE where USERID =? and PASSWORD = ?";
	public static String INSERT_LOGINTABLE = "Insert into LOGINTABLE (USERID,PASSWORD,STATUS,GRNO,ROLE) values(?,?,?,?,?)";
	public static String GET_ALL_LOGINTABLE = "select * from LOGINTABLE";
	public static String GET_LOGINTABLE_BY_GRNO = "select USERID, PASSWORD, STATUS, GRNO, ROLE from LOGINTABLE where GRNO = ? ";
	public static String DELETE_LOGINTABLE_BY_GRNO = "Delete from LOGINTABLE where GRNO = ?";
	public static String GET_PENDING_USERS = "Select * from LOGINTABLE where status = 'PENDING'";
	
	// PROFILE
	public static String GET_PROFILE_FROM_GRNO = "select GRNO,USERID,FIRSTNAME,LASTNAME,ABOUTFAMILY,MARITUALSTATUS,EMAILADDRESS,HOME,OFFICE,MOBILE,FAX,CURRENTADDRESS,PERMANENTADDRESS,DEGREE,ORGANIZATION,JOBDETAIL,SPECIFICATIONS,CURRENTPROJECT,SKILL,COMPANY,SALARY,PHOTO from PROFILE where GRNO =?";
	public static String UPDATE_PROFILE = "UPDATE PROFILE  SET PHOTO = ? WHERE GRNO =?";
	public static String GET_PROFILE_BY_EMAILADDRESS = "Select * from PROFILE where EMAILADDRESS= ?";
	public static String GET_EMAILADDRESS_FROM_GRNO = "Select EMAILADDRESS from PROFILE where GRNO= ?";
	
	// STUDENTSDATA
	public static String GET_ALL_STUDENTDATA = "select * from STUDENTSDATA";
	public static String GET_SPECIFIC_STUDENTDATA = "select * from STUDENTSDATA where GRNO=? or FIRSTNAME=? or LASTNAME =? or YEAROFPASSING=? or BRANCH = ?";
	public static String DELETE_STUDENTDATA_BY_GRNO = "Delete from STUDENTSDATA where GRNO = ? ";
	public static String GET_STUDENTDATA_BY_GRNO = "Select GRNO,FIRSTNAME,LASTNAME,GENDER,BIRTHDATE,ADDMISSION,AGGREGATE,YEAROFPASSING,BRANCH from STUDENTSDATA where GRNO = ? ";
	
	// SUGGESTION
	public static String GET_ALL_SUGGESTIONS = "Select FIRSTNAME, LASTNAME, GRNO, SUGGESTION  from SUGGESTION";
	public static String GET_SUGGESTIONS_BY_GRNO = "Select FIRSTNAME, LASTNAME, GRNO, SUGGESTION from SUGGESTION where GRNO = ? ";
	public static String INSERT_SUGGESTION = "Insert into SUGGESTION (FIRSTNAME,LASTNAME,GRNO,SUGGESTION) values(?,?,?,?)";
	
	// REUNION
	public static String GET_ALL_REUNION = "select RDATE, VENUE, YEARBRANCH from REUNION";
	public static String ADD_REUNION = "Insert into REUNION (RDATE, VENUE, YEARBRANCH) values(?,?,?)";
	public static String GET_SPECIFIC_REUNION = "Select RDATE, VENUE, YEARBRANCH  from REUNION where RDATE=? and VENUE = ? and YEARBRANCH= ?";
	
	// FRIENDS
	public static String GET_FRIENDS_FOR_GRNO = "Select FROM_GRNO,TO_GRNO from FRIENDS where (TO_GRNO=? or FROM_GRNO=?) and (STATUS='ACTIVE')";
	public static String GET_PENDING_FRIENDS_REQ = "Select FROM_GRNO from FRIENDS where status='PENDING' and TO_GRNO = ?";
	public static String UPDATE_STATUS_TO_ACTIVE = "UPDATE FRIENDS set STATUS='ACTIVE' where FROM_GRNO =? and TO_GRNO=?";
	
	// SCRAP
	public static String GET_SCRAP_BY_RGRNO = "Select * from SCRAP where RGRNO= ?";
	public static String INSERT_SCRAP = "Insert into SCRAP (SEMAIL, SGRNO, REMAIL, RGRNO, MESSAGE) values(?,?,?,?,?)";
	
	public static Statement getStatement() {
		try {
			/*
			InitialContext i1 = new InitialContext();
			Context ct = (Context) i1.lookup("java:comp/env"); 
			DataSource ds = (DataSource) ct.lookup("resource_ref1"); 
			con = ds.getConnection();
			st = con.createStatement();*/
			
	        DataSource ds = getOracleDataSource();
	        Connection con = ds.getConnection();
	        Statement st = con.createStatement();
	        return st;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Connection getConnectionObj() {
		try {
	        DataSource ds = getOracleDataSource();
	        return ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static DataSource getOracleDataSource() {
		try {
			OracleDataSource oracleDS =  new OracleDataSource();
			/*oracleDS.setDriverType("thin");
			oracleDS.setServerName("localhost");
			oracleDS.setDatabaseName("xe");
			oracleDS.setPortNumber(1521);*/
			
			oracleDS.setURL(ORACLE_DB_URL);
			oracleDS.setUser(ORACLE_DB_USERNAME);
			oracleDS.setPassword(ORACLE_DB_PASSWORD);
			return oracleDS;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
