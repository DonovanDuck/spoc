<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>courseCreate</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/create_lesson.css"
	type="text/css">
<link href="http://www.tit.edu.cn/images/logo.ico" rel="Shortcut Icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/Admin/bootstrap.css"
	rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/ueditor.all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ueditor/zh-cn.js"></script>
<%-- 	
<script
	src="${pageContext.request.contextPath}/js/Admin/jquery-1.10.2.js"></script> --%>
<script
	src="${pageContext.request.contextPath}/js/Admin/bootstrap.min.js"></script>

<%-- <jsp:include page="${pageContext.request.contextPath}/jsp/AdminJsp/Common.jsp" ></jsp:include> --%>
<style type="text/css">
	.phoneUl li{
		list-style-type: none;
		float:left;
		width: 67px;
	}
	.confirm_close{
	   width: 100%;
    height: 50px;
<<<<<<< HEAD
<<<<<<< HEAD
            top: 25px;
    left: 98px;
=======
            top: -7px;
    left: 195px;
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
            top: 25px;
    left: 98px;
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
    position: relative;
	}
	.confirm_close ul li{
		list-style-type: none;
		float:left;
		margin-left: 170px;
	}
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
	.createCourse{
		width: 182px;
		font-size: 10px;
		position: relative;
		top: 10px;
		left: 165px;
	}
<<<<<<< HEAD
=======
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
</style>
<script>
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
</script>

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
<script>
function checkboxOnclick(checkbox){
	if(checkbox.checked == true){
		var value = checkbox.value;
		$("#back_up_ul").append("<li class='"+checkbox.value+"back back_up_li' style='float:left;margin-right: 18px;'><input class='back_up_input' type='checkbox' onclick='checkboxOnclick2(this)' checked='checked' value='"+checkbox.value+"'>"+checkbox.value+"</li>")
		$("."+checkbox.value+"teach").remove();	 
	}
}
</script>

<script>
function checkboxOnclick2(checkbox){
	if(checkbox.checked == false){
		$("#teacherul").append("<li class='"+checkbox.value+"teach teacher' style='float:left;margin-right: 18px;'><input class='back_up_input' type='checkbox' onclick='checkboxOnclick(this)' value='"+checkbox.value+"'>"+checkbox.value+"</li>")
		$("."+checkbox.value+"back").remove();	 
	}
}
</script>

<<<<<<< HEAD
<script type="text/javascript">
	$(function(){
		$("#pull").click(function(){
			//alert($("#teacher").text());
			if($("#teacher").text() == ""){
				$.ajax({
					async:false,
					cache:false,
					url:"${pageContext.request.contextPath}/teacher/ajaxGetTeachers",
					type:"POST",
					dataType:"json",
					success:function(result) {
						//alert(result);
						 var arr = eval(result);
						 var backarr = $(".back_up_input");
						for(var i = 0; i < arr.length; i++){
							//alert(arr[i].employeeNum);//通过ajax动态加载教师列表后，动态在拟态框里添加列表
							var flag = true;
							backarr.each(function(){
								if(this.value == arr[i].employeeNum){
									flag = false;
								}
							});
							if(flag)
							$("#teacherul").append("<li class='"+arr[i].employeeNum+"teach teacher' style='float:left;margin-right: 18px;'><input id='teacher' type='checkbox' onclick='checkboxOnclick(this)' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName+"</li>");
						} 
					}
				});
			}
			
		});
	});
</script>

<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			//alert($("#employeeNum").val());
			var employeeNum = $("#employeeNum").val();
			$(".teacher").remove();  //将模态框现有选项全部清除
				$.ajax({   // 获取搜索结果
					async:false,
					cache:false,
					url:"${pageContext.request.contextPath}/teacher/ajaxSearchTeachers",
					type:"POST",
					data:{"employeeNum" : employeeNum},
					dataType:"json",
					success:function(result) {
						//alert(result);
						 var arr = eval(result);
						 var backarr = $(".back_up_input");
						 
						for(var i = 0; i < arr.length; i++){
							//alert(arr[i].employeeNum);//通过ajax动态加载教师列表后，动态在拟态框里添加列表
							var flag = true;
							backarr.each(function(){
								if(this.value == arr[i].employeeNum){
									flag = false;
								}
							});
							if(flag)
							$("#teacherul").append("<li name='teacher' class='"+arr[i].employeeNum+"teach teacher' style='float:left;margin-right: 18px;'><input id='teacher' type='checkbox' onclick='checkboxOnclick(this)' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName+"</li>");
						} 
					}
				});
=======
<script type="text/javascript">
	$(function(){
		$("#pull").click(function(){
			$.ajax({
				async:false,
				cache:false,
				url:"${pageContext.request.contextPath}/teacher/ajaxGetTeachers",
				type:"POST",
				dataType:"json",
				success:function(result) {
					//alert(result);
					 var arr = eval(result);
					for(var i = 0; i < arr.length; i++){
						//alert(arr[i].employeeNum);//通过ajax动态加载教师列表后，动态在拟态框里添加列表
						$("#teacher").append("<input id='teacher' type='checkbox' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName);
					} 
				}
			});
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
<script type="text/javascript">
	$(function(){
		$("#pull").click(function(){
			//alert($("#teacher").text());
			if($("#teacher").text() == ""){
				$.ajax({
					async:false,
					cache:false,
					url:"${pageContext.request.contextPath}/teacher/ajaxGetTeachers",
					type:"POST",
					dataType:"json",
					success:function(result) {
						//alert(result);
						 var arr = eval(result);
						 var backarr = $(".back_up_input");
						for(var i = 0; i < arr.length; i++){
							//alert(arr[i].employeeNum);//通过ajax动态加载教师列表后，动态在拟态框里添加列表
							var flag = true;
							backarr.each(function(){
								if(this.value == arr[i].employeeNum){
									flag = false;
								}
							});
							if(flag)
							$("#teacherul").append("<li class='"+arr[i].employeeNum+"teach teacher' style='float:left;margin-right: 18px;'><input id='teacher' type='checkbox' onclick='checkboxOnclick(this)' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName+"</li>");
						} 
					}
				});
			}
			
		});
	});
</script>

<script type="text/javascript">
	$(function(){
		$("#search").click(function(){
			//alert($("#employeeNum").val());
			var employeeNum = $("#employeeNum").val();
			$(".teacher").remove();  //将模态框现有选项全部清除
				$.ajax({   // 获取搜索结果
					async:false,
					cache:false,
					url:"${pageContext.request.contextPath}/teacher/ajaxSearchTeachers",
					type:"POST",
					data:{"employeeNum" : employeeNum},
					dataType:"json",
					success:function(result) {
						//alert(result);
						 var arr = eval(result);
						 var backarr = $(".back_up_input");
						 
						for(var i = 0; i < arr.length; i++){
							//alert(arr[i].employeeNum);//通过ajax动态加载教师列表后，动态在拟态框里添加列表
							var flag = true;
							backarr.each(function(){
								if(this.value == arr[i].employeeNum){
									flag = false;
								}
							});
							if(flag)
							$("#teacherul").append("<li name='teacher' class='"+arr[i].employeeNum+"teach teacher' style='float:left;margin-right: 18px;'><input id='teacher' type='checkbox' onclick='checkboxOnclick(this)' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName+"</li>");
						} 
					}
				});
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
		});
	});
</script>

<<<<<<< HEAD
<<<<<<< HEAD

 <script type="text/javascript">
	$(function() {
		var checked = [];//点击确认后获取的多选框的值
		$("#confirm")
				.click(
						function() {
							$(".selectedTeachers").remove();//将页面显示的教师全部移除
							checked = []; //清空旧的集合
							$('input:checkbox:checked')
									.each( //循环遍历
											function() {
												checked.push($(this).val()); //遍历获取到多选框的值
												//alert(checked.length+"  "+checked[checked.length-1]);
													var items = checked[checked.length-1];
														$("#selectedRealClassUI")  //重新显示在页面
																.append(
																		"<li id='selectedTeachers' class='selectedTeachers' name='selectedTeachers' style='float: left;margin-left:2%;width: 30%;'>"
																				+ "<span>教师:</span><input value='"+items+"' name='selectedTeacherContent' style='width: 50%;' id='selectedTeacherContent'/></li>");

											});
							$(".teacher").remove();
=======
=======

>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
 <script type="text/javascript">
	$(function() {
		var checked = [];//点击确认后获取的多选框的值
		$("#confirm")
				.click(
						function() {
							$(".selectedTeachers").remove();//将页面显示的教师全部移除
							checked = []; //清空旧的集合
							$('input:checkbox:checked')
									.each( //循环遍历
											function() {
												checked.push($(this).val()); //遍历获取到多选框的值
												//alert(checked.length+"  "+checked[checked.length-1]);
													var items = checked[checked.length-1];
														$("#selectedRealClassUI")  //重新显示在页面
																.append(
																		"<li id='selectedTeachers' class='selectedTeachers' name='selectedTeachers' style='float: left;margin-left:2%;width: 30%;'>"
																				+ "<span>教师:</span><input value='"+items+"' name='selectedTeacherContent' style='width: 50%;' id='selectedTeacherContent'/></li>");

											});
<<<<<<< HEAD
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
							$(".teacher").remove();
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
						});
	});
</script> 

<script type="text/javascript">
$(function() {
	$("#create").click(
            function() {
            	var i = 1;
                var check="";
                $("input[name='teacher']:checked").each(function(i){
                	if(i == 0){
                		 check =check+$(this).val();
                	}
                	else{
                		 check =check+","+$(this).val();
                	}
                	i = i+1;
                });
                $("#teacherContent").val(check);
            });
})
     </script>

<!-- <script type="text/javascript">
	$(function(){
		$("#confirm").click(function(){
			var checked=$("input:checkbox[name=teacher]:checked").val();
			for(var i = 0; i < checked.length; i++){
				alert(check[i].val());
			}
			/* $.ajax({
				async:false,
				cache:false,
				url:"${pageContext.request.contextPath}/teacher/ajaxGetTeachers/${employeeNum}",
				type:"POST",
				dataType:"json",
				success:function(result) {
					//alert(result);
					 var arr = eval(result);
					for(var i = 0; i < arr.length; i++){
						//alert(arr[i].employeeNum);//通过ajax动态加载教师列表后，动态在拟态框里添加列表
						$("#teacher").append("<input type='checkbox' value='"+arr[i].employeeNum+"' name='teacher'/>"+arr[i].teacherName);
					} 
				}
			}); */
		});
	});
</script> -->

<script type="text/javascript">
	$(function(){
		$("#close").click(function(){
			//拟态框每次关闭要清除之前信息，否则会叠加
<<<<<<< HEAD
<<<<<<< HEAD
			$(".teacher").remove();
			//$(".back_up_li").remove();
			$("#employeeNum").val("");
			//清除后要留一空li,以保证下次成功动态加载
			$("#teacherul").append(" <li id="+"teacher"+">"+"</li>");
=======
			$("#teacher").remove();
			//清除后要留一空li,以保证下次成功动态加载
			$("#teacherUl").append(" <li id="+"teacher"+">"+"</li>");
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
			$(".teacher").remove();
			//$(".back_up_li").remove();
			$("#employeeNum").val("");
			//清除后要留一空li,以保证下次成功动态加载
			$("#teacherul").append(" <li id="+"teacher"+">"+"</li>");
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
		});
	});
</script>

<!-- 图片预加载 -->
<script>
//浏览图片
    function chan(i) {
        var objUrl = getObjectURL(i.files[0]);
        if (objUrl) {
            $("#photos").attr("src", objUrl);  //这里的id是要显示图片位置的Id
        }
    };
    //建立一個可存取到該file的url
    function getObjectURL(file) {
        var url = null;
        // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
        if (window.createObjectURL != undefined) { // basic
            url = window.createObjectURL(file);
        } else if (window.URL != undefined) { // mozilla(firefox)
            url = window.URL.createObjectURL(file);
        } else if (window.webkitURL != undefined) { // webkit or chrome
            url = window.webkitURL.createObjectURL(file);
        }
        return url;
    } 
</script>

</head>
<body>
<<<<<<< HEAD
	<div class="wrapper"></div>
		<%-- <jsp:include page="/jsp/top.jsp" flush="true"/> --%>
		<div class="createCourse">
			<h2>创建课程</h2>
		</div>
		<div class="main">
			<form action="${pageContext.request.contextPath}/teacher/createCourse"  method="post"  enctype="multipart/form-data">
				<input type="hidden" name="publisherId" value="${teacher.employeeNum }">
				<div class="input1">
					<span>课程名称：</span> <input name="courseName" type="text"
						placeholder="请输入课程名称："
						style="width: 60%; height: 30px; float: left; margin-left: 2%;">
				</div>
				<div class="input1">
=======

	<div class="wrapper" ></div>

		<jsp:include page="/jsp/top.jsp" flush="true"/>
			
		<div class="main">
		
			<form action="${pageContext.request.contextPath}/teacher/createCourse"  method="post"  enctype="multipart/form-data">
		
				<input type="hidden" name="publisherId" value="${teacher.employeeNum }"/>
					
				<div class="input3">
	
					<span>课程名称：</span> 
					
					<input name="courseName"  type="text"  placeholder="请输入课程名称："  style="width: 60%; height: 30px; float: left; margin-left: 2%;"/>
					
				</div>
				
				<div class="input1">
				
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
					<ul class="phoneUl">
					<span style="float: left;" >添加图片：</span> 
					<label for="faceImg" style="cursor: pointer">
						<li>
							<input type="file" id="faceImg" style="display: none;" onchange="chan(this)"
<<<<<<< HEAD
								name="faceImg">
=======
								name="faceImg"/>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
						</li>
						<li><img id="photos" src="" width="100" height="100" /></li>
					</label>
					</ul>
				</div>
				<div class="input3">
					<span>课程分类：</span> <select name="courseCategory" id="category">
						<c:forEach items="${categoryList }" var="category">
							<option value="${category.categoryId }">${category.categoryName }</option>
						</c:forEach>
					</select>
				</div>


				<hr>
				<div class="input1">
					<span>课程介绍：</span>
					<textarea id="courseDetail" name="courseDetail" type="text" placeholder=""
						style="width:700px; height: 200px; float: left; margin-left: 9%;" ></textarea>
				</div>
				
		
				
				<!-- 拟态框star -->
<<<<<<< HEAD
<<<<<<< HEAD
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
	  					<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="search_teacher" style="height: 50px;">
									<div class="form-group">
									    <input type="text" class="form-control" id="employeeNum" placeholder="教师工号" style="width: 174px;
    											margin-right: 18px;margin-left: 16px;float: left;">
									 </div>
									 <button id="search" type="button" class="btn btn-default">搜索</button>
								</div>
								<div style="height: auto; width: auto;min-height: 42px;">
									<ul id="teacherul" style="list-style-type:none;margin-left: 17px;min-height: 15px;height: auto;">
									<!-- <li id="teacher"></li> -->
									
								</ul>
								</div>
								<div class="back_up" style="height: auto; width: auto;min-height: 42px;">
									<input type="hidden" class="back_up_input" /> 
									<ul id="back_up_ul" style="list-style-type:none;margin-left: 17px;min-height: 15px;height: auto;">
									 
									
								</ul>
									
								</div>
								<div style="clear:both"></div>
=======
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
=======
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static">
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
	  					<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="search_teacher" style="height: 50px;">
									<div class="form-group">
									    <input type="text" class="form-control" id="employeeNum" placeholder="教师工号" style="width: 174px;
    											margin-right: 18px;margin-left: 16px;float: left;">
									 </div>
									 <button id="search" type="button" class="btn btn-default">搜索</button>
								</div>
								<div style="height: auto; width: auto;min-height: 42px;">
									<ul id="teacherul" style="list-style-type:none;margin-left: 17px;min-height: 15px;height: auto;">
									<!-- <li id="teacher"></li> -->
									
								</ul>
								</div>
								<div class="back_up" style="height: auto; width: auto;min-height: 42px;">
									<input type="hidden" class="back_up_input" /> 
									<ul id="back_up_ul" style="list-style-type:none;margin-left: 17px;min-height: 15px;height: auto;">
									 
									
								</ul>
<<<<<<< HEAD
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
									
								</div>
								<div style="clear:both"></div>
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
								<div class="modal-footer">
									<button id="close" type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" id="confirm" class="btn btn-primary" data-dismiss="modal">确定</button>
								</div>
							</div>
						</div>
					</div>
				<!-- 拟态框end -->
				
				<div class="teacher-friend">
					<h3>教师圈：</h3>
					<div class="friend">
						<ul id="selectedRealClassUI" style="list-style-type: none;">
<<<<<<< HEAD
<<<<<<< HEAD
							<%-- <li id="selectedTeachers" name=selectedTeachers
								style="float: left; margin-left: 2%; width: 30%;">
									<span>教师:</span>
									<input value="${teacher.employeeNum }" name="selectedTeacherContent" style='width: 50%;' id="selectedTeacherContent"/>
								</li> --%>
=======
							<li id="selectedTeachers" name=selectedTeachers
								style="float: left; margin-left: 2%; width: 30%;">
									<span>教师:</span>
									<input value="${teacher.employeeNum }" name="selectedTeacherContent" style='width: 50%;' id="selectedTeacherContent"/>
								</li>
>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
=======
							<%-- <li id="selectedTeachers" name=selectedTeachers
								style="float: left; margin-left: 2%; width: 30%;">
									<span>教师:</span>
									<input value="${teacher.employeeNum }" name="selectedTeacherContent" style='width: 50%;' id="selectedTeacherContent"/>
								</li> --%>
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
						</ul>
						<div class="add">
							<button type="button" id="pull" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">拉入教师</button>
						</div>
						<input value="" name="teacherContent" id="teacherContent"
							type="hidden" />
					</div>
				</div>
				<hr>
				<div class="confirm_close">
					<ul>
						<li><input id="create" class="btn btn-default" style="width: 84px;" type="submit" value="创建" /></li>
						<li><input class="btn btn-default" style="width: 84px;" value="取消" /></li>
					</ul>
				</div>
			</form>
		</div>
		
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 8b686c47d14ac368571e08f4b308c03cc9fa9818
		<%-- <jsp:include page="/jsp/footer.jsp" flush="true"/> --%>
		
		<!-- bootstrup -->
		
</body>
<script type="text/javascript" charset="utf-8">
	UE.getEditor('courseDetail');
	
</script>
=======
		<jsp:include page="/jsp/footer.jsp" flush="true"/>
		
		<!-- bootstrup -->
		<script type="text/javascript" charset="utf-8">
	UE.getEditor('courseDetail');
	
</script>
</body>

>>>>>>> ba23b36d13648be6805e6ab3770f5b9542927c76
</html>
