package com.epam.lab.buyit.controller.web.servlet.user.message;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.epam.lab.buyit.controller.service.user.UserServiceImpl;
import com.epam.lab.buyit.controller.web.client.MessageClientWebService;
import com.epam.lab.buyit.model.Message;
import com.epam.lab.buyit.model.User;
import com.sun.jersey.api.client.ClientHandlerException;

public class UserCommentsServlet extends HttpServlet {
	private static final Logger LOGGER = Logger.getLogger(UserCommentsServlet.class);
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserServiceImpl userService = new UserServiceImpl();
		User user = (User) request.getSession().getAttribute("user");
		
		List<Message> commentsList = new ArrayList<Message>();
		try {
			commentsList = new MessageClientWebService().getMessagesByUserId(user.getIdUser());
			request.getSession().setAttribute("users", userService.getAllItemsWeek());
			request.getSession().setAttribute("userComments", commentsList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("userComments");
			dispatcher.forward(request, response);
		} catch (ClientHandlerException e) {
			LOGGER.error(e);
			request.setAttribute("message", "Sorry, message service is not available.");
			request.setAttribute("messageHeader", "Warning");
			request.setAttribute("alert", "block");
			request.getRequestDispatcher("message_page").forward(request, response);
		}
	}

}
