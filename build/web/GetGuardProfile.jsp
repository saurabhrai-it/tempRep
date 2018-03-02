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
                      <th class="text-center">Supervisor Name</th>
                      <th class="text-center">Guard Name</th>
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
                    String key1 = "";
                    String value1 = "";
                    ResultSet rsGuard = db.Admin.GetUserFromUid(key);
                    if(rsGuard.next())
                        key1=rsGuard.getString(1);
                    if(tempStr.equals(value))
                    {
                        if(oneTime.equals("true")){
                            ResultSet rsSup = db.Admin.GetUserFromUid(value);
                            if(rsSup.next())
                                value1=rsSup.getString(1);
         %>
                            <tr>
                              <td>
                                  <button type="button" class="btn btn-linkedin btn-sm btn-block" data-toggle="modal"
                                          data-target="#supModal">
                                      <%=value1%>
                                  </button>
                              </td>
                              <td><button type="button" class="btn btn-facebook btn-sm btn-block" data-toggle="modal"
                                          data-target="#guardModal">
                                      <%=key1%>
                                  </button></td>
                            </tr>
                        <% 
                            oneTime = "false";
                            }
                        else{
                        %>
                            <tr>
                              <td></td>
                              <td><button type="button" class="btn btn-facebook btn-sm btn-block" data-toggle="modal"
                                          data-target="#guardModal">
                                      <%=key1%>
                                  </button></td>
                            </tr>
         <% 
                            }
                    }
                    else{
                    tempStr  = value;
                    ResultSet rsSup = db.Admin.GetUserFromUid(value);
                    if(rsSup.next())
                       value1=rsSup.getString(1);
                    %>
                            <tr>
                              <td><button type="button" class="btn btn-linkedin btn-sm btn-block" data-toggle="modal"
                                          data-target="#supModal">
                                      <%=value1%>
                                  </button></td>
                              <td><button type="button" class="btn btn-facebook btn-sm btn-block" data-toggle="modal"
                                          data-target="#guardModal">
                                      <%=key1%>
                                  </button></td>
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
                  
    <div class="modal fade" id="supModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-center">Supervisor Profile</h4>
              </div>
              <div class="modal-body">
                <p>Some text in the modal.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
      
        </div>
    </div>              
    <div class="modal fade" id="guardModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-center">Guard Profile</h4>
              </div>
              <div class="modal-body">
                <p>Some text in the modal.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
      
        </div>
    </div>
                  
    </body>
</html>