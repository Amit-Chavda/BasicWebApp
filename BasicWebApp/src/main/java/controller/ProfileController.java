package controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PrintWriter out;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		out = res.getWriter();

		String action = req.getParameter("action");

		if (action.equals("change")) {
			HttpSession session = req.getSession(false);
			UserDAO dao = new UserDAO();
			UserModel user = dao.getByEmail(session.getAttribute("email").toString());
			user = dao.getById(user.getId());
			req.setAttribute("user", user);
			req.getRequestDispatcher("change-profile.jsp").forward(req, res);

		} else if (action.equals("update")) {
			String id = req.getParameter("id");
			UserModel user = new UserModel();
			user.setUserName(req.getParameter("username"));
			user.setEmail(req.getParameter("email"));

			if (ValidationUtil.validateUserProfile(user).size() != 0) {
				ArrayList<String> erList = ValidationUtil.validateUserProfile(user);
				req.setAttribute("errorList", erList);
				req.setAttribute("user", user);
				req.getRequestDispatcher("change-profile.jsp").forward(req, res);
			} else {

				UserDAO dao = new UserDAO();
				dao.updateUser(user);
				req.setAttribute("user", user);
				req.getRequestDispatcher("profile.jsp").forward(req, res);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
