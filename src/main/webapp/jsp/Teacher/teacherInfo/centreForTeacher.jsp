<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/teacher/own.css" />
<<<<<<< HEAD
<<<<<<< HEAD
	<%-- <link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" /> --%>
=======
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
	<%-- <link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" /> --%>
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
 <jsp:include page="/jsp/top.jsp" flush="true"/>
<main>
    <div class="main_t">
        <div class="images">
            <img src="../images/tou.png" alt=""/>
        </div>
        <div class="message">
            &nbsp;&nbsp;<h2>&nbsp;&nbsp;&nbsp;${teacher.teacherName }</h2>
            <p> &nbsp;&nbsp;&nbsp;&nbsp;${teacher.professionalTitles }</p>
        </div>
    </div>
    <div class="main_b">
        <div class="main_b_l">
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyCourse"><div class="nav1" ><p><img src="../images/k1.png" alt=""/><span>课程信息</span></p></div></a>
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyClass"><div class="nav1" ><p><img src="../images/b1.png" alt=""/><span>班级信息</span></p></div></a>
            <a target="iframeContent" href="../html/teacher_talk_iframe.html"><div class="nav1" ><p><img src="../images/l1.png" alt=""/><span>参与论坛</span></p></div></a>
            <a><div class="nav1" onclick="d()"><p><img src="../images/j1.png" alt=""/><span>教师团队</span></p></div></a>
            <a target="iframeContent" href="${pageContext.request.contextPath}/teacher/toMyInfo"><div class="nav1" ><p><img src="../images/g1.png" alt=""/><span>个人信息</span></p></div></a>
        </div>
<<<<<<< HEAD
        <div class="main_b_r">
        <iframe  id="iframeContent" name="iframeContent"
                 style="width: 100%;min-height: 1235px;height: auto;"
<<<<<<< HEAD
=======
        <div class="main_b_r" style="width: 83%;float: left;height: 100%">
        <iframe  id="iframeContent" name="iframeContent"
                 style="width: 100%;height: 100%"
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
                frameborder="no" border="0" scrolling="no"
                src="${pageContext.request.contextPath}/teacher/toMyCourse"></iframe>
        </div>

<<<<<<< HEAD
<<<<<<< HEAD
       
=======
        <div id="r4"></div>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
       
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818

    </div>
</main>
<jsp:include page="/jsp/footer.jsp" flush="true"/>

</body>
</html>