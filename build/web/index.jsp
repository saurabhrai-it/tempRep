<%-- 
    Document   : index
    Created on : Feb 11, 2018, 5:26:54 PM
    Author     : Saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <% 
response.setHeader("Cache-Control","no-store"); 
response.setHeader("Pragma","no-cache"); 
response.setHeader ("Expires", "0"); //prevents caching at the proxy server 
%>
    <%
   String t = request.getParameter("t");
   if(t!=null) // if parameter passed by the user. 
   {
       if(t.equals("0"))
           out.print("<font color=red>Sorry this is invalid Login Id & Password. re-enter plz.</font>");
       else if(t.equals("logout"))
           out.print("<font color=red>Logout Done. Do Login Again!!!</font>");
   } 
 %>

    <form method="POST" action="LoginServlet">
        USER ID : <input type="text" id="uid" name="uid"/><br/>
        Password: <input type="password" id="pass" name="pass"/><br/>
        <input type="submit" value="Sign In">
    </form>
</html>
