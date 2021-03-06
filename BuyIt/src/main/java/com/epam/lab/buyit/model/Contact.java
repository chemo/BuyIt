package com.epam.lab.buyit.model;

import java.io.Serializable;


public class Contact implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idContact;
	private int userId; 
	private String email;
	private String phone;
	private Address address;

	public Contact() {
		address = new Address();
	}
	
	public int getIdContact() {
		return idContact;
	}

	public Contact setIdContact(int idContacts) {
		this.idContact = idContacts;
		return this;
	}

	public String getEmail() {
		return email;
	}

	public Contact setEmail(String email) {
		this.email = email;
		return this;
	}

	public String getPhone() {
		return phone;
	}

	public Contact setPhone(String phone) {
		this.phone = phone;
		return this;
	}

	public Address getAddress() {
		return address;
	}

	public Contact setAddress(Address address) {
		this.address = address;
		return this;
	}

	@Override
	public String toString() {
		StringBuilder string = new StringBuilder();
		string.append(userId).append(" email: ").append(email)
				.append(" phone: ").append(phone);
		return string.toString();
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
