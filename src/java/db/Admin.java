package db;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Types;

/**
 *
 * @author Saurabh
 */
public class Admin {
    static CallableStatement cs;
    public static Connection connect() throws Exception
    {
       Class.forName("com.mysql.jdbc.Driver");
     return DriverManager.getConnection("jdbc:mysql://localhost:3306/security","root","");
    //return DriverManager.getConnection("jdbc:mysql://localhost:3306/meds","saurabh","saurabh");
    }
    public static String addAdmin(String name,String sex,String doc, String mob, String mailId,String pass, String superUid)
    {  
       try
       {
        cs = connect().prepareCall("{call addAdmin(?,?,?,?,?,?,?,?)}");
        cs.setString(1, name);
        cs.setString(2, sex);
        cs.setString(3, doc);
        cs.setString(4, mob);
        cs.setString(5, mailId);
        cs.setString(6, pass);
        cs.setString(7, superUid);
        cs.registerOutParameter(8,Types.VARCHAR);
        cs.execute(); 
        connect().close();
        return cs.getString(8);        
       }
       catch(Exception ex) { return ex.getMessage(); }
    }
    public static String checkId(String uid,String pass)
    {  
       try
       {
        cs = connect().prepareCall("{call checkId(?,?,?)}");
        cs.setString(1, uid);
        cs.setString(2, pass);
        cs.registerOutParameter(3,Types.VARCHAR);
        cs.execute(); 
        connect().close();
        return cs.getString(3);        
       }
       catch(Exception ex) { return ex.getMessage(); }
    }
    public static String addAttendanceToDb(String uid,String inTime, String outTime)
    {  
       try
       {
        cs = connect().prepareCall("{call addAttendance(?,?,?,?)}");
        cs.setString(1, uid);
        cs.setString(2, inTime);
        cs.setString(3, outTime);
        cs.registerOutParameter(4,Types.VARCHAR);
        cs.execute(); 
        connect().close();
        return cs.getString(4);        
       }
       catch(Exception ex) { return ex.getMessage(); }
    }
}
