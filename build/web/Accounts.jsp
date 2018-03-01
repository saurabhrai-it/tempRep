<html>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.sql.ResultSet" %>

        <%!
            public static String checkInTime(String tempTime){
                 Timestamp   ts = new Timestamp(Long.parseLong(tempTime));
                    Date        dt = new Date(ts.getTime());
                    DateFormat  df = new SimpleDateFormat("dd/MM/yyyy");
                    tempTime       = df.format(dt);
                return tempTime;
            }
        %>
    <body>
        
  <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
    </section>

        <%
            String userType=(String)session.getAttribute("userType");
            String userId=(String)session.getAttribute("uid");
            if(userType.equals("admin")){
        %>
    
    <section class="content">
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>
              <p>Total Clients</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>
              <p>Active Clients</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>
              <p>Expired Clients</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-red">
            <div class="inner">
              <h3>65555555</h3>
              <p>Total Revenue</p>
            </div>
            <div class="icon">
              <i class="fa fa-rupee"></i>
            </div>
          </div>
        </div>
      </div>

    </section>
        <% }
else if(userType.equals("supervisor"))
{
        %>
        
        <section class="content">
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>150</h3>
              <p>Total Guards</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-green">
            <div class="inner">
              <h3>53<sup style="font-size: 20px">%</sup></h3>
              <p>Active Guards</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>44</h3>
              <p>Guards On Leave</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
      </div>

    </section>
      <% }
else if(userType.equals("client"))
{
    ResultSet rs = db.Admin.getClientData(userId);
    if(rs.next())
    {
        String societyName=rs.getString(1);
        String startDate=checkInTime(rs.getString(2));
        String expireDate=checkInTime(rs.getString(3));
        String amount=rs.getString(4);
        String totalTowers=rs.getString(5);
        String totalGuardsRequired=rs.getString(6);
        String totalGuardsPresent=rs.getString(7);
        %>
        
        <section class="content">
      <div class="row">
        <div class="col-lg-12 col-xs-12">
          <div class="small-box bg-aqua-active">
            <div class="inner">
              <h3><%=societyName%></h3>
              <p>Society Name</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-green">
            <div class="inner">
              <h3>Active</h3>
              <p>Service Type</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-green">
            <div class="inner">
              <h3><%=startDate%></h3>
              <p>Service Start Date</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-green">
            <div class="inner">
              <h3><%=expireDate%></h3>
              <p>Service Expiry Date</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-green">
            <div class="inner">
              <h3><%=amount%></h3>
              <p>Service Amount Paid</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><%=totalGuardsRequired%></h3>
              <p>Guards Required</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><%=totalGuardsPresent%></h3>
              <p>Guards Present</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
        <div class="col-lg-3 col-xs-6">
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><%=totalTowers%></h3>
              <p>Total Towers</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
          </div>
        </div>
      </div>

    </section>
        <%}}%>
    </body>
</html>