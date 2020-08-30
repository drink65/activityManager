<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="activityManagement.userModular.dao.UserDao,
activityManagement.userModular.entity.User, java.util.List,java.text.DateFormat,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户信息</title>
</head>
<body style="height: 80%">
	<%
		String userId = request.getParameter("userId");
		UserDao userDao = new UserDao();
		User user = userDao.queryByUserId(Integer.parseInt(userId));
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<table width="100%" height="100%">
		<tr align="center">
			<td valign="center">
				<table>
					<form action="/teacher/userEdit" method="post">
						<input type="hidden" id="userId" name="userId"
							value="<%=user.getId()%>" />
						<tr>
							<td><label>用户名：</label></td>
							<td><input type="text" name="userName" id="userName"
								value="<%=user.getUserName()%>" /></td>

						</tr>
						<tr>

							<td><label>密码：</label></td>
							<td><input type="password" name="password" id="password"
								value="<%=user.getPassword()%>"></td>
						</tr>
						<tr>

							<td><label>姓名：</label></td>
							<td><input type="text" name="name" id="name"
								value="<%=user.getNickname()%>"></td>
						</tr>
						<tr>

							<td><label>性别：</label></td>
							<td><select name="sex" id="sex">
									<option value="1"
										<%if (user.getSex() != null && user.getSex().equals("1")) {%>
										selected <%}%>>男</option>
									<option value="2"
										<%if (user.getSex() != null && user.getSex().equals("2")) {%>
										selected <%}%>>女</option>
							</select></td>
						</tr>
						<tr>

							<td><label>生日：</label></td>
							<td><input type="date" name="birthday" id="birthday"
								value="<%=user.getBirthday() != null ? df.format(user.getBirthday()) : ""%>">
							</td>
						</tr>
						<tr>

							<td><label>手机号码：</label></td>
							<td><input type="text" name="phoneNum" id="phoneNum"
								value="<%=user.getPhoneNum()%>"></td>
						</tr>
						<tr>

							<td><label>注册时间：</label></td>
							<td><label><%=user.getRegisterDate() != null ? df.format(user.getRegisterDate()) : ""%></label>
							</td>
						</tr>
						<tr>

							<td align="center"><input type="submit" value="确定" /></td>
							<td align="center"><input type="button" value=" 返回 "
								onclick="javascript:history.go(-1);" /></td>
						</tr>

					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
