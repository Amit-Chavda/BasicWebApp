package utils;

import java.util.ArrayList;

import model.ComplainModel;
import model.FeedbackModel;
import model.UserModel;

public class ValidationUtil {

	public static ArrayList<String> validateRegisterUser(UserModel user) {

		ArrayList<String> errors = new ArrayList<>();

		if (user.getUserName() == null || "".equals(user.getUserName()) || user.getUserName().length() < 4) {
			errors.add("Username length is too short!");
		}
		if (user.getEmail() == null || "".equals(user.getEmail()) || !user.getEmail().contains("@")
				|| !user.getEmail().contains(".com") || !user.getEmail().contains("gmail")) {
			errors.add("Invalid email address!");
		}
		if (user.getPassword() == null || "".equals(user.getPassword()) || user.getPassword().length() < 8) {
			errors.add("Minimun password length is eight!");
		}
		return errors;
	}

	public static ArrayList<String> validateLoginUser(UserModel user) {

		ArrayList<String> errors = new ArrayList<>();

		if (user.getEmail() == null || "".equals(user.getEmail()) || !user.getEmail().contains("@")
				|| !user.getEmail().contains(".com") || !user.getEmail().contains("gmail")) {
			errors.add("Invalid email address!");
		}
		if (user.getPassword() == null || "".equals(user.getPassword()) || user.getPassword().length() < 8) {
			errors.add("Minimun password length is eight!");
		}

		return errors;
	}

	public static ArrayList<String> validateUserProfile(UserModel user) {

		ArrayList<String> errors = new ArrayList<>();
		if (user.getUserName() == null || "".equals(user.getUserName()) || user.getUserName().length() < 4) {
			errors.add("Username length is too short!");
		}
		if (user.getEmail() == null || "".equals(user.getEmail()) || !user.getEmail().contains("@")
				|| !user.getEmail().contains(".com") || !user.getEmail().contains("gmail")) {
			errors.add("Invalid email address!");
		}
		return errors;
	}

	public static ArrayList<String> validate(ComplainModel complain) {

		ArrayList<String> errors = new ArrayList<>();
		if (complain.getName() == null || "".equals(complain.getName()) || complain.getName().length() < 4) {
			errors.add("Name is too short!");
		}
		if (complain.getEmail() == null || "".equals(complain.getEmail()) || !complain.getEmail().contains("@")
				|| !complain.getEmail().contains(".com") || !complain.getEmail().contains("gmail")) {
			errors.add("Invalid email address!");
		}
		if (complain.getSubject() == null || "".equals(complain.getSubject()) || complain.getSubject().length() < 10) {
			errors.add("Too few words in subject!");
		}

		if (complain.getMessage() == null || "".equals(complain.getMessage()) || complain.getMessage().length() < 20) {
			errors.add("Too few words to describe complain!");
		}

		return errors;
	}

	public static ArrayList<String> validate(FeedbackModel fb) {

		ArrayList<String> errors = new ArrayList<>();
		if (fb.getName() == null || "".equals(fb.getName()) || fb.getName().length() < 4) {
			errors.add("Name is too short!");
		}
		if (fb.getEmail() == null || "".equals(fb.getEmail()) || !fb.getEmail().contains("@")
				|| !fb.getEmail().contains(".com") || !fb.getEmail().contains("gmail")) {
			errors.add("Invalid email address!");
		}
		if (fb.getMessage() == null || "".equals(fb.getMessage()) || fb.getMessage().length() < 20) {
			errors.add("Message is too short!");
		}

		return errors;
	}
}
