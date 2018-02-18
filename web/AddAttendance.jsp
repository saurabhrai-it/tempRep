<html>
    <body>
        <%
            String userName=(String)session.getAttribute("name");
            String userId=(String)session.getAttribute("uid");
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
                  <td><input type="checkbox" name="inTimeSup" id="inTimeSup"  value="false" onClick="this.value=getTimestamp(inTimeDiv);"></td>
                  <td><div id="inTimeDiv">00/00/0000 00:00:00 XX</div></td>
                  <td><input type="checkbox" name="outTimeSup" id="outTimeSup" value="false" onClick="this.value=getTimestamp(outTimeDiv);"></td>
                  <td><div id="outTimeDiv">00/00/0000 00:00:00 XX</div></td>
                  <td><input type="submit" value="Submit" onclick="this.value=submitAttendance(<%=userId%>,document.getElementById('inTimeSup').value,document.getElementById('outTimeSup').value);"></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        </div>
    </body>
</html>