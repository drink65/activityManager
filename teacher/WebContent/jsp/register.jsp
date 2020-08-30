<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新用户注册</title>

</head>
<body style="height: 80%">
	<table width="100%" height="100%">
		<tr align="center">
			<td valign="center">
				<table>
					<form action="/teacher/register" method="post">
						<tr>
							<td><label>用户名：</label></td>
							<td><input type="text" name="userName" id="userName" /></td>
						</tr>
						<tr>

							<td><label>密码：</label></td>
							<td>
							<input type="password" name="password" id="password">
							</td>
						</tr>
						<tr>

							<td><label>姓名：</label></td>
							<td><input type="text" name="name" id="name"></td>
						</tr>
						<tr>

							<td><label>性别：</label></td>
							<td><select name="sex" id="sex">
									<option>请选择</option>
									<option value="1">男</option>
									<option value="2">女</option>
							</select></td>

						</tr>
						<tr>

							<td><label>生日：</label></td>
							<td><input type="date" name="birthday" id="birthday">


							</td>
						</tr>
						<tr>

							<td><label>手机号码：</label></td>
							<td><input type="text" name="phoneNum" id="phoneNum">
							</td>
						</tr>
						<tr>

							<td align="center"><input type="submit" value="注册" /></td>
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
