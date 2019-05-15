package db;

import java.sql.*;
/**
 *
 * @author Saurabh
 */
public class Admin {
    static CallableStatement cs;
    public static Connection connect() throws Exception
    {
       Class.forName("com.mysql.jdbc.Driver");
//       return DriverManager.getConnection("jdbc:mysql://localhost:3306/security","root","root");
       return DriverManager.getConnection("jdbc:mysql://192.168.56.101:3306/security","saurabh","rdx");
        
    //return DriverManager.getConnection("jdbc:mysql://localhost:3306/meds","saurabh","saurabh");
    }
    public static String addAdmin(Connection conn, String name, String sex, String doc, String mob, String mailId, String pass, String superUid) throws Exception
    {  
//       try
//       {
        cs = conn.prepareCall("{call addAdmin(?,?,?,?,?,?,?,?)}");
        cs.setString(1, name);
        cs.setString(2, sex);
        cs.setString(3, doc);
        cs.setString(4, mob);
        cs.setString(5, mailId);
        cs.setString(6, pass);
        cs.setString(7, superUid);
        cs.registerOutParameter(8,Types.VARCHAR);
        cs.execute(); 
        return cs.getString(8);        
//       }
//       catch(Exception ex) { return ex.getMessage(); }
//       finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static String checkId(Connection conn, String uid,String pass) throws Exception
    {  
//       try
//       {
        cs = conn.prepareCall("{call checkId(?,?,?)}");
        cs.setString(1, uid);
        cs.setString(2, pass);
        cs.registerOutParameter(3,Types.VARCHAR);
        cs.execute();
        return cs.getString(3);        
//       }
//       catch(Exception ex) { return ex.getMessage(); }
//       finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static String addAttendanceToDb(Connection conn, String uid,String inTime, String outTime) throws Exception
    {  
//       try
//       {
        cs = conn.prepareCall("{call addAttendance(?,?,?,?)}");
        cs.setString(1, uid);
        cs.setString(2, inTime);
        cs.setString(3, outTime);
        cs.registerOutParameter(4,Types.VARCHAR);
        cs.execute(); 
        return cs.getString(4);        
//       }
//       catch(Exception ex) { return ex.getMessage(); }
//       finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static String checkInTimePresent(Connection conn, String uid) throws Exception
    {  
//       try
//       {
        cs = conn.prepareCall("{call checkInTimePresent(?,?)}");
        cs.setString(1, uid);
        cs.registerOutParameter(2,Types.VARCHAR);
        cs.execute(); 
        return cs.getString(2);        
//       }
//       catch(Exception ex) { return ex.getMessage(); }
//       finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    
    
    public static ResultSet getGuardData(Connection conn, String u)  throws Exception
    {
//        try{
            cs= conn.prepareCall("{call getGuardData(?)}");
            cs.setString(1, u);
            return cs.executeQuery();
//        }
//        finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static ResultSet getClientData(Connection conn, String u)  throws Exception
    {
//        try{
            cs= conn.prepareCall("{call getClientData(?)}");
            cs.setString(1, u);
            return cs.executeQuery();
//        }
//        finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static ResultSet GetSupGuardID(Connection conn, String u)  throws Exception
    {
//        try{
            cs= conn.prepareCall("{call getSupGuardID(?)}");
            cs.setString(1, u);
            return cs.executeQuery();
//        }
//        finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static ResultSet GetUserFromUid(Connection conn, String u)  throws Exception
    {
//        try{
            cs= conn.prepareCall("{call getUserFromUid(?)}");
            cs.setString(1, u);
            return cs.executeQuery();
//        }        
//        finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static ResultSet GetDetails(Connection conn, String u)  throws Exception
    {
//        try{
            cs= conn.prepareCall("{call getDetails(?)}");
            cs.setString(1, u);
            return cs.executeQuery();
//        }
//        finally{
//           try{connect().close();}
//           catch(Exception ex){}
//       }
    }
    public static ResultSet GetAttendance(Connection conn, String u,long inTime, long outTime)  throws Exception
    {
//        try{
            cs= conn.prepareCall("{call getAttendance(?,?,?)}");
            cs.setString(1, u);
            cs.setLong(2,inTime);
            cs.setLong(3,outTime);
            return cs.executeQuery();
//        }
//        finally{
//           try{connect().close();}
//           catch(Exception ex){ }
//       }
    }
}
