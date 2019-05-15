<html>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.sql.ResultSet" %>
<%
             Connection conn = (Connection)session.getAttribute("temp");  //For performance optimization: put conn=null in the end of code
             String userId = request.getParameter("profId");
             ResultSet rs = db.Admin.GetDetails(conn, userId);
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
                  <p>Name : <%=name%> </p>
                  <p>Gender :<%=sex%> </p>
                  <p>Mobile :<%=mobile%> </p>
                  <p>Mail Id :<%=mailId%> </p>
                  <p>Document :<%=doc%> </p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
    </body>
    <%
    }
    rs.close();
    %>
</html>