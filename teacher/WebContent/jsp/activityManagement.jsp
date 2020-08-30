<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="activityManagement.activityModular.dao.ActivityDao,
activityManagement.activityModular.entity.Activity, java.util.List,java.text.DateFormat,java.text.SimpleDateFormat"%>
<!DOCTYPE html>

<script src="https://how2j.cn/study/js/jquery/2.0.0/jquery.min.js"></script>
<link href="https://how2j.cn/study/css/bootstrap/3.3.6/bootstrap.min.css" rel="stylesheet">
<script src="https://how2j.cn/study/js/bootstrap/3.3.6/bootstrap.min.js"></script>
     
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<script>
$(function(){
    $("a").addClass("btn btn-default btn-xs");
     
});
 
</script> 

<html style="height: 80%">
<head>
<meta charset="UTF-8">
<title>活动管理</title>
</head>
<%
ActivityDao activityDao = new ActivityDao(); 
List<Activity> actList = activityDao.queryAllList();
DateFormat df = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
%>
<body style="height: 80%">
	<table width="100%" height="100%">
		<tr align="center" height="10px">
			<td><font size="6"><b>活动管理</b></font>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="userManagement.jsp"> 用 户 管 理 </a>&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="/teacher/jsp/index.jsp">返回首页</a></td>
		</tr>
		<tr align="center" height="10%">
			<td valign="center">
				<table>
					<tr>

						<td><a href="/teacher/jsp/activityEdit.jsp"><font size="4">新增活动</font></a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr align="center">
			<td valign="top">
				<table border="1">
				<table style="width:1300px; margin:44px auto" class="table table-striped table-bordered table-hover  table-condensed" align='center' border='1' cellspacing='0'>
					<tr>
						<th>序号</th>
						<th>活动名称</th>
						<th>主办方</th>
						<th>协办方</th>
						<th>报名开始时间</th>
						<th>报名结束时间</th>
						<th>活动开始时间</th>
						<th>活动结束时间</th>
						<th>活动报名人数</th>
						<th>操作</th>
					</tr>
					<%for(int i=0;i<actList.size();i++){ Activity act = actList.get(i);
%><tr>
						<td><%=i+1 %></td>
						<td><%=act.getActName() %></td>
						<td><%=act.getSponsor() %></td>
						<td><%=act.getCoOrganizer() %></td>
						<td><%=act.getSignUpStartDate()==null?"":df.format(act.getSignUpStartDate()) %>
						</td>
						<td><%=act.getSignUpEndDate()==null?"":df.format(act.getSignUpEndDate()) %>
						</td>
						<td><%=act.getActStartDate()==null?"":df.format(act.getActStartDate()) %>
						</td>
						<td><%=act.getActEndDate()==null?"":df.format(act.getActEndDate()) %>
						</td>
						<td align="center"><a
							href="signUpDetail.jsp?id=<%=act.getId()%>"><%=activityDao.getSingUpNum(act.getId()) %></a>
 





 
</td>
<td>
<a href="/teacher/jsp/activityEdit.jsp?id=<%=act.getId()%>">修改</a></td>
					</tr>
					<%
					}
%>
</table>
</td>
</tr>
</table>
</body>
</html>
 