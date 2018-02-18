// page redirecting
import java.io.IOException;
import java.io.PrintWriter;
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
    String uName = db.Admin.checkId(uid,p);
    if(!uName.equals("Invalid"))
    {
        HttpSession session = req.getSession(true);
        session.setAttribute("uid", uid);
        session.setAttribute("name", uName);
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