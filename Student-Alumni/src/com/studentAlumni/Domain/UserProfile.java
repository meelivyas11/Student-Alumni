package com.studentAlumni.Domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.studentAlumni.DataProvider.DBUtils;

/**
 *
 * @author Mehul
 */
public class UserProfile {

   
    public static profile retriveProfile(String grno) {
        profile u1 = new profile();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            cn = DBUtils.getConnectionObj();
            ps = cn.prepareStatement(DBUtils.GET_PROFILE_FROM_GRNO);
            ps.setString(1, grno);
            rs = ps.executeQuery();
            if (rs.next()) {
                u1.setGrno(rs.getString("GRNO"));
                u1.setUserid(rs.getString("USERID"));
                u1.setAboutfamily(rs.getString("ABOUTFAMILY"));
                u1.setMS(rs.getString("MARITUALSTATUS"));
                u1.setEmailaddress(rs.getString("EMAILADDRESS"));
                u1.setHome(rs.getString("HOME"));
                u1.setOffice(rs.getString("OFFICE"));
                u1.setMobile(rs.getString("MOBILE"));
                u1.setFax(rs.getString("FAX"));
                u1.setCurrentaddress(rs.getString("CURRENTADDRESS"));
                u1.setPermanentaddress(rs.getString("PERMANENTADDRESS"));
                u1.setDegree(rs.getString("DEGREE"));
                u1.setOrganization(rs.getString("ORGANIZATION"));
                u1.setJobdetail(rs.getString("JOBDETAIL"));
                u1.setSpecifications(rs.getString("SPECIFICATIONS"));
                u1.setCurrentproject(rs.getString("CURRENTPROJECT"));
                u1.setSkill(rs.getString("SKILL"));
                u1.setCompany(rs.getString("COMPANY"));
                u1.setSalary(rs.getString("SALARY"));
                u1.setPhoto(rs.getString("PHOTO"));

                return u1;
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (!rs.isClosed()) rs.close();
                if (!ps.isClosed()) ps.close();
                if (!cn.isClosed()) cn.close();
            } catch (Exception e) {
                // log(e.getMessage());
            }
        //out.close();
        }
        return null;
    }

    public static boolean updateProfile(profile u1) {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            cn = DBUtils.getConnectionObj();
           
            ps = cn.prepareStatement(DBUtils.GET_PROFILE_FROM_GRNO, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, u1.getGrno());
            rs = ps.executeQuery();
            if (rs.next()) {
             //   rs.updateString("GRNO", u1.getGrno());
              //  rs.updateString("USERID", u1.getUserid());
                rs.updateString("ABOUTFAMILY", u1.getAboutfamily());
                rs.updateString("MARITUALSTATUS", u1.getMS());
                rs.updateString("EMAILADDRESS", u1.getEmailaddress());    
                rs.updateString("HOME", u1.getHome());  
                rs.updateString("OFFICE", u1.getOffice());   
                rs.updateString("MOBILE", u1.getMobile());    
                rs.updateString("FAX", u1.getFax());   
                rs.updateString("CURRENTADDRESS", u1.getCurrentaddress());
                rs.updateString("PERMANENTADDRESS", u1.getPermanentaddress());
                rs.updateString("DEGREE", u1.getDegree());   
                rs.updateString("ORGANIZATION", u1.getOrganization());
                rs.updateString("JOBDETAIL", u1.getJobdetail());   
                rs.updateString("SPECIFICATIONS", u1.getSpecifications());
                rs.updateString("CURRENTPROJECT", u1.getCurrentproject());
                rs.updateString("SKILL", u1.getSkill());
                rs.updateString("COMPANY", u1.getCompany());
                rs.updateString("SALARY", u1.getSalary());
                rs.updateString("PHOTO", u1.getPhoto());

                rs.updateRow();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            try {
                if (!rs.isClosed()) rs.close();
                if (!ps.isClosed()) ps.close();
                if (!cn.isClosed()) cn.close();
            } catch (Exception e) {
                //log(e.getMessage());
            }
        }
        return false;
    }
}
