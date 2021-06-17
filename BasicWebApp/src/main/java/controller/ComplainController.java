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

import dao.ComplainDAO;
import model.ComplainModel;
import utils.ValidationUtil;

@WebServlet("/ComplainController")
public class ComplainController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	PrintWriter out;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		out = res.getWriter();

		String action = req.getParameter("action");
		if (action.equals("raise")) {
			processComplain(req, res);
			req.setAttribute("msg", "Complain raised successfully!");
			req.getRequestDispatcher("complain.jsp").forward(req, res);
		} else if (action.equals("view")) {
			processViewComplains(req, res);
		} else if (action.equals("delete")) {
			processDeleteComplain(req, res);
		} else if (action.equals("edit")) {
			processEditComplain(req, res);
		} else if (action.equals("update")) {
			processUpdateComplain(req, res);
		}
	}

	private void processUpdateComplain(HttpServletRequest req, HttpServletResponse res) {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String subject = req.getParameter("subject");
		String message = req.getParameter("message");

		ComplainModel cm = new ComplainModel();
		cm.setEmail(email);
		cm.setMessage(message);
		cm.setName(name);
		cm.setSubject(subject);

		ArrayList<String> errorList = (ArrayList<String>) ValidationUtil.validate(cm);

		if (errorList.size() != 0) {
			req.setAttribute("errorList", errorList);
			processViewComplains(req, res);
		} else {
			String id = req.getParameter("id");
			ComplainDAO dao = new ComplainDAO();
			dao.editComaplain(id, cm);
			processViewComplains(req, res);
		}

	}

	private void processEditComplain(HttpServletRequest req, HttpServletResponse res) {
		fillComplainField(req, res);
	}

	private void fillComplainField(HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		ComplainDAO dao = new ComplainDAO();
		ComplainModel complain = dao.getComaplaintsById(id);
		try {
			req.setAttribute("isEdit", true);
			req.setAttribute("complain", complain);
			req.getRequestDispatcher("complain.jsp").forward(req, res);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void processDeleteComplain(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession(false);
		String email = session.getAttribute("email").toString();

		String id = req.getParameter("id");
		ComplainDAO dao = new ComplainDAO();
		dao.deleteComaplainById(id);

		ArrayList<ComplainModel> complainList = new ArrayList<>();
		complainList = dao.getComaplaintsByEmail(email);
		try {
			req.setAttribute("complaints", complainList);
			req.getRequestDispatcher("complain.jsp").forward(req, res);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void processComplain(HttpServletRequest req, HttpServletResponse res) {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String subject = req.getParameter("subject");
		String message = req.getParameter("message");

		ComplainModel cm = new ComplainModel();
		cm.setEmail(email);
		cm.setMessage(message);
		cm.setName(name);
		cm.setSubject(subject);

		ArrayList<String> errorList = (ArrayList<String>) ValidationUtil.validate(cm);

		if (errorList.size() != 0) {
			try {

				req.setAttribute("errorList", errorList);
				req.getRequestDispatcher("complain.jsp").forward(req, res);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		} else {
			ComplainDAO dao = new ComplainDAO();
			dao.insertComlplain(cm);
		}

	}

	private void processViewComplains(HttpServletRequest req, HttpServletResponse res) {

		HttpSession session = req.getSession(false);
		String email = session.getAttribute("email").toString();

		ArrayList<ComplainModel> complainList = new ArrayList<>();
		ComplainDAO dao = new ComplainDAO();
		complainList = dao.getComaplaintsByEmail(email);

		try {
			req.setAttribute("complaints", complainList);
			req.getRequestDispatcher("complain.jsp").forward(req, res);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
