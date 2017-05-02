<%-- 
    Document   : mainAuthorityTest
    Created on : Apr 11, 2017, 5:38:26 PM
    Author     : C.wan_yo
--%>
<!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
        <link href="css/1-col-portfolio.css" rel="stylesheet">
        <!-- Test -->
<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Home</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li>
                            <a href="#">Services</a>
                        </li>
                        <li>
                            <a href="#">Contact</a>
                        </li>
                        <li>
                            <a href="#">Student </a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Petition List
                        <small>2_2016</small>
                    </h1>
                </div>
            </div>
            <!-- /.row -->

            <!-- Petitions-->

            <sql:query var="petitionlist" dataSource="jdbc/">
                select name,submit_date,first_name,student_id,current_stage,max_stage
                from (
                SELECT student_id,first_name,request_form_id,formtype_id,current_stage,submit_date 
                FROM auregistrar.student,auregistrar.student_request 
                where id = student_id
                ) as A , auregistrar.formtype as B
                where current_stage<max_stage
                </sql:query>
                
                <c:forEach var="petition" items="${petitionlist.rows}">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="container">
                                <div class="row bs-wizard" style="border-bottom:0;">
                                    
                                        <div class="col-xs-1 bs-wizard-step <c:choose><c:when test="${0 <= petition.current_stage}">complete</c:when><c:otherwise>disabled</c:otherwise></c:choose>">
                                            <div class="text-center bs-wizard-stepnum">Step 1</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot"></a>
                                            <div class="bs-wizard-info text-center">Submitted</div>
                                        </div>

                                        <div class="col-xs-1 bs-wizard-step <c:choose><c:when test="${1 <= petition.current_stage}">complete</c:when><c:otherwise>disabled</c:otherwise></c:choose>"><!-- complete -->
                                            <div class="text-center bs-wizard-stepnum">Step 2</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot"></a>
                                            <div class="bs-wizard-info text-center">Advisor/Dean Approve</div>
                                        </div>

                                        <div class="col-xs-1 bs-wizard-step <c:choose><c:when test="${2 <= petition.current_stage}">complete</c:when><c:otherwise>disabled</c:otherwise></c:choose>"><!-- complete -->
                                            <div class="text-center bs-wizard-stepnum">Step 3</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot"></a>
                                            <div class="bs-wizard-info text-center">Process Completed</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <h3>${petition.name}</h3>
                            <h4>DATE : ${petition.submit_date}</h4>
                            <p>Name : ${petition.first_name} | ID : ${petition.student_id}</p>
                            <a class="btn btn-primary" href="#">View Petition <span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                        <div class="col-md-4">
                            <div class="row">
                                <label for="message">Note:</label><br />
                                <textarea id="message" class="input" name="message" rows="4" cols="30"></textarea><br />
                            </div>
                            <a class="btn btn-primary" href="#">Approve <span class="glyphicon glyphicon-chevron-right"></span></a>
                            <a class="btn btn-primary" href="#">Reject <span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                </c:forEach>       



                <!-- /.row -->

                <hr>

                <!-- Pagination -->
                <div class="row text-center">
                    <div class="col-lg-12">
                        <ul class="pagination">
                            <li>
                                <a href="#">&laquo;</a>
                            </li>
                            <li class="active">
                                <a href="#">1</a>
                            </li>
                            <li>
                                <a href="#">2</a>
                            </li>
                            <li>
                                <a href="#">3</a>
                            </li>
                            <li>
                                <a href="#">4</a>
                            </li>
                            <li>
                                <a href="#">5</a>
                            </li>
                            <li>
                                <a href="#">&raquo;</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- /.row -->

                <hr>

                <!-- Footer -->
                <footer>
                    <div class="row">
                        <div class="col-lg-12">
                            <p>Copyright &copy; Bla Bla 2017</p>
                        </div>
                    </div>
                    <!-- /.row -->
                </footer>

        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

<a href="${pageContext.request.contextPath}/Logout">Log out</a>
