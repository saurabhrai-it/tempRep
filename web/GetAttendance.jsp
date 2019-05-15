<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Timestamp" %>
<%!
            public static String checkInTime(String tempTime){
                    Timestamp   ts = new Timestamp(Long.parseLong(tempTime));
                    Date        dt = new Date(ts.getTime());
                    DateFormat  df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a");
                    tempTime       = df.format(dt);
                    return tempTime;
            }

            public static String calcTotalTime(String time1){
                    double saurabh = Double.parseDouble(time1);
                    double hours = saurabh/(1000*60*60);
                    double mins = (saurabh%(1000*60*60))/(1000*60);
                    if(hours !=0)
                    return (int)hours + " hr, " + (int)mins +" min";
                    else
                    return (int)mins +" min";
            }
%>
<%
             String userId = request.getParameter("id");
             String type = request.getParameter("type");
             long inBound= 0;
             long outBound= 0;
             long currTime = System.currentTimeMillis();
            java.util.Calendar c =  java.util.Calendar.getInstance(java.util.TimeZone.getTimeZone("IST"));
            if(type != null)
             {
                 if(type.equals("1"))
                 {
                    c.set(java.util.Calendar.DATE, 1);
                    c.set(java.util.Calendar.MILLISECOND, 0);
                    c.set(java.util.Calendar.SECOND, 0);
                    c.set(java.util.Calendar.MINUTE, 0);
                    c.set(java.util.Calendar.HOUR_OF_DAY, 0);
                     inBound = c.getTimeInMillis();
                     outBound = currTime;
                 }
                 else if(type.equals("2"))
                 {
                    c.set(java.util.Calendar.DATE, 1);
                    c.add(java.util.Calendar.MONTH, -1);
                    c.set(java.util.Calendar.MILLISECOND, 0);
                    c.set(java.util.Calendar.SECOND, 0);
                    c.set(java.util.Calendar.MINUTE, 0);
                    c.set(java.util.Calendar.HOUR_OF_DAY, 0);
                     inBound = c.getTimeInMillis();
             
                    c.set(java.util.Calendar.MILLISECOND, 0);
                    c.set(java.util.Calendar.SECOND, 59);
                    c.set(java.util.Calendar.MINUTE, 59);
                    c.set(java.util.Calendar.HOUR_OF_DAY, 23);
                     c.set(java.util.Calendar.DATE, c.getActualMaximum(java.util.Calendar.DAY_OF_MONTH));
                     outBound = c.getTimeInMillis();
                 }
                 else if(type.equals("3"))
                 {
                    c.set(java.util.Calendar.DATE, 1);
                    c.add(java.util.Calendar.MONTH, -2);
                    c.set(java.util.Calendar.MILLISECOND, 0);
                    c.set(java.util.Calendar.SECOND, 0);
                    c.set(java.util.Calendar.MINUTE, 0);
                    c.set(java.util.Calendar.HOUR_OF_DAY, 0);
                     inBound = c.getTimeInMillis();
                    c.set(java.util.Calendar.MILLISECOND, 0);
                    c.set(java.util.Calendar.SECOND, 59);
                    c.set(java.util.Calendar.MINUTE, 59);
                    c.set(java.util.Calendar.HOUR_OF_DAY, 23);
                     c.set(java.util.Calendar.DATE, c.getActualMaximum(java.util.Calendar.DAY_OF_MONTH));
                     outBound = c.getTimeInMillis();
                 }
         %>

         <div class="box-body">
              <table id="selfAttendance" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>In Time</th>
                  <th>Out Time</th>
                  <th>Total Time</th>
                </tr>
                </thead>
                <tbody>

<%               Connection conn=(Connection)session.getAttribute("temp");
                 ResultSet rs = db.Admin.GetAttendance(conn, userId, inBound, outBound);
                 while(rs.next())
                 {
                     String inTime=checkInTime(rs.getString(1));
                     String outTime=checkInTime(rs.getString(2));
                     String TotalTime=calcTotalTime(rs.getString(3));
                     %>

                <tr>
                  <td><%=inTime%></td>
                  <td><%=outTime%></td>
                  <td><%=TotalTime%></td>
                </tr>
                <%
                    }
                    rs.close();
                %>
                </tbody>
              </table>
            </div>
<%
             }
%>
