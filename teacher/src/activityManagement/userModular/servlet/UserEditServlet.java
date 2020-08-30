package activityManagement.userModular.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import activityManagement.userModular.dao.UserDao;
import activityManagement.userModular.entity.User;

public class UserEditServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String userId = req.getParameter("userId");
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String nickname = req.getParameter("name");
		String sex = req.getParameter("sex");
		String birthday = req.getParameter("birthday");
		String phoneNum = req.getParameter("phoneNum");
		UserDao userDao = new UserDao();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		User user = new User();
		user.setId(Integer.parseInt(userId));
		user.setUserName(userName);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setSex(sex);
		try {
			if (birthday != null && !" ".equals(birthday)) {
				user.setBirthday(df.parse(birthday));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		user.setPhoneNum(phoneNum);
		Boolean isSuccess = userDao.update(user);
		if (isSuccess) {
			User loginUser = (User) req.getSession().getAttribute("loginUser");
			if ("admin".equals(loginUser.getUserName())) {
				resp.sendRedirect("/teacher/jsp/userManagement.jsp");
			} else {

				resp.sendRedirect("/teacher/jsp/userActivity.jsp");
			}
		} else {
			req.getRequestDispatcher("/teacher/html/registerFail.html").forward(req, resp);
		}
	}
}
