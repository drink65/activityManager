<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page
	import="activityManagement.userModular.entity.User,
	activityManagement.activityModular.dao.ActivityDao,
    activityManagement.activityModular.entity.Activity,
    java.util.List,java.text.DateFormat,java.text.SimpleDateFormat"%>
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

<html>
<head>
<meta charset="utf-8">

</head>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	ActivityDao activityDao = new ActivityDao();
	List<Activity> actList = activityDao.queryAllList();
	DateFormat df = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
%>
<body style="height: 80%">
	<table width="100%" height="100%">
		<tr align="center" height="10%">
			<td valign="center" width="100">
				<table>
					<tr>
						<%
							if (loginUser == null) {
						%>
						<td><a href="/teacher/html/login.html"><font size="4"><b>请登录</b></font></a></td>
						<%
							} else {
						%>
						<td><b><%="当前用户："+loginUser.getNickname()%></b></td>
						<%
							if ("admin".equals(loginUser.getUserName())) {
						%>
						<td><a href="/teacher/jsp/userManagement.jsp"> 后 台 管 理 </a></td>
						<%
							} else {
						%>
						<td><a href="/teacher/jsp/userActivity.jsp">个人中心</a></td>
						<%
							}
						%>
						<td><a href="/teacher/logout">登出</a></td>
						<%
							}
						%>
					</tr>
				</table>

			</td>
		</tr>
		<tr align="center">
			<td valign="top">
				<table>
					<%
						for (int i = 0; i<actList.size(); i++) {
							Activity act = actList.get(i);
					%>
					<tr>
						<td><img src="<%="/teacher"+act.getActPicture()%>" width="200px"></td>
						<td><%=act.getActName()%><br /> 
						主办方：<%=act.getSponsor()%><br/>
						协办方：<%=act.getCoOrganizer()%><br/> 
						报 名 时 间 ： <%=act.getSignUpStartDate() == null ? "" : df.format(act.getSignUpStartDate())%>&nbsp;— &nbsp;
							<%=act.getSignUpEndDate() == null ? "" : df.format(act.getSignUpEndDate())%><br/>
							活 动 时 间 ： <%=act.getActStartDate() == null ? "" : df.format(act.getActStartDate())%>&nbsp;—&nbsp;

							<%=act.getActEndDate() == null ? "" : df.format(act.getActEndDate())%><br/>
							<a href="/teacher/jsp/activityDetail.jsp?id=<%=act.getId()%>"> <b>活 动 详 情</b></a>


						</td>
					</tr>
					<tr>
						<td colspan="2"></td>
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
