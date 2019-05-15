<%@ page import="java.sql.*" %>
<html>
    <body>
        <%
            String attendUserId = request.getParameter("attendUserId");
            String inTime       = request.getParameter("in");
            String outTime      = request.getParameter("out");
            String output = "";
            if(inTime.equals("0")&&outTime.equals("0"))
                output = "Check on IN time  or OUT time";
//            else if(outTime.equals("false"))
//                output = db.Admin.addAttendanceToDb(attendUserId,inTime,"0");
            else{
                Connection conn=(Connection)session.getAttribute("temp");
                output = db.Admin.addAttendanceToDb(conn, attendUserId,inTime,outTime);
            }
        %><%=output%>
    </body>
</html>