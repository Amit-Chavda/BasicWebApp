package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.ComplainModel;
import model.FeedbackModel;
import utils.DatabaseManager;

public class FeedbackDAO {
	DatabaseManager dbm;
	Connection conn;

	public FeedbackDAO() {
		dbm = new DatabaseManager();
		conn = dbm.getConnection();
	}

	public boolean saveFeedback(FeedbackModel feedback) {
		String sql = "INSERT INTO feedback(name,email,message) VALUES(?,?,?)";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, feedback.getName());
			preparedStatement.setString(2, feedback.getEmail());
			preparedStatement.setString(3, feedback.getMessage());
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public FeedbackModel getByEmail(String email) {
		FeedbackModel feedback = new FeedbackModel();

		Statement statement;
		ResultSet results;
		try {
			statement = conn.createStatement();
			results = statement.executeQuery("SELECT * FROM feedback where email=\"" + email + "\"");

			while (results.next()) {
				feedback.setName(results.getString("name"));
				feedback.setEmail(results.getString("email"));
				feedback.setMessage(results.getString("message"));
				feedback.setId(results.getString("id"));
				results.close();
				return feedback;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return feedback;
	}

	public FeedbackModel getById(String id) {
		FeedbackModel feedback = new FeedbackModel();

		Statement statement;
		ResultSet results;
		try {
			statement = conn.createStatement();
			results = statement.executeQuery("SELECT * FROM feedback where id=\"" + id + "\"");
			while (results.next()) {
				feedback.setName(results.getString("name"));
				feedback.setEmail(results.getString("email"));
				feedback.setMessage(results.getString("message"));
				feedback.setId(results.getString("id"));
				results.close();
				return feedback;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return feedback;
	}

	public void updateFeedback(FeedbackModel feedback) {

		String sql = "UPDATE feedbacks SET name=?,email=?,message=? where id=\"" + feedback.getId() + "\"";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, feedback.getName());
			preparedStatement.setString(2, feedback.getEmail());
			preparedStatement.setString(3, feedback.getMessage());
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			conn.close();
			dbm.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
