package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.ComplainModel;
import model.UserModel;
import utils.DatabaseManager;
import utils.Encryptor;

public class UserDAO {
	DatabaseManager dbm;
	Connection conn;

	public UserDAO() {
		dbm = new DatabaseManager();
		conn = dbm.getConnection();
	}

	public boolean insertUser(UserModel user) {
		String sql = "INSERT INTO users(username,email,password) VALUES(?,?,?)";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getEmail());
			user.setPassword(new Encryptor().encrypt(user.getPassword()));
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.executeUpdate();
			//System.out.println("Data inserted successfully...");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public UserModel getByEmail(String email) {
		UserModel user = new UserModel();

		Statement statement;
		ResultSet results;
		try {
			statement = conn.createStatement();
			results = statement.executeQuery("SELECT * FROM users where email=\"" + email + "\"");

			if (results.next()) {
				user.setUserName(results.getString("username"));
				user.setEmail(results.getString("email"));
				user.setPassword(new Encryptor().decrypt(results.getString("password")));
				user.setId(results.getString("id"));
				results.close();
				return user;
			} else {
				return null;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	public UserModel getById(String id) {
		UserModel user = new UserModel();

		Statement statement;
		ResultSet results;
		try {
			statement = conn.createStatement();
			results = statement.executeQuery("SELECT * FROM users where id=\"" + id + "\"");
			while (results.next()) {
				user.setUserName(results.getString("username"));
				user.setEmail(results.getString("email"));
				user.setPassword(new Encryptor().decrypt(results.getString("password")));
				user.setId(results.getString("id"));
				results.close();
				return user;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return user;
	}

	public void updateUser(UserModel user) {

		String sql = "UPDATE users SET username=?,email=? where id=\"" + user.getId() + "\"";
		try {
			PreparedStatement preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, user.getUserName());
			preparedStatement.setString(2, user.getEmail());
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
