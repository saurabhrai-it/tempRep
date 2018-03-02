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
                                  <a href="Profile.jsp?profId=<%=value%>"  data-toggle="modal" data-target="#<%=value%>Modal">
                                  <button type="button" class="btn btn-linkedin btn-sm btn-block">
                                      <%=value1%>
                                  </button>
                                  </a>
                              </td>
                              <td>
                                  <a href="Profile.jsp?profId=<%=key%>"  data-toggle="modal" data-target="#<%=key%>Modal">
                                  <button type="button" class="btn btn-linkedin btn-sm btn-block">
                                      <%=key1%>
                                  </button>
                                  </a>
                              </td>
                            </tr>
                                              
    <div id="<%=value%>Modal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
  </div>
                    
    <div id="<%=key%>Modal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
  </div>
  
                        <% 
                            oneTime = "false";
                            }
                        else{
                        %>
                            <tr>
                              <td></td>
                              <td>
                                  <a href="Profile.jsp?profId=<%=key%>"  data-toggle="modal" data-target="#<%=key%>Modal">
                                  <button type="button" class="btn btn-linkedin btn-sm btn-block">
                                      <%=key1%>
                                  </button>
                                  </a>
                              </td>
                            </tr>
                                                
    <div id="<%=key%>Modal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
  </div>
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
                              <td>
                                  <a href="Profile.jsp?profId=<%=value%>"  data-toggle="modal" data-target="#<%=value%>Modal">
                                  <button type="button" class="btn btn-linkedin btn-sm btn-block">
                                      <%=value1%>
                                  </button>
                                  </a>
                              </td>
                              <td>
                                  <a href="Profile.jsp?profId=<%=key%>"  data-toggle="modal" data-target="#<%=key%>Modal">
                                  <button type="button" class="btn btn-linkedin btn-sm btn-block">
                                      <%=key1%>
                                  </button>
                                  </a>
                              </td>
                            </tr>
                                                                          
    <div id="<%=value%>Modal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
  </div>
                    
    <div id="<%=key%>Modal" class="modal fade text-center">
    <div class="modal-dialog">
      <div class="modal-content">
      </div>
    </div>
  </div>
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