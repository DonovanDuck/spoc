<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/s-own.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/table.css" />
<script type="text/javascript">
	$(
			function() {
				$("#selectTerm")
						.on(
								"change",
								function() {
									var id = $(this)
											.children('option:selected').val();
									path = "${pageContext.request.contextPath}/student/selectVirtualClassByTerm/"
											+ id;
									$("#selectButtonA").attr("href", path);
									;
									$("#selectButton").click();
								})
			})
</script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<main>
	<div class="main_t">
		<div class="images">
			<img
				src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${student.faceImg }"
				style="width: 100%; height: 100%;" alt="" />
		</div>
		<div class="message">
			&nbsp;&nbsp;
			<h2>&nbsp;&nbsp;&nbsp;${student.studentNickName }</h2>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;${student.studentId }</p>
		</div>
	</div>
	<div class="main_b">
		<div class="main_b_l">
			<a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyCourse">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/k1.png"
							alt="" />我的课程
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyClass">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/b1.png"
							alt="" />我的班级
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyDiscuss">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的讨论
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyInfo">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/g1.png"
							alt="" />个人信息
					</p>
				</div>
			</a>
		</div>
		<div class="main_b_r" id="r1">
			<div class="main_b_r_t">
				<div class="word1" id="w1" onclick="f()">
					<p>
						<a href="#" id="p1">我的班级</a>
					</p>
				</div>
			</div>
			<hr>
			<div class="sx" style="margin-top: 1%">
				<div class="sx_r">
					<p>
						<span>开课学期:</span><select
							style="width: 70%; height: 24px; float: right;" id="selectTerm"
							name="selectTerm">
							<option>选择学期</option>
							<c:forEach items="${listTerm }" var="listTerm">
								<option value="${listTerm.termId }">
									${listTerm.startYear }-${listTerm.endYear }&nbsp&nbsp${listTerm.term}
								</option>
							</c:forEach>
						</select>
					</p>
				</div>
			</div>
			<div class="table" style="margin-left: 6%; margin-top: 1%;">
				<c:forEach items="${virtualClassList }" var="item"
					varStatus="status">
					<a
						href="${pageContext.request.contextPath}/teacher/toClassDetail?virtualClassNum=${item.virtualClassNum }&virtualClassName=${item.virtualClassName }">
						<div class="b1" style="border: 1px solid #000">
							<div class="b1_l">
								<img
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.faceImg }"
									alt="" style="width: 100%; height: 100%;" />
							</div>
							<div class="b1_r">
								<p class="h">${item.virtualCourseName }</p>
								<p class="p1">
									授课班级：
									<c:forEach items="${item.realClassList }" var="realClass">
	            	${realClass.realClassNum }班<span>&nbsp;&nbsp;&nbsp;</span>
									</c:forEach>
								</p>
								<p class="p1">课程名称：${item.virtualCourseName }</p>
								<p class="p2">开课学期：${item.term }</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<a id="selectButtonA" name="selectButtonA" href="">
			<button id="selectButton" name="selectButton" style="display: none">
			</button>
		</a>
	</main>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title></title>
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/s-own.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student/table.css" />
<script type="text/javascript">
	$(
			function() {
				$("#selectTerm")
						.on(
								"change",
								function() {
									var id = $(this)
											.children('option:selected').val();
									path = "${pageContext.request.contextPath}/student/selectVirtualClassByTerm/"
											+ id;
									$("#selectButtonA").attr("href", path);
									;
									$("#selectButton").click();
								})
			})
</script>
</head>
<body>
	<jsp:include page="/jsp/top.jsp" flush="true" />
	<main>
	<div class="main_t">
		<div class="images">
			<img
				src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${student.faceImg }"
				style="width: 100%; height: 100%;" alt="" />
		</div>
		<div class="message">
			&nbsp;&nbsp;
			<h2>&nbsp;&nbsp;&nbsp;${student.studentNickName }</h2>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;${student.studentId }</p>
		</div>
	</div>
	<div class="main_b">
		<div class="main_b_l">
			<a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyCourse">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/k1.png"
							alt="" />我的课程
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyClass">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/b1.png"
							alt="" />我的班级
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyDiscuss">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/t1.png"
							alt="" />我的讨论
					</p>
				</div>
			</a> <a
				href="${pageContext.request.contextPath}/student/toStudentCenter_MyInfo">
				<div class="nav1">
					<p>
						<img
							src="${pageContext.request.contextPath}/images/studentCenterImg/g1.png"
							alt="" />个人信息
					</p>
				</div>
			</a>
		</div>
		<div class="main_b_r" id="r1">
			<div class="main_b_r_t">
				<div class="word1" id="w1" onclick="f()">
					<p>
						<a href="#" id="p1">我的班级</a>
					</p>
				</div>
			</div>
			<hr>
			<div class="sx" style="margin-top: 1%">
				<div class="sx_r">
					<p>
						<span>开课学期:</span><select
							style="width: 70%; height: 24px; float: right;" id="selectTerm"
							name="selectTerm">
							<option>选择学期</option>
							<c:forEach items="${listTerm }" var="listTerm">
								<option value="${listTerm.termId }">
									${listTerm.startYear }-${listTerm.endYear }&nbsp&nbsp${listTerm.term}
								</option>
							</c:forEach>
						</select>
					</p>
				</div>
			</div>
			<div class="table" style="margin-left: 6%; margin-top: 1%;">
				<c:forEach items="${virtualClassList }" var="item"
					varStatus="status">
					<a
						href="${pageContext.request.contextPath}/student/toClassDetail?virtualClassNum=${item.virtualClassNum }&virtualClassName=${item.virtualClassName }">
						<div class="b1" style="border: 1px solid #000">
							<div class="b1_l">
								<img
									src="${pageContext.request.contextPath}/jsp/showImg.jsp?path=${item.faceImg }"
									alt="" />
							</div>
							<div class="b1_r">
								<p class="h">${item.virtualCourseName }</p>
								<p class="p1">
									授课班级：
									<c:forEach items="${item.realClassList }" var="realClass">
	            	${realClass.realClassNum }班<span>&nbsp;&nbsp;&nbsp;</span>
									</c:forEach>
								</p>
								<p class="p1">课程名称：${item.virtualCourseName }</p>
								<p class="p2">开课学期：${item.term }</p>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
		</div>
		<a id="selectButtonA" name="selectButtonA" href="">
			<button id="selectButton" name="selectButton" style="display: none">
			</button>
		</a>
	</main>
	<jsp:include page="/jsp/footer.jsp" flush="true" />
</body>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
</html>