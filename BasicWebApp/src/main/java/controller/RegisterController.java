package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.UserModel;
import utils.ValidationUtil;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processRegister(req, res);

	}

	void processRegister(HttpServletRequest req, HttpServletResponse res) {
		String userName = req.getParameter("username");
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		UserModel user = new UserModel();
		user.setUserName(userName);
		user.setEmail(email);
		user.setPassword(password);

		if (ValidationUtil.validateRegisterUser(user).size() != 0) {
			try {
				
				ArrayList<String> erList = ValidationUtil.validateRegisterUser(user);
				req.setAttribute("errorList", erList);
				req.getRequestDispatcher("register.jsp").forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			UserDAO dao = new UserDAO();
			dao.insertUser(user);
			HttpSession session = req.getSession();
			session.setAttribute("isLoggedin", true);
			session.setAttribute("email", email);
			session.setAttribute("username", user.getUserName());
			try {
				res.sendRedirect("home.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
