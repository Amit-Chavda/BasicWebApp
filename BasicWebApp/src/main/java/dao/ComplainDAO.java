package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.ComplainModel;
import utils.DatabaseManager;

public class ComplainDAO {

	DatabaseManager dbm;
	Connection conn;

	public ComplainDAO() {
		dbm = new DatabaseManager();
		conn = dbm.getConnection();
	}

	public boolean insertComlplain(ComplainModel complaint) {
		String sql = "INSERT INTO complaints(name,email,subject,message) VALUES(?,?,?,?)";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, complaint.getName());
			preparedStatement.setString(2, complaint.getEmail());
			preparedStatement.setString(3, complaint.getSubject());
			preparedStatement.setString(4, complaint.getMessage());
			preparedStatement.executeUpdate();
			return true;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public ArrayList<ComplainModel> getComaplaintsByEmail(String email) {
		ArrayList<ComplainModel> list = new ArrayList<>();
		Statement statement;
		ResultSet results;
		try {
			statement = conn.createStatement();
			results = statement.executeQuery("SELECT * FROM complaints where email=\"" + email + "\"");

			while (results.next()) {
				ComplainModel complain = new ComplainModel();
				complain.setId(results.getString("id"));
				complain.setName(results.getString("name"));
				complain.setEmail(results.getString("email"));
				complain.setSubject(results.getString("subject"));
				complain.setMessage(results.getString("message"));
				list.add(complain);
			}
			results.close();
			return list;

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public ComplainModel getComaplaintsById(String id) {
		ComplainModel complain = null;
		Statement statement;
		ResultSet results;
		try {
			statement = conn.createStatement();
			results = statement.executeQuery("SELECT * FROM complaints where id=\"" + id + "\"");

			while (results.next()) {
				complain = new ComplainModel();
				complain.setId(results.getString("id"));
				complain.setName(results.getString("name"));
				complain.setEmail(results.getString("email"));
				complain.setSubject(results.getString("subject"));
				complain.setMessage(results.getString("message"));
				return complain;
			}
			results.close();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return complain;
	}

	public void deleteComaplainById(String id) {
		Statement statement;
		try {
			statement = conn.createStatement();
			statement.executeUpdate("DELETE FROM complaints where id=\"" + id + "\"");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public void close() {
		try {
			conn.close();
			dbm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void editComaplain(String id, ComplainModel complain) {

		String sql = "UPDATE complaints SET name=?,email=?,subject=?,message=? where id=\"" + id + "\"";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, complain.getName());
			preparedStatement.setString(2, complain.getEmail());
			preparedStatement.setString(3, complain.getSubject());
			preparedStatement.setString(4, complain.getMessage());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
