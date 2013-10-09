package com.epam.lab.buyit.controller.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.epam.lab.buyit.controller.service.category.CategoryServiceImpl;
import com.epam.lab.buyit.controller.web.Mook;

public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private CategoryServiceImpl categoryService;
    
    public void init() {
    	categoryService = new CategoryServiceImpl();
    }
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> cauroselImagesList = Mook.getImagesUrl();
		HttpSession session = request.getSession(true);
		session.setAttribute("categories", categoryService.getAllItems());
		session.setAttribute("carouselImages", cauroselImagesList);
		response.sendRedirect("homePage");	
			
	}

}
