package com.studentAlumni.Domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.studentAlumni.DataProvider.DBUtils;

/**
 *
 * @author Meeli Vyas
 */
public class a_LoginTable_update {

    public static LoginTable OrgData(String grno) {
        LoginTable lt = new LoginTable();
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {

            cn = DBUtils.getConnectionObj();
            ps = cn.prepareStatement(DBUtils.GET_LOGINTABLE_BY_GRNO);
            ps.setString(1, grno);
            rs = ps.executeQuery();
            if (rs.next()) {
                lt.setUserid(rs.getString("USERID"));
                lt.setPassword(rs.getString("PASSWORD"));
                lt.setStatus(rs.getString("STATUS"));
                lt.setGrno(rs.getString("GRNO"));
                lt.setRole(rs.getString("ROLE"));
                return lt;
            } else {
                return null;
            }
        } catch (Exception e) {
            //   log(e.getMessage());
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

    public static boolean update(LoginTable lt) {
        Connection cn = null;
        ResultSet rs = null;
        PreparedStatement ps = null;
        try {
            cn = DBUtils.getConnectionObj();
            ps = cn.prepareStatement(DBUtils.GET_LOGINTABLE_BY_GRNO, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ps.setString(1, lt.getGrno());
            rs = ps.executeQuery();
            if (rs.next()) {
            	 rs.updateString("USERID", lt.getUserid());
                rs.updateString("GRNO", lt.getGrno());
                rs.updateString("PASSWORD", lt.getPassword());
                rs.updateString("STATUS", lt.getStatus());
                rs.updateString("ROLE", lt.getRole());
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
