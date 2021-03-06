package com.epam.lab.buyit.controller.dao.utils.transformers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.log4j.Logger;

import com.epam.lab.buyit.model.Status;
import com.epam.lab.buyit.model.User;

public class UserTransformer implements TransformerInterface<User> {

	private static final Logger LOGGER = Logger
			.getLogger(UserTransformer.class);
	private static final String CREATE_STATEMENT = "INSERT INTO users"
			+ "(role, first_name, last_name, login, password, avatar, ban) VALUES(?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE_STATEMENT = "UPDATE users SET "
			+ "role=?, first_name=?, last_name=?, login=?, password=?, avatar=?, ban=? WHERE id_user=?";

	@Override
	public PreparedStatement fromObjectToCreatePS(User elem,
			Connection connection) {
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(CREATE_STATEMENT,
					Statement.RETURN_GENERATED_KEYS);
			statement.setBoolean(1, elem.getRole());
			statement.setString(2, elem.getFirstName());
			statement.setString(3, elem.getLastName());
			statement.setString(4, elem.getLogin());
			statement.setString(5, elem.getPassword());
			statement.setString(6, elem.getAvatar());
			statement.setBoolean(7, Status.getTypeByRole(elem.getBan()));
		} catch (SQLException e) {
			LOGGER.error(e);
		}
		return statement;
	}

	@Override
	public PreparedStatement fromObjectToUpdatePS(User elem,
			Connection connection) {
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(UPDATE_STATEMENT,
					Statement.RETURN_GENERATED_KEYS);
			statement.setBoolean(1, elem.getRole());
			statement.setString(2, elem.getFirstName());
			statement.setString(3, elem.getLastName());
			statement.setString(4, elem.getLogin());
			statement.setString(5, elem.getPassword());
			statement.setString(6, elem.getAvatar());
			statement.setBoolean(7, Status.getTypeByRole(elem.getBan()));
			statement.setInt(8, elem.getIdUser());
		} catch (SQLException e) {
			LOGGER.error(e);
		}
		return statement;
	}

	@Override
	public User fromRSToObject(ResultSet resultSet) {
		User user = new User();
		try {
			user.setIdUser(resultSet.getInt("id_user"));
			user.setRole(resultSet.getBoolean("role"));
			user.setFirstName(resultSet.getString("first_name"));
			user.setLastName(resultSet.getString("last_name"));
			user.setLogin(resultSet.getString("login"));
			user.setPassword(resultSet.getString("password"));
			user.setAvatar(resultSet.getString("avatar"));
			user.setBan(resultSet.getBoolean("ban"));
		} catch (SQLException e) {
			LOGGER.error(e);
		}
		return user;
	}

}
