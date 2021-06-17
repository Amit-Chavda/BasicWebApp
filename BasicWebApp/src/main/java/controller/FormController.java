package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.UserModel;
import utils.ValidationUtil;

@WebServlet("/FormController")
public class FormController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String action = req.getParameter("action");

		if (action.equals("logout")) {
			processLogout(req, res);
		}
	}

	void processLogout(HttpServletRequest req, HttpServletResponse res) {
		try {
			HttpSession session = req.getSession();
			session.setAttribute("email", null);
			session.setAttribute("username", null);
			session.setAttribute("isLoggedin", false);
			res.sendRedirect("index.jsp");
		} catch (IOException e) {
			System.out.print(e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
