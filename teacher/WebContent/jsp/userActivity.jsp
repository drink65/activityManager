<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="activityManagement.activityModular.dao.ActivityDao,
activityManagement.activityModular.entity.Activity, activityManagement.userModular.entity.User, java.util.List,java.text.DateFormat,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html style="height: 80%">
<head>
<meta charset="UTF-8">
<title>已报名活动</title>
</head>
<%
	ActivityDao activityDao = new ActivityDao();
	User loginUser = (User) session.getAttribute("loginUser");
	List<Activity> actList = activityDao.querySignUpList(loginUser.getId());
	DateFormat df = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
%>
<body style="height: 80%">
	<table width="100%" height="100%">
		<tr align="center" height="10px">
			<td><font size="6"><b>已报名活动</b></font>&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="userEdit.jsp?userId=<%=loginUser.getId()%>"> 个 人 信 息 </a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/teacher/jsp/index.jsp">返回首页</a></td>
		</tr>
		<tr align="center">
			<td valign="top">
				<table border="1">
					<tr>
						<th>序号</th>
						<th>活动名称</th>
						<th>活动开始时间</th>
						<th>活动结束时间</th>
						<th>操作</th>
					</tr>
					<%
						for (int i = 0; i < actList.size(); i++) {
							Activity act = actList.get(i);
					%><tr>
						<td><%=i + 1%></td>
						<td><%=act.getActName()%></td>
						<td><%=act.getActStartDate() == null ? "" : df.format(act.getActStartDate())%>
						</td>
						<td><%=act.getActEndDate() == null ? "" : df.format(act.getActEndDate())%>
						</td>
						<td><a
							href="/teacher/jsp/activityDetail.jsp?id=<%=act.getId()%>">
								查看详情</a>&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="/teacher/cancelSign?userId=<%=loginUser.getId()%>&actId=<%=act.getId()%>">取消报名</a>
						</td>
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
