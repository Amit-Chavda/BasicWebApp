package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ComplainDAO;
import dao.FeedbackDAO;
import model.ComplainModel;
import model.FeedbackModel;
import utils.ValidationUtil;

@WebServlet("/FeedbackController")
public class FeedbackController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String message = req.getParameter("message");

		FeedbackModel fb = new FeedbackModel();
		fb.setEmail(email);
		fb.setMessage(message);
		fb.setName(name);

		ArrayList<String> errorList = ValidationUtil.validate(fb);

		if (errorList.size() != 0) {
			try {

				req.setAttribute("errorList", errorList);
				req.getRequestDispatcher("feedback.jsp").forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			FeedbackDAO dao = new FeedbackDAO();
			dao.saveFeedback(fb);
			req.setAttribute("successMsg", "Your feedback is saved!");
			req.getRequestDispatcher("feedback.jsp").forward(req, res);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
