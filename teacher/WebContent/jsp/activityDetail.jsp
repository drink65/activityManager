<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@	page
	import="activityManagement.userModular.entity.User,activityManagement.activityModular.dao.ActivityDao,activityManagement.activityModular.entity.Activity,
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
<title>活动详情</title>
</head>
<%
	User loginUser = (User) session.getAttribute("loginUser");
	String actId = request.getParameter("id");
	Activity act = null;
	ActivityDao activityDao = new ActivityDao();

	if (actId == null) {
		act = new Activity();
	} else {
		act = activityDao.queryById(Integer.parseInt(actId));
	}
	DateFormat df = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
%>
<body style="height: 80%">
	<table width="100%" height="100%">
		<tr align="center">
			<td valign="top">
				<table>
					<tr>

						<td><a href="#" onclick="javascript:history.go(-1)"><font size="4"><b>返 回</b></font> </a></td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<h1><%=act.getActName()%></h1>
						</td>
					</tr>
					<tr>
						<td><img src="<%="/teacher"+act.getActPicture()%>" width="400"></td>
						<td>主办方：<%=act.getSponsor()%><br /> 协办方：<%=act.getCoOrganizer()%><br />
							报 名 时 间 ： <%=act.getSignUpStartDate() == null ? "" : df.format(act.getSignUpStartDate())%>&nbsp;
							— &nbsp; <%=act.getSignUpEndDate() == null ? "" : df.format(act.getSignUpEndDate())%><br />
							活 动 时 间 ： <%=act.getActStartDate() == null ? "" : df.format(act.getActStartDate())%>&nbsp;—&nbsp;

							<%=act.getActEndDate() == null ? "" : df.format(act.getActEndDate())%><br />
						<br />
						<br /> <%
 	if (loginUser == null) {
 %> <a href="/teacher/html/login.html">请先登录再报名</a>
							<%
								} else if (activityDao.isSignUp(loginUser.getId(),

										act.getId())) {
							%> <label>已 报 名</label> <%
 	} else {
 %> <a	href="/teacher/signUp?userId=<%=loginUser.getId()%>&actId=<%=act.getId()%>">报 名</a> <%
 	}
 %>
						</td>
					</tr>
					<tr>

						<td>
							<%
								if (act.getActContent() != null) {
							%> <%=act.getActContent().replaceAll("\n", "<br/>")%>
							<%
								}
							%>

						</td>
					</tr>
				</table>
			</td>
		</tr>

	</table>
</body>
</html>

