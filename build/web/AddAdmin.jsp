<html>
    <%--<%@ page import="java.sql.*" %>--%>
    <body>
        <%
            String userType=(String)session.getAttribute("userType");
//            Connection conn=(Connection)session.getAttribute("temp");
        %>
    <section class="content-header">
      <h1>
        Add Admin
        <small>Control panel</small>
      </h1>
    </section>
    
    <form role="form" action="AddAdminServlet" method="POST">
              <div class="box-body">
                <div class="form-group">
                  <label for="nameNewAdmin">Full Name</label>
                  <input type="text" class="form-control" id="nameNewAdmin" name="nameNewAdmin" placeholder="Enter Full Name">
                </div>
                <div class="form-group">
                  <label for="mobNewAdmin">Mobile Number</label>
                  <input type="text" class="form-control" id="mobNewAdmin" name="mobNewAdmin" placeholder="Enter Mobile Number">
                </div>
                <div class="form-group">
                  <label for="passNewAdmin">Password</label>
                  <input type="password" class="form-control" id="passNewAdmin" name="passNewAdmin" placeholder="Password">
                </div>
                <div class="form-group">
                  <label for="sexNewAdmin">Gender</label>
                  <div class="radio">
                    <label>
                      <input type="radio" name="sexNewAdmin" id="male" value="male">
                      Male
                    </label>
                  </div>
                  <div class="radio">
                    <label>
                      <input type="radio" name="sexNewAdmin" id="female" value="female">
                      Female
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label for="mailIdNewAdmin">Email address</label>
                  <input type="email" class="form-control" id="mailIdNewAdmin" name="mailIdNewAdmin" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="docNewAdmin">Add Document</label>
                  <input type="file" id="docNewAdmin" name="docNewAdmin">
                  <button type="submit" class="btn btn-primary" style="float: right;">Submit</button>
                </div>
              </div>
              <!-- /.box-body -->

            </form>
     </body>
</html>