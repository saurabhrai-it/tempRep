<%-- 
    Document   : index
    Created on : Feb 11, 2018, 5:26:54 PM
    Author     : Saurabh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
   String t = request.getParameter("t");
   if(t!=null) // if parameter passed by the user. 
      out.print("<font color=red>Sorry this is invalid Login Id & Password. re-enter plz.</font>"); 
 %>

    <form method="POST" action="LoginServlet">
        USER ID : <input type="text" id="uid" name="uid"/><br/>
        Password: <input type="password" id="pass" name="pass"/><br/>
        <input type="submit" value="Sign In">
    </form>
</html>
