<html>
    <body>
        <%@ page import="java.text.*" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.sql.Timestamp" %>
        <%!
            public static String checkInTime(String userId){
                String tempTime = db.Admin.checkInTimePresent(userId);
                if(!tempTime.equals("invalid"))
                {
                    Timestamp   ts = new Timestamp(Long.parseLong(tempTime));
                    Date        dt = new Date(ts.getTime());
                    DateFormat  df = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a");
                    tempTime       = df.format(dt);
                }
                else
                    tempTime="0";
                return tempTime;
            }
        %>
        <%
            String userName=(String)session.getAttribute("name");
            String userId=(String)session.getAttribute("uid");
            String disableInCheckbox="disabled";
            String disableOutCheckbox="";
            String superInTimeValue="";
            String superInTime = checkInTime(userId);
            if(superInTime.equals("0")){
                superInTime = "00/00/0000 0:00:00 XX";
                disableInCheckbox = "";
                disableOutCheckbox = "disabled";
            }
        %>
    <section class="content-header">
      <h1  class="text-center">
          <b>Attendance Panel</b>
      </h1>
    </section>
    
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Self Attendance</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="selfAttendance" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Name</th>
                  <th colspan="2">In Time</th>
                  <th colspan="2">Out Time</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td><%=userName%></td>
                  <td><input type="checkbox" name="inTimeSup" id="inTimeSup"  value="0" onClick="this.value=getTimestamp(inTimeDiv);" <%=disableInCheckbox%>></td>
                  <td><div id="inTimeDiv"><%=superInTime%></div></td>
                  <td><input type="checkbox" name="outTimeSup" id="outTimeSup" value="0" onClick="this.value=getTimestamp(outTimeDiv);" <%=disableOutCheckbox%>></td>
                  <td><div id="outTimeDiv">00/00/0000 00:00:00 XX</div></td>
                  <td><input type="submit" value="Submit" onclick="submitAttendance('<%=userId%>',document.getElementById('inTimeSup').value,document.getElementById('outTimeSup').value);"></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        </div>
    </body>
</html>