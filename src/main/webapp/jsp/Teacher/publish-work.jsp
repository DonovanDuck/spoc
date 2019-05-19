<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html ng-app="app">
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/fileinput.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/teacher/wui.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/teacher/styletime.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap-table.min.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js" type="text/javascript" charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/js/plugins/piexif.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/js/plugins/sortable.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/fileinput.min.js"
	type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/themes/fas/theme.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="${pageContext.request.contextPath}/themes/explorer-fa/theme.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/angular.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/wui-date.js" charset="utf-8"></script>
<script type="text/javascript">
	var $table;
	var $tasktype;
	
	$(document).ready(function() {
		
		$tasktype=$("#taskCategory").val();
		$("#selectType2 li").click(function() {
			var text = $(this).html();
			if(text=="work"){
				$("#typeName").html("作业");
			}
			if(text=="trial"){
				$("#typeName").html("实验");
			}
			if(text=="work"){
				$("#typeName").html("课程设计");
			}
			$("#taskCategory2").val(text);
			$tasktype=$("#taskCategory").val();
			$('#taskListTable').bootstrapTable(
					'refresh', 
					{url : "${pageContext.request.contextPath}/teacher/getTaskListPage?taskCategory="+$tasktype});
		});
		$("#selectType1 li").click(function() {
			var text = $(this).html();
			$("#typeName").html(text);
			$("#taskCategory1").val(text);
			$tasktype=$("#taskCategory").val();
			
		});
		
		$("#editTime .wui-date-editor input").attr("name", "taskEndTime");
		$("#selectTime .wui-date-editor input").attr("name", "taskEndTime");
		
	});
	
	
	
	function InitMainTable() {
		
		$table = $('#taskListTable').bootstrapTable({
			method : 'get',
			url : "${pageContext.request.contextPath}/teacher/getTaskListPage?taskCategory="+$tasktype,//请求路径
			dataType : "json",
			striped : true, //是否显示行间隔色
			pageNumber : 1, //初始化加载第一页
			pagination : true,//是否分页
			striped: true,  //是否显示行间隔色
			sidePagination : 'client',//server:服务器端分页|client：前端分页
			pageSize : 5,//单页记录数
			pageList : [ 5, 10, 20, 30 ],//可选择单页记录数
			showRefresh : true,//刷新按钮
			clickToSelect: true,                //是否启用点击选中行
			singleSelect  : true,
			queryParams : function(params) {//上传服务器的参数
				var temp = {//如果是在服务器端实现分页，limit、offset这两个参数是必须的
					limit : params.limit, // 每页显示数量
					offset : params.offset // SQL语句起始索引
					//page : (params.offset / params.limit) + 1, //当前页码 
					/* Name : $('#search_name').val(),
					Tel : $('#search_tel').val() */
				};
				return temp;
			},
			columns : [ {
                checkbox: true,
                visible: true  
            }, {
				field : 'taskId',
				title : '任务Id',
				visible: true 
			},{
				field : 'taskTitle',
				title : '任务标题',

			}, {
				field : 'taskDetail',
				title : '任务描述',

			}, {
				field : 'publisherId',
				title : '发布者',

			}, {
				field : 'taskType',
				title : '分类',

			}, {
				field : 'courseId',
				title : '课程'
			}, {
				field : 'useNum',
				title : '使用次数'

			}, ],
			onClickRow:function (row,$element) {
				
				alert("dianjile "+row.taskTitle) ;  
				$("#taskId").val(row.taskId);
				alert($("#taskId").val());
				var getSelectRows = $("#monthCount_Table").bootstrapTable('getSelections', function (row) {
			          return row;
					});
				 console.log(getSelectRows);
				if(getSelectRows!=null){
					
				}             
			},
			 onCheck:function(row){
				 alert("dianjile "+row.taskTitle) ; 
				 $("#taskId").val(row.taskId);
				 alert($("#taskId").val());
		      }

		});
		
		

	};
	var autoTextarea = function(elem, extra, maxHeight) {
		extra = extra || 0;
		var isFirefox = !!document.getBoxObjectFor
				|| 'mozInnerScreenX' in window, isOpera = !!window.opera
				&& !!window.opera.toString().indexOf('Opera'), addEvent = function(
				type, callback) {
			elem.addEventListener ? elem
					.addEventListener(type, callback, false) : elem
					.attachEvent('on' + type, callback);
		}, getStyle = elem.currentStyle ? function(name) {
			var val = elem.currentStyle[name];
			if (name === 'height' && val.search(/px/i) !== 1) {
				var rect = elem.getBoundingClientRect();
				return rect.bottom - rect.top
						- parseFloat(getStyle('paddingTop'))
						- parseFloat(getStyle('paddingBottom')) + 'px';
			}
			;
			return val;
		} : function(name) {
			return getComputedStyle(elem, null)[name];
		}, minHeight = parseFloat(getStyle('height'));
		elem.style.resize = 'none';
		var change = function() {
			var scrollTop, height, padding = 0, style = elem.style;
			if (elem._length === elem.value.length)
				return;
			elem._length = elem.value.length;
			if (!isFirefox && !isOpera) {
				padding = parseInt(getStyle('paddingTop'))
						+ parseInt(getStyle('paddingBottom'));
			}
			;
			scrollTop = document.body.scrollTop
					|| document.documentElement.scrollTop;
			elem.style.height = minHeight + 'px';
			if (elem.scrollHeight > minHeight) {
				if (maxHeight && elem.scrollHeight > maxHeight) {
					height = maxHeight - padding;
					style.overflowY = 'auto';
				} else {
					height = elem.scrollHeight - padding;
					style.overflowY = 'hidden';
				}
				;
				style.height = height + extra + 'px';
				scrollTop += parseInt(style.height) - elem.currHeight;
				document.body.scrollTop = scrollTop;
				document.documentElement.scrollTop = scrollTop;
				elem.currHeight = parseInt(style.height);
			}
			;
		};
		addEvent('propertychange', change);
		addEvent('input', change);
		addEvent('focus', change);
		change();
	};

	function selectfunction() {

		$(".selectTaskButton").css("background-color", "#015293");
		$(".selectTaskButton").css("color", "#fff");
		$(".editTaskButton").css("background-color", "#fff");
		$(".editTaskButton").css("color", "#000000");
		$(".editTask").css("display", "none");
		$(".selectTask").css("display", "block");
	};

	function editfunction() {
		$(".editTaskButton").css("background-color", "#015293");
		$(".editTaskButton").css("color", "#fff");
		$(".selectTaskButton").css("background-color", "#fff");
		$(".selectTaskButton").css("color", "#000000");
		$(".editTask").css("display", "block");
		$(".selectTask").css("display", "none");
	};
	function testud() {

		var startTime = $(".wui-date-editor input").val()

		$("#publishTime").val(startTime);

	};
	function load() {

		$("#textarea").val('');
		$("#input-id").css("data-show-preview", true);
	};
	/*用window.onload调用myfun()*/

	// $(".selectTaskButton").click(function(){
	// 	
	// 	 $(".selectTaskButton").css("background-color","#015293");
	// 	$(".selectTaskButton").css("color","#fff");
	// 	$(".editTaskButton").css("background-color","#fff");
	// 	$(".editTaskButton").css("background-color","#000000"); */
	// });
	//  $(".editTaskButton").click(function(){
	// 	$(".editTaskButton").css("background-color","#015293");
	// 	$(".editTaskButton").css("color","#fff");
	// 	$(".selectTaskButton").css("background-color","#fff");
	// 	$(".selectTaskButton").css("color","#000000");
	// })
</script>

</head>
<body style="background-color: #F1F3F4;" onload="InitMainTable();">
	<div
		style="width: 80%; height: 50px; margin: 0 auto; background-color: #fff;">
		<div style="width: 20px; height: 50px; background: #015293;"></div>
	</div>
	<div class="selectstyle"
		style="width: 80%; height: 50px; margin: 10px auto; background-color: #fff;">
		<div class="selectTaskButton" onclick="selectfunction()"
			style="width: 50%; height: 50px; float: left; background-color: #015293; text-align: center; color: #fff;">
			<span style="line-height: 50px; font-size: 16px;">选择任务</span>
		</div>
		<div class="editTaskButton" onclick="editfunction()"
			style="width: 50%; height: 50px; float: left; text-align: center; color: #000000;">
			<span style="line-height: 50px; font-size: 16px;">自定义任务</span>
		</div>

	</div>


	<div class="editTask"
		style="width: 80%; height: 100%; margin: 20px auto; background-color: #fff; padding: 30px 0; display: none;">
		<div class="editTaskContent" style="margin: 30px 50px;">
			<form action="${pageContext.request.contextPath}/teacher/publishTask"
				id="publish" enctype="multipart/form-data" method="post">
				<div style="height: 1px; width: 100%;">
					<div class="input-group"
						style="float: left; width: 68%; margin-right: 2%;">
						<span class="input-group-addon" id="basic-addon3"
							style="font-size: 20px; padding: 0 50px; font-weight: bold;">任务标题</span>
						<input type="text" name="taskTitle" class="form-control"
							id="basic-url" aria-describedby="basic-addon3">
					</div>
					<div class="input-group" style="float: left; width: 30%;">
						<span class="input-group-addon" id="basic-addon3"
							style="font-size: 20px; padding: 0 50px; font-weight: bold;">任务类型</span>
						
						<div class="btn-group">
							<button id="basic-url" type="button"
								class=" form-control btn btn-primary  dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<span class="caret"></span><span id="typeName"
									style="font-size: 18px; margin-left:;">作业</span>
							</button>
							<ul id="selectType1" class="dropdown-menu">
								<c:forEach items="${taskCategoryList }" var="taskCategory">
									<li >${taskCategory }</li>

								</c:forEach>


							</ul>
						</div>
					</div>
					<input type="text" id="taskCategory1" name="taskCategory"
						hidden="hidden" value="work" />
				</div>
				<div class="taskdetail"
					style="width: 100%; padding-top: 40px; margin-top: 10px;">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">编辑任务</h3>
						</div>

						<textarea id="taskDetail" name="taskDetail" class="form-control"
							style="width: 100%; height: 100px; resize: none;"
							placeholder="编辑任务"></textarea>

					</div>
				</div>

				<div class="form-group">
				添加任务附件
					<div class="file-loading">
						<input id="input-id" name="file" class="file" type="file"
							multiple="multiple" data-show-preview="false" style="width: 70%"
							data-show-caption="true">
					</div>
				</div>

				<div id="editTime" class="input-group"
					style="width: 68%; margin-right: 2%;">
					<span class="input-group-addon" id="basic-addon3"
						style="font-size: 20px; padding: 0 50px; font-weight: bold;">截至时间</span>
					<wui-date format="yyyy-mm-dd hh:mm:ss" placeholder="请选择或输入日期"
						id="date4" btns="{'ok':'确定','now':'此刻'}"  ng-model="date4" minDate="2019-05-17",>
					</wui-date>
				</div>

				<!-- <div class="wui-content">
					<div class="wui-area">
						<h4 class="h4">选择年月日 时分秒</h4>
						<button onclick="testud()">测试</button>
						<p>输出格式yyyy-mm-dd hh:mm:ss</p>
						<wui-date 
							format="yyyy-mm-dd hh:mm:ss" 
							placeholder="请选择或输入日期" 
							id="date4" 
							btns="{'ok':'确定','now':'此刻'}" 
							ng-model="date4"
						>
						</wui-date>
					</div> -->
				
				<div class="toSubmit"
					style="width: 100%; height: 50px; margin-top: 50px;">
					<div style="width: 20%; height: 50px; margin: 0 auto;">
						<input class="btn btn-primary" type="submit" value="提交"
							style="float: left; margin-right: 25%;"> <input
							class="btn btn-default" type="submit" value="取消"
							style="float: left;">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="selectTask"
		style="width: 80%; height: 100%; margin: 20px auto; background-color: #fff; padding: 30px 0;">
		<div class="selectTaskContent" style="margin: 30px 50px;">
		<form action="${pageContext.request.contextPath}/teacher/selectTaskToPublish"
				method="post">
			<span>这是一个快速发布优质作业的重要途径，当然您也可以选择点击右侧自定义标签自定义作业</span>
			<div class="input-group" style="float: left; width: 30%;">
				<span class="input-group-addon" id="basic-addon3"
					style="font-size: 20px; padding: 0 50px; font-weight: bold;">作业类型</span>	
				<div class="btn-group">
							<button id="basic-url" type="button"
								class=" form-control btn btn-primary  dropdown-toggle"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">
								<span class="caret"></span><span id="typeName"
									style="font-size: 18px; margin-left:;">作业 </span>
							</button>
							<ul id="selectType2" class="dropdown-menu">
								<c:forEach items="${taskCategoryList }" var="taskCategory">
									<li>${taskCategory }</li>
								</c:forEach>
							</ul>
				</div>
				<input type="text" id="taskCategory2" name="taskCategory"
						hidden="hidden" value="work" />
				
			</div>
			<div class="selectTaskList" style="margin-top: 20px;">
				<!-- <iframe id="seleTaskItems" src="toselectTaskList" width="100%" height="500px">

					</iframe> -->
				<table id="taskListTable"></table>
			</div>
			<input name="taskId" id="taskId"  type="text" hidden="hidden" value=""/>
			<div id="selectTime" class="input-group"
				style="width: 68%; margin-right: 2%;">
				<span class="input-group-addon" id="basic-addon3"
					style="font-size: 20px; padding: 0 50px; font-weight: bold;">截至时间</span>
				<wui-date format="yyyy-mm-dd hh:mm:ss" placeholder="请选择或输入日期"
					id="date4" btns="{'ok':'确定','now':'此刻'}" ng-model="date4">
				</wui-date>
			</div>
			<div class="toSubmit"
				style="width: 100%; height: 50px; margin-top: 50px;">
				<div style="width: 20%; height: 50px; margin: 0 auto;">
					<input class="btn btn-primary" type="submit" value="提交"
						style="float: left; margin-right: 25%;"> <input
						class="btn btn-default" type="submit" value="取消"
						style="float: left;">
				</div>

			</div>
			</form>
		</div>

	</div>


	<script>
		var text = document.getElementById("taskDetail");
		autoTextarea(text); // 调用
	</script>
	<script type="text/javascript">
		var app = angular.module('app', [ "wui.date" ]);
	</script>
</body>
</html>
