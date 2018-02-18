<html>
    <body>
        <%
            String attendUserId = request.getParameter("attendUserId");
            String inTime       = request.getParameter("in");
            String outTime      = request.getParameter("out");
            String output = "";
            if(inTime.equals("false")&&outTime.equals("false"))
                output = "false";
            else if(outTime.equals("false"))
                output = db.Admin.addAttendanceToDb(attendUserId,inTime,"0");
            else
                output = db.Admin.addAttendanceToDb(attendUserId,inTime,outTime);
            
        %>
    </body>
</html>