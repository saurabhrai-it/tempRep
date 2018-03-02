<html>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.sql.ResultSet" %>
<%
             String userId = request.getParameter("profId");
             ResultSet rs = db.Admin.GetDetails(userId);
             String header = "Guard";
             if(userId.startsWith("S"))
                 header = "Supervisor";
             if(rs.next())
             {
                 String name=rs.getString(1);
                 String sex=rs.getString(2);
                 String mobile=rs.getString(3);
                 String doc=rs.getString(4);
                 String mailId=rs.getString(5);
%>
  <body> 
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title text-center"><%=header%> Profile</h4>
              </div>
              <div class="modal-body">
                <p><%=userId%> <%=name%> <%=sex%> <%=mobile%> <%=doc%> <%=mailId%></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
    </body>
    <%
    }
    %>
</html>