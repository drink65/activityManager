<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="activityManagement.activityModular.dao.ActivityDao,
java.util.List,java.util.Map"%>
<!DOCTYPE html>
<html style="height: 80%">
<head>
<meta charset="UTF-8">
<title>已报名名单</title>
</head>
<body style="height: 80%">
	<table width="100%" height="100%">
		<tr align="center" height="10px">
			<td><font size="6"><b>已报名名单</b></font>&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="/teacher/jsp/activityManagement.jsp">返回</a></td>
		</tr>
		<tr align="center">

			<td valign="top">
				<table border="1">
					<tr>
						<th>序号</th>
						<th>姓名</th>
						<th>手机号码</th>
						<th>报名日期</th>
					</tr>
					<%
						String actId = request.getParameter("id");
						ActivityDao activityDao = new ActivityDao();
						List<Map<String, String>> userList = activityDao.getSingUpListByActId(Integer.parseInt(actId));
						for (int i = 0; i < userList.size(); i++) {
							Map<String, String> map = userList.get(i);
					%>
					<tr>
						<td><%=i + 1%></td>
						<td><%=map.get("nickname")%></td>
						<td><%=map.get("phone_num")%></td>
						<td><%=map.get("sign_up_time")%></td>
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
