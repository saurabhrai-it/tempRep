<html>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
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
        Guard
        <small>Profile</small>
      </h1>
    </section>

        <%
            String userType=(String)session.getAttribute("userType");
            String userId=(String)session.getAttribute("uid"); 
        %>
    
    <section class="content">
      <div class="row">
       <div class="col-lg-12 col-xs-12">
        
        <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>Supervisor Name</th>
                    <th>Guard Name</th>
                  </tr>
                  </thead>
                  <tbody>
         <%
              ResultSet rs = db.Admin.GetSupGuardID(userId);
              LinkedHashMap<String, String> mapSG = new LinkedHashMap<>();
              while(rs.next())
              {
                    mapSG.put( rs.getString(1), rs.getString(2));
              }
              List<String> l = new ArrayList<String>(mapSG.values());
              String tempStr = l.get(0);
              String oneTime = "true";
              for (Map.Entry<String, String> entry : mapSG.entrySet()) {
                    String key = entry.getKey();
                    String value = entry.getValue();
                    if(tempStr.equals(value))
                    {
                        if(oneTime.equals("true")){
         %>
                            <tr>
                              <td><%=db.Admin.GetUserFromUid(value).getString(1)%></td>
                              <td><%=db.Admin.GetUserFromUid(key).getString(1)%></td>
                            </tr>
                        <% 
                            oneTime = "false";
                            }
                        else{
                        %>
                            <tr>
                              <td></td>
                              <td><%=db.Admin.GetUserFromUid(key).getString(1)%></td>
                            </tr>
         <% 
                            }
                    }
                    else{
                    tempStr  = value;
                    %>
                            <tr>
                              <td><%=db.Admin.GetUserFromUid(value).getString(1)%></td>
                              <td><%=db.Admin.GetUserFromUid(key).getString(1)%></td>
                            </tr>
                        <%
                    }
                }
         %>
                  </tbody>
                </table>
              </div>
       </div>
      </div>    
    </section>
    </body>
</html>