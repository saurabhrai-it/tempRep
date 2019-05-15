<html>
    <body>
        <%@ page import="java.text.*" %>
        <%@ page import="java.util.Date" %>
        <%@ page import="java.sql.Connection" %>
        <%@ page import="java.sql.ResultSet" %>
        <%!
            public static String checkInTime(Connection conn, String userId){
                String tempTime = db.Admin.checkInTimePresent(conn, userId);
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
            Connection conn=(Connection)session.getAttribute("temp");
            String userName=(String)session.getAttribute("name");
            String userId=(String)session.getAttribute("uid");
            String disableInCheckbox="disabled";
            String disableOutCheckbox="";
            String superInTimeValue="";
            String superInTime = checkInTime(conn, userId);
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
                  <td><input type="checkbox" name="inTimeSup" id="inTimeSup"  value="0" onClick="this.value=getTimestamp(inTimeDiv);" onchange="disableSubmit(inTimeSup,outTimeSup,submitButton);" <%=disableInCheckbox%>></td>
                  <td><div id="inTimeDiv"><%=superInTime%></div></td>
                  <td><input type="checkbox" name="outTimeSup" id="outTimeSup" value="0" onClick="this.value=getTimestamp(outTimeDiv);" onchange="disableSubmit(inTimeSup,outTimeSup,submitButton);" <%=disableOutCheckbox%>></td>
                  <td><div id="outTimeDiv">00/00/0000 00:00:00 XX</div></td>
                  <td><input type="submit" value="Submit" id="submitButton" onclick="submitAttendance('<%=userId%>',document.getElementById('inTimeSup').value,document.getElementById('outTimeSup').value);showDone(submitButton);" style="cursor: not-allowed;" disabled></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        </div>
                
        
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Guard Attendance</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="guardAttendance" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Name</th>
                  <th colspan="2">In Time</th>
                  <th colspan="2">Out Time</th>
                </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = db.Admin.getGuardData(conn, userId);
                        while(rs.next())
                        {
                            String guardName=rs.getString(1);
                            String guardId=rs.getString(2);
                            
                            String disableInCheckboxGuard="disabled";
                            String disableOutCheckboxGuard="";
                            String guardInTime = checkInTime(conn, guardId);
                            if(guardInTime.equals("0")){
                                guardInTime = "00/00/0000 0:00:00 XX";
                                disableInCheckboxGuard = "";
                                disableOutCheckboxGuard = "disabled";
                            }
                    %>
                <tr>
                  <td><%=guardName%></td>
                  <td><input type="checkbox" name="inTimeGuard" id="inTimeGuard<%=guardId%>"  value="0" onClick="this.value=getTimestamp(inTimeDiv<%=guardId%>);" onchange="disableSubmit(inTimeGuard<%=guardId%>,outTimeGuard<%=guardId%>,submitButton<%=guardId%>);" <%=disableInCheckboxGuard%>></td>
                  <td><div id="inTimeDiv<%=guardId%>"><%=guardInTime%></div></td>
                  <td><input type="checkbox" name="outTimeGuard" id="outTimeGuard<%=guardId%>" value="0" onClick="this.value=getTimestamp(outTimeDiv<%=guardId%>);" onchange="disableSubmit(inTimeGuard<%=guardId%>,outTimeGuard<%=guardId%>,submitButton<%=guardId%>);" <%=disableOutCheckboxGuard%>></td>
                  <td><div id="outTimeDiv<%=guardId%>">00/00/0000 00:00:00 XX</div></td>
                  <td><input type="submit" value="Submit" id="submitButton<%=guardId%>" onclick="submitAttendance('<%=guardId%>',document.getElementById('inTimeGuard<%=guardId%>').value,document.getElementById('outTimeGuard<%=guardId%>').value);showDone(submitButton<%=guardId%>);"  style="cursor: not-allowed;" disabled></td>
                </tr>
                <%
                }
                rs.close();
                %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        </div>       
    </body>
</html>