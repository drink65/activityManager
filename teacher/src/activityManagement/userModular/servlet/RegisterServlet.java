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

public class RegisterServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		String nickname = req.getParameter("name");
		String sex = req.getParameter("sex");
		String birthday = req.getParameter("birthday");
		String phoneNum = req.getParameter("phoneNum");

		UserDao userDao = new UserDao();
		User user = userDao.queryByUserName(userName);
		if (user != null) {
			req.getRequestDispatcher("/html/userIsExists.html").forward(req, resp);
			return;
		}

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		user = new User();
		user.setUserName(userName);
		user.setPassword(password);
		user.setNickname(nickname);
		user.setRegisterDate(new Date());
		user.setSex(sex);
		try {
			user.setBirthday(df.parse(birthday));
		} catch (ParseException e) {

			e.printStackTrace();
		}
		user.setPhoneNum(phoneNum);

		Boolean isSuccess = userDao.save(user);
		if (isSuccess) {
			req.getRequestDispatcher("/html/registerSuccess.html").forward(req, resp);
		} else {
			req.getRequestDispatcher("/html/registerFail.html").forward(req, resp);
		}
	}
}
