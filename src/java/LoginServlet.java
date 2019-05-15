// page redirecting
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class LoginServlet extends HttpServlet
{
  @Override
  protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    String uid = req.getParameter("uid");
    String p = req.getParameter("pass");
    Connection conn = null;
    String uName = null;
    try{
        conn = db.Admin.connect();
        uName = db.Admin.checkId(conn,uid,p);
    }
    catch(Exception ex){ uName = ex.getMessage();}
    if(!uName.equals("Invalid"))
    {
        HttpSession session = req.getSession(true);
        session.setAttribute("uid", uid);
        session.setAttribute("name", uName);
        session.setAttribute("temp", conn);
        if(uid.startsWith("A")){
            session.setAttribute("userType", "admin");
            res.sendRedirect("homeadmin.jsp");
        }
        else if(uid.startsWith("C")){
            session.setAttribute("userType", "client");
            res.sendRedirect("homeclient.jsp");
        }
        else if(uid.startsWith("S")){
            session.setAttribute("userType", "supervisor");
            res.sendRedirect("homesupervisor.jsp");
        }
    }
    else
      res.sendRedirect("index.jsp?t=0"); // t is the query String parameter 
  }
}