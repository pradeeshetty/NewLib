<!doctype html>
<%@page import="com.DbConnection.*,java.util.*"%>
<html class="no-js" lang="en">

<head>
<%
      if (session != null) {
         if (session.getAttribute("admin") != null) {
            String name = (String) session.getAttribute("admin");
            
         } else {
            response.sendRedirect("login.jsp");
         }
      }
   %>
   
   <script type="text/javascript">
    function Validate() {
        var copies = document.getElementById("copies").value;
        var available = document.getElementById("available").value;
        if (available>copies) {
            alert("Available should be less than or equals to copies");
            return false;
        }
        return true;
    }
</script>
   
<style>
table {
    background: #f5f5f5;
    border-collapse: separate;
    box-shadow: inset 0 1px 0 #fff;
    font-size: 12px;
    line-height: 24px;
    margin: 30px auto;
    text-align: left;
    width: 1300px;
}   

th {
    background: url(https://jackrugile.com/images/misc/noise-diagonal.png), linear-gradient(#777, #444);
    border-left: 1px solid #555;
    border-right: 1px solid #777;
    border-top: 1px solid #555;
    border-bottom: 1px solid #333;
    box-shadow: inset 0 1px 0 #999;
    color: #fff;
  font-weight: bold;
    padding: 10px 15px;
    position: relative;
    text-shadow: 0 1px 0 #000;  
}

th:after {
    background: linear-gradient(rgba(255,255,255,0), rgba(255,255,255,.08));
    content: '';
    display: block;
    height: 25%;
    left: 0;
    margin: 1px 0 0 0;
    position: absolute;
    top: 25%;
    width: 100%;
}

th:first-child {
    border-left: 1px solid #777;    
    box-shadow: inset 1px 1px 0 #999;
}

th:last-child {
    box-shadow: inset -1px 1px 0 #999;
}

td {
    border-right: 1px solid #fff;
    border-left: 1px solid #e8e8e8;
    border-top: 1px solid #fff;
    border-bottom: 1px solid #e8e8e8;
    padding: 10px 15px;
    position: relative;
    transition: all 300ms;
}

td:first-child {
    box-shadow: inset 1px 0 0 #fff;
}   

td:last-child {
    border-right: 1px solid #e8e8e8;
    box-shadow: inset -1px 0 0 #fff;
}   

tr {
    
}

tr:nth-child(odd) td {
  
}

tr:last-of-type td {
    box-shadow: inset 0 -1px 0 #fff; 
}

tr:last-of-type td:first-child {
    box-shadow: inset 1px -1px 0 #fff;
}   

tr:last-of-type td:last-child {
    box-shadow: inset -1px -1px 0 #fff;
}   

tbody:hover td {
   
    text-shadow: 0 0 3px #aaa;
}

tbody:hover tr:hover td {
    color: #444;
    text-shadow: 0 1px 0 #fff;
}
</style>


    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="assets2/images/icon/favicon.ico">
    <link rel="stylesheet" href="assets2/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets2/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets2/css/themify-icons.css">
    <link rel="stylesheet" href="assets2/css/metisMenu.css">
    <link rel="stylesheet" href="assets2/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets2/css/slicknav.min.css">
    <!-- amchart css -->
    <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
    <!-- others css -->
    <link rel="stylesheet" href="assets2/css/typography.css">
    <link rel="stylesheet" href="assets2/css/default-css.css">
    <link rel="stylesheet" href="assets2/css/styles.css">
    <link rel="stylesheet" href="assets2/css/responsive.css">
    <!-- modernizr css -->
    <script src="assets2/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!-- preloader area start -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- preloader area end -->
    <!-- page container area start -->
    <div class="page-container">
        <!-- sidebar menu area start -->
        <div class="sidebar-menu">
            <div class="sidebar-header">
                <div class="logo">
                    <a href="admin.jsp"><h2>Admin Dashboard</h2></a>
                </div>
            </div>
            <div class="main-menu">
                <div class="menu-inner">
                    <nav>
                        <ul class="metismenu" id="menu">
                            <li class="active">
                                <a href="javascript:void(0)" aria-expanded="true"><i class="ti-dashboard"></i><span>dashboard</span></a>
                               
                            </li>
                            <li>
                                <a href="javascript:void(0)" aria-expanded="false"><i class="ti-layout-sidebar-left"></i><span>Books
                                    </span></a>
                                <ul class="collapse">
                                    <li><a href="addbooks.jsp">Add Books</a></li>
                                    <li><a href="bookupdate.jsp">Update Books</a></li>
                                      <li><a href="deletebook.jsp">Delete Books</a></li>
                                </ul>
                            </li>
                          
                             <li>
                                <a href="viewbooks.jsp" ><i class="fa fa-table"></i>
                                    <span>View Books</span></a>
                                
                            </li>
                          
                            <li><a href="bookrequest.jsp"><i class="ti-receipt"></i> <span>Requested Books</span></a></li>
                            <li>
                                <a href="issuedbooks.jsp" ><i class="ti-layers-alt"></i> <span>Issued Books</span></a>
                               
                            </li>
                          
                    </nav>
                </div>
            </div>
        </div>
        <!-- sidebar menu area end -->
        <!-- main content area start -->
        <div class="main-content">
            <!-- header area start -->
            <div class="header-area">
                <div class="row align-items-center">
                    <!-- nav and search button -->
                    <div class="col-md-6 col-sm-8 clearfix">
                        <div class="nav-btn pull-left">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <div class="search-box pull-left">
                           
                        </div>
                    </div>
                    <!-- profile info & task notification -->
                    <div class="col-md-6 col-sm-4 clearfix">
                        <ul class="notification-area pull-right">
                            <li id="full-view"><i class="ti-fullscreen"></i></li>
                            <li id="full-view-exit"><i class="ti-zoom-out"></i></li>
                            <li class="dropdown">
                                <i class="ti-bell dropdown-toggle" data-toggle="dropdown">
                                    <span>2</span>
                                </i>
                                <div class="dropdown-menu bell-notify-box notify-box">
                                    <span class="notify-title">You have 3 new notifications <a href="#">view all</a></span>
                                    <div class="nofity-list">
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb"><i class="ti-key btn-danger"></i></div>
                                            <div class="notify-text">
                                                <p>You have Changed Your Password</p>
                                                <span>Just Now</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb"><i class="ti-comments-smiley btn-info"></i></div>
                                            <div class="notify-text">
                                                <p>New Commetns On Post</p>
                                                <span>30 Seconds ago</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb"><i class="ti-key btn-primary"></i></div>
                                            <div class="notify-text">
                                                <p>Some special like you</p>
                                                <span>Just Now</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb"><i class="ti-comments-smiley btn-info"></i></div>
                                            <div class="notify-text">
                                                <p>New Commetns On Post</p>
                                                <span>30 Seconds ago</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb"><i class="ti-key btn-primary"></i></div>
                                            <div class="notify-text">
                                                <p>Some special like you</p>
                                                <span>Just Now</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb"><i class="ti-key btn-danger"></i></div>
                                            <div class="notify-text">
                                                <p>You have Changed Your Password</p>
                                                <span>Just Now</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb"><i class="ti-key btn-danger"></i></div>
                                            <div class="notify-text">
                                                <p>You have Changed Your Password</p>
                                                <span>Just Now</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li class="dropdown">
                                <i class="fa fa-envelope-o dropdown-toggle" data-toggle="dropdown"><span>3</span></i>
                                <div class="dropdown-menu notify-box nt-enveloper-box">
                                    <span class="notify-title">You have 3 new notifications <a href="#">view all</a></span>
                                    <div class="nofity-list">
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb">
                                                <img src="assets2/images/author/author-img1.jpg" alt="image">
                                            </div>
                                            <div class="notify-text">
                                                <p>Aglae Mayer</p>
                                                <span class="msg">Hey I am waiting for you...</span>
                                                <span>3:15 PM</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb">
                                                <img src="assets2/images/author/author-img2.jpg" alt="image">
                                            </div>
                                            <div class="notify-text">
                                                <p>Aglae Mayer</p>
                                                <span class="msg">When you can connect with me...</span>
                                                <span>3:15 PM</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb">
                                                <img src="assets2/images/author/author-img3.jpg" alt="image">
                                            </div>
                                            <div class="notify-text">
                                                <p>Aglae Mayer</p>
                                                <span class="msg">I missed you so much...</span>
                                                <span>3:15 PM</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb">
                                                <img src="assets2/images/author/author-img4.jpg" alt="image">
                                            </div>
                                            <div class="notify-text">
                                                <p>Aglae Mayer</p>
                                                <span class="msg">Your product is completely Ready...</span>
                                                <span>3:15 PM</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb">
                                                <img src="assets2/images/author/author-img2.jpg" alt="image">
                                            </div>
                                            <div class="notify-text">
                                                <p>Aglae Mayer</p>
                                                <span class="msg">Hey I am waiting for you...</span>
                                                <span>3:15 PM</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb">
                                                <img src="assets2/images/author/author-img1.jpg" alt="image">
                                            </div>
                                            <div class="notify-text">
                                                <p>Aglae Mayer</p>
                                                <span class="msg">Hey I am waiting for you...</span>
                                                <span>3:15 PM</span>
                                            </div>
                                        </a>
                                        <a href="#" class="notify-item">
                                            <div class="notify-thumb">
                                                <img src="assets2/images/author/author-img3.jpg" alt="image">
                                            </div>
                                            <div class="notify-text">
                                                <p>Aglae Mayer</p>
                                                <span class="msg">Hey I am waiting for you...</span>
                                                <span>3:15 PM</span>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li class="settings-btn">
                                <i class="ti-settings"></i>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- header area end -->
            <!-- page title area start -->
            <div class="page-title-area">
                <div class="row align-items-center">
                    <div class="col-sm-6">
                        <div class="breadcrumbs-area clearfix">
                            <h4 class="page-title pull-left">Dashboard</h4>
                            <ul class="breadcrumbs pull-left">
                                <li><a href="index.html">Home</a></li>
                                <li><span>Dashboard</span></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 clearfix">
                        <div class="user-profile pull-right">
                            <img class="avatar user-thumb" src="assets2/images/author/avatar.png" alt="avatar">
                            <h4 class="user-name dropdown-toggle" data-toggle="dropdown">Admin <i class="fa fa-angle-down"></i></h4>
                            <div class="dropdown-menu">
                                
                                <a class="dropdown-item" href="Logout">Log Out</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- page title area end -->
            <div class="main-content-inner">
                <!-- sales report area start -->
                <form action="UpdateBook" method="post">
            	<table>
            	<tr><th>Book Name:</th> <th>Author:</th> <th>Publisher:</th>  <th>Price:</th> <th>Pages:</th> <th>Year:</th> <th>Copies:</th> <th> Available:</th></tr>
            	
            	<%
            	String bookid=request.getParameter("bookid");
            	DbConnection d=new DbConnection();
            	List l=d.booktoupdate(bookid);
            	 Iterator iterator = l.iterator();
                 while(iterator.hasNext()) {  
                	 
                	 
                	// iterator.next();
                	 
                	 
                	 
                %>
                <input type="hidden" name="bookid" value=<%=iterator.next() %>>
                 <tr>
              <td>  <input type="text" name="bookname" value= <%=iterator.next() %> required="required"></td>
                  <td> <input type="text" name="author" pattern="[a-zA-Z\s]+" title="name should not contatin number or special character" value= <%=iterator.next() %> required="required"></td>
               <td><input type="text" name="publisher" value= <%=iterator.next() %> required="required"></td>
                <td> <input type="number" name="price" value= <%=iterator.next() %> required="required"></td>
                <td> <input type="number" name="pages" value= <%=iterator.next() %> required="required"></td>
                <td>   <input type="number" name="year" min="1900" max="2019" maxlength="4" title="Year should have 4 digit" value= <%=iterator.next() %> required="required"></td>
                <td> <input type="number" id="copies" name="copies" value= <%=iterator.next() %> required="required"></td>
                <td>  <input type="number" id="available" name="available" value= <%=iterator.next() %> required="required"></td>
                <td><input type="submit" onclick="return Validate()" value="Update"></td>
                 </tr>
                <br>
                  <% 
                 }
            	
            	%>
                       </table>     
                       </form>          
                        </div>
                    </div>
                    <!-- exchange area end -->
                </div>
                <!-- row area start-->
            </div>
        </div>
        <!-- main content area end -->
        <!-- footer area start-->
        <footer>
            <div class="footer-area">
                
            </div>
        </footer>
        <!-- footer area end-->
    </div>
    <!-- page container area end -->
    <!-- offset area start -->
    <div class="offset-area">
        <div class="offset-close"><i class="ti-close"></i></div>
        <ul class="nav offset-menu-tab">
            <li><a class="active" data-toggle="tab" href="#activity">Activity</a></li>
            <li><a data-toggle="tab" href="#settings">Settings</a></li>
        </ul>
        <div class="offset-content tab-content">
            <div id="activity" class="tab-pane fade in show active">
                <div class="recent-activity">
                    <div class="timeline-task">
                        <div class="icon bg1">
                            <i class="fa fa-envelope"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-check"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Added</h4>
                            <span class="time"><i class="ti-time"></i>7 Minutes Ago</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-exclamation-triangle"></i>
                        </div>
                        <div class="tm-title">
                            <h4>You missed you Password!</h4>
                            <span class="time"><i class="ti-time"></i>09:20 Am</span>
                        </div>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="fa fa-bomb"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Member waiting for you Attention</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="ti-signal"></i>
                        </div>
                        <div class="tm-title">
                            <h4>You Added Kaji Patha few minutes ago</h4>
                            <span class="time"><i class="ti-time"></i>01 minutes ago</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg1">
                            <i class="fa fa-envelope"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Ratul Hamba sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Hello sir , where are you, i am egerly waiting for you.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-exclamation-triangle"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg2">
                            <i class="fa fa-exclamation-triangle"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="fa fa-bomb"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                    <div class="timeline-task">
                        <div class="icon bg3">
                            <i class="ti-signal"></i>
                        </div>
                        <div class="tm-title">
                            <h4>Rashed sent you an email</h4>
                            <span class="time"><i class="ti-time"></i>09:35</span>
                        </div>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Esse distinctio itaque at.
                        </p>
                    </div>
                </div>
            </div>
            <div id="settings" class="tab-pane fade">
                <div class="offset-settings">
                    <h4>General Settings</h4>
                    <div class="settings-list">
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Notifications</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch1" />
                                    <label for="switch1">Toggle</label>
                                </div>
                            </div>
                            <p>Keep it 'On' When you want to get all the notification.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show recent activity</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch2" />
                                    <label for="switch2">Toggle</label>
                                </div>
                            </div>
                            <p>The for attribute is necessary to bind our custom checkbox with the input.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show your emails</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch3" />
                                    <label for="switch3">Toggle</label>
                                </div>
                            </div>
                            <p>Show email so that easily find you.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Show Task statistics</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch4" />
                                    <label for="switch4">Toggle</label>
                                </div>
                            </div>
                            <p>The for attribute is necessary to bind our custom checkbox with the input.</p>
                        </div>
                        <div class="s-settings">
                            <div class="s-sw-title">
                                <h5>Notifications</h5>
                                <div class="s-swtich">
                                    <input type="checkbox" id="switch5" />
                                    <label for="switch5">Toggle</label>
                                </div>
                            </div>
                            <p>Use checkboxes when looking for yes or no answers.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- offset area end -->
    <!-- jquery latest version -->
    <script src="assets2/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap 4 js -->
    <script src="assets2/js/popper.min.js"></script>
    <script src="assets2/js/bootstrap.min.js"></script>
    <script src="assets2/js/owl.carousel.min.js"></script>
    <script src="assets2/js/metisMenu.min.js"></script>
    <script src="assets2/js/jquery.slimscroll.min.js"></script>
    <script src="assets2/js/jquery.slicknav.min.js"></script>

    <!-- start chart js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    <!-- start highcharts js -->
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <!-- start zingchart js -->
    <script src="https://cdn.zingchart.com/zingchart.min.js"></script>
    <script>
    zingchart.MODULESDIR = "https://cdn.zingchart.com/modules/";
    ZC.LICENSE = ["569d52cefae586f634c54f86dc99e6a9", "ee6b7db5b51705a13dc2339db3edaf6d"];
    </script>
    <!-- all line chart activation -->
    <script src="assets2/js/line-chart.js"></script>
    <!-- all pie chart -->
    <script src="assets2/js/pie-chart.js"></script>
    <!-- others plugins -->
    <script src="assets2/js/plugins.js"></script>
    <script src="assets2/js/scripts.js"></script>
</body>

</html>
