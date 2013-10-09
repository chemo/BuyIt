package com.epam.lab.buyit.controller.dao.address;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.epam.lab.buyit.controller.dao.utils.DAOUtils;
import com.epam.lab.buyit.controller.dao.utils.connection.ConnectionManager;
import com.epam.lab.buyit.controller.dao.utils.transformers.AddressTransformer;
import com.epam.lab.buyit.model.Address;

public class AddressDAO implements AddressDAOInterface {
	private static final Logger LOGGER = Logger.getLogger(AddressDAO.class);
	private final static String GET_BY_ID = "SELECT * FROM address WHERE contacts_id = ?";
	private final static String GET_ALL_ADDRESS = "SELECT * FROM address";
	private final static String DELETE_STATEMENT = "DELETE FROM address WHERE id_address = ?";
	private AddressTransformer transformer;

	public AddressDAO() {
		transformer = new AddressTransformer();
	}

	@Override
	public int createElement(Address elem) {
		Connection connection = ConnectionManager.getConnection();
		PreparedStatement statement = null;
		ResultSet generatedKeys = null;
		try {
			statement = transformer.fromObjectToCreatePS(elem, connection);
			if (statement != null) {
				statement.executeUpdate();
				generatedKeys = statement.getGeneratedKeys();
				generatedKeys.next();
				return generatedKeys.getInt(1);
			}
		} catch (SQLException e) {
			LOGGER.error(e);
		} finally {
			DAOUtils.close(generatedKeys, statement, connection);
		}
		return 0;
	}

	@Override
	public Address getElementById(int id) {
		Address currentAddress = null;
		Connection connection = ConnectionManager.getConnection();
		PreparedStatement statement = null;
		ResultSet result = null;
		try {
			statement = connection.prepareStatement(GET_BY_ID);
			statement.setInt(1, id);
			result = statement.executeQuery();
			if (result.next()) {
				currentAddress = transformer.fromRSToObject(result);
				return currentAddress;
			}
		} catch (SQLException e) {
			LOGGER.error(e);
		} finally {
			DAOUtils.close(result, statement, connection);
		}
		return currentAddress;
	}

	@Override
	public void updateElement(Address elem) {
		Connection connection = ConnectionManager.getConnection();
		PreparedStatement statement = null;
		try {
			statement = transformer.fromObjectToUpdatePS(elem, connection);
			if (statement != null) {
				statement.executeUpdate();
			}
		} catch (SQLException e) {
			LOGGER.error(e);
		} finally {
			DAOUtils.close(statement, connection);
		}

	}

	@Override
	public void deleteElementById(int id) {
		Connection connection = ConnectionManager.getConnection();
		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(DELETE_STATEMENT);
			statement.setInt(1, id);
			statement.executeUpdate();
		} catch(SQLException e) {
			LOGGER.error(e);
		} finally {
			DAOUtils.close(statement, connection);
		}
	}

	@Override
	public List<Address> getAllAddress() {
		List<Address> address = new ArrayList<Address>();
		Connection connection = ConnectionManager.getConnection();
		PreparedStatement statement = null;
		ResultSet result = null;
		try {
			statement = connection.prepareStatement(GET_ALL_ADDRESS);
			result = statement.executeQuery();
			while(result.next()) {
				Address currentAddress = transformer.fromRSToObject(result);
				address.add(currentAddress);
			}
		} catch (SQLException e) {
			LOGGER.error(e);
		} finally {
			DAOUtils.close(result, statement, connection);
		}
		return address;
	}

}