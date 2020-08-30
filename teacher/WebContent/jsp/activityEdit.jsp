<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="activityManagement.activityModular.dao.ActivityDao,
activityManagement.activityModular.entity.Activity, java.util.List,java.text.DateFormat,java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活动信息</title>
</head>
<body style="height: 80%">
	<%
		String actId = request.getParameter("id");
		Activity act = null;
		if (actId == null) {
			act = new Activity();
		} else {
			ActivityDao activityDao = new ActivityDao();
			act = activityDao.queryById(Integer.parseInt(actId));
		}
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	%>
	<table width="100%" height="100%">
		<tr align="center">

			<td valign="center">
				<table>
					<form id="actForm" action="/teacher/activityEdit" method="post"
						enctype="multipart/form-data">
						<input type="hidden" id="actId" name="actId"
							value="<%=act.getId() != null ? act.getId() : ""%>" />
						<tr>

							<td><label>活动图片：</label></td>
							<td>
								<%
									if (act.getActPicture() != null && !"".equals(act.getActPicture())) {
								%>
								<img alt="" src="<%=act.getActPicture()%>" width="100"> <%
 	}
 %>
								<input type="file" name="actPicture" id="actPicture" />

							</td>
						</tr>
						<tr>

							<td><label>活动名称：</label></td>
							<td><input type="text" name="actName" id="actName"
								value="<%=act.getActName() != null ? act.getActName() : ""%>" /></td>
						</tr>
						<tr>

							<td><label>主办方：</label></td>
							<td><input type="text" name="sponsor" id="sponsor"
								value="<%=act.getSponsor() != null ? act.getSponsor() : ""%>">
							</td>
						</tr>
						<tr>

							<td><label>协办方：</label></td>
							<td><input type="text" name="coOrganizer" id="coOrganizer"
								value="<%=act.getCoOrganizer() != null ? act.getCoOrganizer() : ""%>">

							</td>
						</tr>
						<tr>

							<td><label>报名开始时间：</label></td>
							<td><input type="date" name="signUpStart" id="signUpStart"
								value="<%=act.getSignUpStartDate() != null ? df.format(act.getSignUpStartDate()) : ""%>">
							</td>
						</tr>
						<tr>

							<td><label>报名结束时间：</label></td>
							<td><input type="date" name="signUpEnd" id="signUpEnd"
								value="<%=act.getSignUpEndDate() != null ? df.format(act.getSignUpEndDate()) : ""%>">
							</td>
						</tr>
						<tr>

							<td><label>活动开始时间：</label></td>
							<td><input type="date" name="actStart" id="actStart"
								value="<%=act.getActStartDate() != null ? df.format(act.getActStartDate()) : ""%>">
							</td>
						</tr>
						<tr>

							<td><label>活动结束时间：</label></td>
							<td><input type="date" name="actEnd" id="actEnd"
								value="<%=act.getActEndDate() != null ? df.format(act.getActEndDate()) : ""%>">
							</td>
						</tr>
						<tr>

							<td><label>活动内容：</label></td>




							<td><textarea rows="5" form="actForm" name="actContent"
									id="actContent"><%=act.getActContent() != null ? act.getActContent() : ""%></textarea>
							</td>
						</tr>
						<tr>





							<td align="center"><input type="submit" value="确	定" /></td>
							<td align="center"><input type="button" value=" 返	回 "
								onclick="javascript:history.go(-1);" /></td>

						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
