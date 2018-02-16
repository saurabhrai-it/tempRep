/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saurabh
 */
public class AddAdminServlet extends HttpServlet {

 @Override
  protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      
    HttpSession session = req.getSession(true);  
      
    String nameNew = req.getParameter("nameNewAdmin");
    String mobNewAdmin = req.getParameter("mobNewAdmin");
    String passNewAdmin = req.getParameter("passNewAdmin");
    String sexNewAdmin = req.getParameter("sexNewAdmin");
    String mailIdNewAdmin = req.getParameter("mailIdNewAdmin");
    String docNewAdmin = "No Doc for now";//**TODO**: req.getParameter("docNewAdmin");
    String uid=(String)session.getAttribute("uid");
    String output = db.Admin.addAdmin(nameNew, sexNewAdmin, docNewAdmin, mobNewAdmin, mailIdNewAdmin, passNewAdmin, uid);
    if(output.contains("Successfully"))
    {
         res.sendRedirect("homeadmin.jsp?success=true");
    }
    else
      res.sendRedirect("homeadmin.jsp?t="+output); // t is the query String parameter 
  }
    
}
