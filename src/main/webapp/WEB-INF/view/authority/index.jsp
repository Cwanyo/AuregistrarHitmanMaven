<%-- 
    Document   : index
    Created on : May 10, 2017, 3:57:08 AM
    Author     : C.wan_yo
--%>

<!-- MetisMenu CSS -->
<link href="${pageContext.request.contextPath}/Content/authority/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${pageContext.request.contextPath}/Content/authority/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/Content/authority/vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${pageContext.request.contextPath}/Content/authority/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- Main css --->
<link href="${pageContext.request.contextPath}/Content/authority/css/main.css" rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/Content/authority/css/bootstrap-table.min.css" rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/Content/authority/css/bootstrap.min.css" rel="stylesheet" type="text/css">



<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" style="font-size: 25px;" href="${pageContext.request.contextPath}/authority/index">${authorityInfo.getRole()} Page <span style="font-size: 13px;color: black;font-weight: bold">( Welcome, ${userName} )</span></a>
        </div>
        <!-- /.navbar-header -->


        <ul class="nav navbar-top-links navbar-right">

            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <a style="right: auto">
                        <img src="${userPicture}" class="img-circle"width="130" height="130">
                    </a><br></br>
                    <li class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/authority/request"><i class="fa fa-fw fa-file-text"></i> Student Request</a>
                    </li>
                    <!-- /.nav-second-level -->
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div id="page-wrapper" >

        <c:if test="${(empty task)}">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Authority</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <a style='color: black;font-size: 15px'>Authority petitions are filed for consideration of exception to a University policy. The Policies and Procedures for the Student
                Petition have been established by Assumption University Office Of The University Registrar.<br></br></a>
            <a style='color: black;font-size: 15px'>To check student petition request please click "Student Request" at the left menu bar.</a>

        </c:if>
        <c:if test="${!empty task}">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-10">
                        <h1 class="page-header">Student Request</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
            </div>

            <div class="container" style="margin-right: 12cm">
                <div id="toolbar"></div>
                <table id="myTable" data-toggle="table" data-detail-view="true" data-detail-formatter="detailFormatter">
                    <thead>
                        <tr>
                            <th> ID </th>
                            <th> Type </th>
                            <th> Status </th>
                            <!--<th> Signature </th>-->
                            <th> Approve </th>
                            <th> Suspend </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var = "countRow" value="${0}"/>
                        <!--/Loop p list -->
                        <c:forEach var="p" items="${plist}">
                            <tr>
                                <td>${p.student.id}</td>
                                <td>Petition</td>
                                <td>${p.status}</td>
                                <!--<td><input type="text" class="form-control input-sm" name="signature" value="" /></td>-->
                                <td><input type="button" value="Confirm" class="btn btn-block" onclick="approve('p',${p.id.studentId}, '${p.id.submitTime}')"></td>
                                <td><input type="button" value="Confirm" class="btn btn-block" onclick="suspend('p',${p.id.studentId}, '${p.id.submitTime}')"></td>
                            </tr>
                        <span style="display: none;" id="desc${countRow}">
                            <div>
                                <h4>Request option : 
                                    <c:if test="${p.getRequestOption()==1}">
                                        CHANGE FACULTY/MAJOR
                                    </c:if>
                                    <c:if test="${p.getRequestOption()==2}">
                                        CHANGE ADDRESS
                                    </c:if>
                                    <c:if test="${p.getRequestOption()==3}">
                                        OTHER 
                                    </c:if>
                                </h4>
                                <h4>Request message :-</h4>
                                <textarea name="requestmessage" class="form-control" rows="5" readonly>${p.getRequestMessage()}</textarea>
                                <h4>Request reason :-</h4>
                                <textarea name="requestreason" class="form-control" rows="5" readonly>${p.getRequestReason()}</textarea>
                                <h4>Advisor Signature :</h4>
                                <input class="form-control" type="text" name="" value="${p.getAdvisorApprovalSignature()}" readonly/>
                                <h4>Dean Signature :</h4>
                                <input class="form-control" type="text" name="" value="${p.getDeanApprovalSignature()}" readonly/>
                            </div>
                        </span>
                        <c:set var = "countRow" value="${countRow+1}"/>
                    </c:forEach>
                    <!--End Loop p list -->

                    <!--/Loop c list -->
                    <c:forEach var="c" items="${clist}">
                        <tr>
                            <td>${c.student.id}</td>
                            <td>Change Section</td>
                            <td>${c.status}</td>
                            <!--<td><input type="text" class="form-control input-sm" name="signature" value="" /></td>-->
                            <td><input type="button" value="Confirm" class="btn btn-block" onclick="approve('c',${c.id.studentId}, '${c.id.submitTime}')"></td>
                            <td><input type="button" value="Confirm" class="btn btn-block" onclick="suspend('c',${c.id.studentId}, '${c.id.submitTime}')"></td>
                        </tr>
                        <span style="display: none;" id="desc${countRow}">
                            <div>
                                <h4>Request option : 
                                    <c:if test="${c.getRequestOption()==1}">
                                        Normal Section
                                    </c:if>
                                    <c:if test="${c.getRequestOption()==2}">
                                        Full Section 
                                    </c:if>
                                </h4>
                                Course Number : ${c.getCourseNumber()} <br>
                                Section Number : ${c.getSectionNumber()}
                                <h4>Request message :-</h4>
                                <textarea name="requestmessage" class="form-control" rows="5" readonly>${c.getRequestMessage()}</textarea>
                                <h4>Dean Signature :</h4>
                                <input class="form-control" type="text" name="" value="${c.getDeanApprovalSignature()}" readonly/>
                            </div>
                        </span>
                        <c:set var = "countRow" value="${countRow+1}"/>
                    </c:forEach>
                    <!--End Loop c list -->
                    </tbody>
                </table>
            </div>
        </c:if>


        <div style="height: 50px;"></div>
        <!-- Modal POPUP -->
        <div class="modal fade" id="popUp" role="dialog">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">INFO</h4>
                    </div>
                    <div class="modal-body">
                        <p>You have submitted the form successfully!</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Done</button>
                    </div>
                </div>
            </div>
        </div>
        <!------------------>
    </div>
</div>
<!-- /#page-wrapper -->

<!-- /#wrapper -->
<script>

    function load_form(id, path) {
        $(id).load("${pageContext.request.contextPath}/Content/authority/formtype/" + path);
    }

    $('form').on('submit', function () {
        alert(123);
        //$('#popUp').modal();
    });

    function Check_Option(id) {
        alert(id);
    }

    var $table = $('#myTable');

    $table.on('expand-row.bs.table', function (e, index, row, $detail) {
        var res = $("#desc" + index).html();
        $detail.html(res);
    });

    /*$table.on("click-row.bs.table", function (e, row, $tr) {
     
     // prints Clicked on: table table-hover, no matter if you click on row or detail-icon
     console.log("Clicked on: " + $(e.target).attr('class'), [e, row, $tr]);
     
     // In my real scenarion, trigger expands row with text detailFormatter..
     //$tr.find(">td>.detail-icon").trigger("click");
     // $tr.find(">td>.detail-icon").triggerHandler("click");
     if ($tr.next().is('tr.detail-view')) {
     $table.bootstrapTable('collapseRow', $tr.data('index'));
     } else {
     $table.bootstrapTable('expandRow', $tr.data('index'));
     }
     });*/

    function approve(type, studentid, date) {
        if (type === 'p') {
            console.log('papprove');
            $.ajax({
                url: '${pageContext.request.contextPath}/authority/papprove',
                type: 'post',
                data: {studentId: studentid, subDate: date},
                success: function () {
                    console.log("done");
                }
            });
        } else if (type === 'c') {
            console.log('capprove');
            $.ajax({
                url: '${pageContext.request.contextPath}/authority/capprove',
                type: 'post',
                data: {studentId: studentid, subDate: date},
                success: function () {
                    console.log("done");
                }
            });
        }
        location.reload();
    }

    function suspend(type, studentid, date) {
        if (type === 'p') {
            console.log('psuspend');
            $.ajax({
                url: '${pageContext.request.contextPath}/authority/psuspend',
                type: 'post',
                data: {studentId: studentid, subDate: date},
                success: function () {
                    console.log("done");
                }
            });
        } else if (type === 'c') {
            console.log('csuspend');
            $.ajax({
                url: '${pageContext.request.contextPath}/authority/csuspend',
                type: 'post',
                data: {studentId: studentid, subDate: date},
                success: function () {
                    console.log("done");
                }
            });
        }
        location.reload();
    }
</script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/Content/authority/vendor/metisMenu/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="${pageContext.request.contextPath}/Content/authority/vendor/raphael/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/Content/authority/vendor/morrisjs/morris.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/Content/authority/js/sb-admin-2.js"></script>

<script src="${pageContext.request.contextPath}/Content/authority/js/bootstrap-table.min.js"></script>

