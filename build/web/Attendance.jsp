<html>
<%
             String userId = request.getParameter("profId");
             String header = "Guard";
             if(userId.startsWith("S"))
                 header = "Supervisor";
             
%>
<body> 
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-center"><%=header%> Attendance</h4>
              </div>
              <div class="modal-body">
                  <h2>Please select one option : </h2>
                  <select onchange="getAttendance('<%=userId%>',this.value);">
                      <option value="0">Please Select</option>
                      <option value="1">Current Month</option>
                      <option value="2">Previous Month</option>
                      <option value="3">Previous to Previous Month</option>
                  </select>
                  <div id="AttendanceId<%=userId%>"/>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
    </body>
</html>