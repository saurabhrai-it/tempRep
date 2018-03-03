<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Client | Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<body class="hold-transition skin-blue sidebar-mini" onload="noBack();"
    onpageshow="if (event.persisted) noBack();" onunload="">
    <% 
//    String uid=(String)session.getAttribute("uid");
    String name=(String)session.getAttribute("name");
    String joinDate="23 July, 2017";
    if(name==null)
          response.sendRedirect("index.jsp");
%>
<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="homeclient.jsp" class="logo">
      <span class="logo-mini"><b>S</b>K</span>
      <span class="logo-lg"><b>Sys</b>Key</span>
    </a>
    <nav class="navbar navbar-static-top">
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li>
            <a href="index.jsp?t=logout">
                <span class="hidden-xs"><b>SIGN OUT</b></span>
            </a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        <li class="treeview">
            <a href="#" onclick="getDashboard();">
            <i class="fa fa-dashboard"></i> <span>Dashboard</span>
          </a>
        </li>
        <li class="treeview">
            <a href="#" onclick="getGuardProfile();">
            <i class="fa fa-user-plus"></i>
            <span>Guard Profile</span>
          </a>
        </li>
        <li class="treeview">
            <a href="#" onclick="getGuardAttendance();">
            <i class="fa fa-user-plus"></i>
            <span>Guard Attendance</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#" onclick="mapGuard();">
            <i class="fa fa-user-plus"></i>
            <span>Guard Map</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#" onclick="accounts();">
            <i class="fa fa-users"></i>
            <span>Accounts</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#" onclick="broadcastMessage();">
            <i class="fa fa-pie-chart"></i>
            <span>Broadcast Message</span>
          </a>
        </li>
        <li>
            <a href="index.jsp?t=logout">
            <i class="fa fa-sign-out"></i>
            <span>Sign Out</span>
          </a>
        </li>
	  </ul>
    </section>
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="contentDiv">   
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 1.0.0
    </div>
    <strong>Copyright &copy; 2018 <a href="#">SysKey</a>.</strong> All rights
    reserved.
  </footer>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="js/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="js/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
  
  function getDashboard() {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("contentDiv").innerHTML = this.responseText;
					}
				};
			xhttp.open("POST","GetDashboard.jsp",true);
			xhttp.send();
			}
			
 function getGuardProfile() {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("contentDiv").innerHTML = this.responseText;
					}
				};
				xhttp.open("POST","GetGuardProfile.jsp",true);
				xhttp.send();
			}
						
 function getGuardAttendance() {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("contentDiv").innerHTML = this.responseText;
					}
				};
				xhttp.open("POST","GetGuardAttendance.jsp",true);
				xhttp.send();
			}
			
						
 function mapGuard() {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("contentDiv").innerHTML = this.responseText;
					}
				};
				xhttp.open("POST","MapGuard.jsp",true);
				xhttp.send();
			}
			
						
 function accounts() {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("contentDiv").innerHTML = this.responseText;
					}
				};
				xhttp.open("POST","Accounts.jsp",true);
				xhttp.send();
			}
			
						
 function broadcastMessage() {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("contentDiv").innerHTML = this.responseText;
					}
				};
				xhttp.open("POST","BroadcastMessage.jsp",true);
				xhttp.send();
			}

 function getAttendance(userId1,type) {
				xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
					if (this.readyState == 4 && this.status == 200) {
						document.getElementById("AttendanceId"+userId1).innerHTML = this.responseText;
					}
				};
				xhttp.open("POST","GetAttendance.jsp?id="+userId1+"&type="+type,true);
				xhttp.send();
			}
						
     window.onload=function() {
				 getDashboard();
			}
</script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="bower_components/raphael/raphael.min.js"></script>
<!-- Sparkline -->
<script src="bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="bower_components/moment/min/moment.min.js"></script>
<script src="bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>