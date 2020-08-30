<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="activityManagement.userModular.dao.UserDao,
activityManagement.userModular.entity.User, java.util.List,java.text.DateFormat,java.text.SimpleDateFormat"%>
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
<title>用户管理</title>
</head>
<body style="height: 80%">

	<table width="100%" height="100%">
		<tr align="center" height="10px">
			<td><font size="6"><b>用户管理</b></font>&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="activityManagement.jsp"> 活 动 管 理 </a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="/teacher/jsp/index.jsp">返回首页</a></td>
		</tr>
		<tr align="center">
			<td valign="top">
				<table border="1">
				<table style="width:600px; margin:44px auto" class="table table-striped table-bordered table-hover  table-condensed" align='center' border='1' cellspacing='0'>
					<tr>
						<th>序号</th>
						<th>用户名</th>
						<th>姓名</th>
						<th>性别</th>
						<th>生日</th>
						<th>手机号码</th>
						<th>注册日期</th>
						<th>操作</th>
					</tr>
					<%
						DateFormat df = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
						UserDao userDao = new UserDao();
						List<User> userList = userDao.queryAllList();
						for (int i = 0; i < userList.size(); i++) {
							User user = userList.get(i);
					%>
					<tr>
						<td><%=i + 1%></td>
						<td><%=user.getUserName()%></td>
						<td><%=user.getNickname()%></td>
						<td>
							<%
								if (user.getSex() != null) {
							%><%=user.getSex().equals("1") ? "男" : "女"%>
							<%
								}
							%>
						</td>
						<td>
							<%
								if (user.getBirthday() != null) {
							%><%=df.format(user.getBirthday())%>
							<%
								}
							%>
						</td>
						<td><%=user.getPhoneNum()%></td>
						<td>
							<%
								if (user.getRegisterDate() != null) {
							%><%=df.format(user.getRegisterDate())%>
							<%
								}
							%>
						</td>
						<td><a href="/teacher/jsp/userEdit.jsp?userId=<%=user.getId()%>">修改</a></td>
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
