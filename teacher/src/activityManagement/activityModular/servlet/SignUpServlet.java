package activityManagement.activityModular.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import activityManagement.activityModular.dao.ActivityDao;

public class SignUpServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String userId = req.getParameter("userId");
		String actId = req.getParameter("actId");

		if (userId == null || "".equals(userId) || actId == null || "".equals(actId)) {
			req.getRequestDispatcher("/teacher/html/fail.html").forward(req, resp);
		}
		ActivityDao activityDao = new ActivityDao();

		Boolean isSuccess = activityDao.signUp(Integer.parseInt(userId), Integer.parseInt(actId));
		if (isSuccess) {
			resp.sendRedirect("/teacher/jsp/activityDetail.jsp?id=" + actId);
		} else {
			req.getRequestDispatcher("/teacher/html/fail.html").forward(req, resp);
		}
	}
}
