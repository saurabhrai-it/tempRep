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
    if(p.equals("agile"))
    {
        HttpSession session = req.getSession(true);
        session.setAttribute("uid", uid);
        session.setAttribute("userType", "admin");
         res.sendRedirect("homeadmin.jsp");
    }
    else if(p.equals("agile1"))
    {
        HttpSession session = req.getSession(true);
        session.setAttribute("uid", uid);
        session.setAttribute("userType", "supervisor");
         res.sendRedirect("homesupervisor.jsp");
    }
    else
      res.sendRedirect("index.jsp?t=0"); // t is the query String parameter 
  }
}