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

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		processLogin(req, res);
	}

	void processLogin(HttpServletRequest req, HttpServletResponse res) {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		UserModel currentUser = new UserModel();
		currentUser.setEmail(email);
		currentUser.setPassword(password);

		if (ValidationUtil.validateLoginUser(currentUser).size() != 0) {
			ArrayList<String> erList = ValidationUtil.validateLoginUser(currentUser);
			req.setAttribute("errorList", erList);

			try {

				req.getRequestDispatcher("index.jsp").forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}

		UserModel user = new UserDAO().getByEmail(email);

		if (user == null) {
			ArrayList<String> errorList = new ArrayList<String>();
			errorList.add("User does not exists!");
			req.setAttribute("errorList", errorList);
			try {
				req.getRequestDispatcher("index.jsp").include(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			if (user.getEmail().toString().equals(email) && user.getPassword().toString().equals(password.toString())) {
				try {

					req.setAttribute("userInfo", user);

					HttpSession session = req.getSession();
					session.setAttribute("isLoggedin", true);
					session.setAttribute("email", email);
					session.setAttribute("username", user.getUserName());
					req.getRequestDispatcher("home.jsp").forward(req, res);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			} else {
				try {
					req.setAttribute("errorMsg", "Email or password incorrect!");
					req.getRequestDispatcher("index.jsp").include(req, res);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
