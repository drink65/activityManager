package activityManagement.userModular.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import activityManagement.userModular.dao.UserDao;
import activityManagement.userModular.entity.User;

public class LoginServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		User user = checkLogin(userName, password);
		if (user != null) {
			req.getSession().setAttribute("loginUser", user);
			if ("admin".equals(user.getUserName())) {
				resp.sendRedirect("/teacher/jsp/userManagement.jsp");
			} else {
				req.getRequestDispatcher("/jsp/index.jsp").forward(req, resp);
			}
		} else {
			req.getRequestDispatcher("/jsp/loginFail.jsp").forward(req, resp);
		}
	}

	private User checkLogin(String userName, String password) {

		if (userName == null || password == null) {
			return null;
		}
		UserDao userDao = new UserDao();
		User user = userDao.queryByUserName(userName);
		if (user == null) {
			return null;
		}

		String pw = user.getPassword();
		if (password.equals(pw)) {

			return user;
		} else {
			return null;
		}
	}
}
