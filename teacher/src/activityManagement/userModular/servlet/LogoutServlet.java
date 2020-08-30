package activityManagement.userModular.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import activityManagement.userModular.dao.UserDao;
import activityManagement.userModular.entity.User;

public class LogoutServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            response.sendRedirect("/teacher/html/login.html");
    }
}
