package com.studentAlumni.Domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.studentAlumni.DataProvider.DBUtils;


/**
 *
 * @author Meeli Vyas
 */
public class a_UpdateStudentsOfCollege {

    public static StudentofCollege OrgData(String grno) {
        StudentofCollege s1 = new StudentofCollege();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.getConnectionObj();
            ps = cn.prepareStatement(DBUtils.GET_STUDENTDATA_BY_GRNO);
            ps.setString(1, grno);
            rs = ps.executeQuery();
            if (rs.next()) {
                s1.setGrno(rs.getString("GRNO"));
                s1.setFirstname(rs.getString("FIRSTNAME"));
                s1.setLastname(rs.getString("LASTNAME"));
                s1.setGender(rs.getString("GENDER"));
                s1.setBirthdate(rs.getString("BIRTHDATE"));
                s1.setAddmission(rs.getString("ADDMISSION"));
                s1.setAggregate(rs.getString("AGGREGATE"));
                s1.setYearofPassing(rs.getString("YEAROFPASSING"));
                s1.setBranch(rs.getString("BRANCH"));
                return s1;
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
            }
        }
        return null;
    }

    public static boolean update(StudentofCollege s1) {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            cn = DBUtils.getConnectionObj();
            ps = cn.prepareStatement(DBUtils.GET_STUDENTDATA_BY_GRNO, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, s1.getGrno());
            rs = ps.executeQuery();
            if (rs.next()) {
                rs.updateString("GRNO", s1.getGrno());
                rs.updateString("FIRSTNAME", s1.getFirstname());
                rs.updateString("LASTNAME", s1.getLastname());
                rs.updateString("GENDER", s1.getGender());
                rs.updateString("BIRTHDATE", s1.getBirthdate());
                rs.updateString("ADDMISSION", s1.getAddmission());
                rs.updateString("AGGREGATE", s1.getAggregate());
                rs.updateString("YEAROFPASSING", s1.getYearofPassing());
                rs.updateString("BRANCH", s1.getBranch());
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
            }
        }
        return false;
    }




}
