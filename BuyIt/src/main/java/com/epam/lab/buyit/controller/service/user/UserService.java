package com.epam.lab.buyit.controller.service.user;

import com.epam.lab.buyit.controller.service.GenericService;
import com.epam.lab.buyit.model.User;

public interface UserService extends GenericService<User> {
	
	boolean checkLogin(String login);
	
	User getUser(String login, String password);
}