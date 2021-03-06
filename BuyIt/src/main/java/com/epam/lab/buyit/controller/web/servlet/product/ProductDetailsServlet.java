package com.epam.lab.buyit.controller.web.servlet.product;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.epam.lab.buyit.controller.service.category.CategoryServiceImpl;
import com.epam.lab.buyit.controller.service.product.ProductServiceImpl;
import com.epam.lab.buyit.controller.service.user.UserServiceImpl;
import com.epam.lab.buyit.controller.utils.comparator.BidHistoryComparator;
import com.epam.lab.buyit.model.Category;
import com.epam.lab.buyit.model.Product;
import com.epam.lab.buyit.model.User;

public class ProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductServiceImpl productService = null;
	private UserServiceImpl userService;
	private CategoryServiceImpl categoryService;

	@Override
	public void init() throws ServletException {
		productService = new ProductServiceImpl();
		userService = new UserServiceImpl();
		categoryService = new CategoryServiceImpl();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Product product = productService.getItemById(id);
		if (product != null) {
			List<User> userlist = userService.getWhoMakeBidInAuction(product
					.getAuction().getIdAuction());
			User seller = userService.getItemById(product.getUserId());
			Category category = categoryService.getBySubCategoryId(product.getSubCategoryId());

			java.util.Collections.sort(userlist, new BidHistoryComparator());

			request.setAttribute("userList", userlist);
			request.setAttribute("product", product);
			request.setAttribute("category", category);
			request.setAttribute("categoryId", category.getIdCategory());
			request.setAttribute("seller", seller);

			request.getRequestDispatcher("productPage").forward(request, response);
		} else {
			sendToMessagePage(request, response);
		}
	}
	
	private void sendToMessagePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("message", "Sorry, this product does not exist");
		request.setAttribute("messageHeader", "Warning");
		request.setAttribute("alert", "block");
		request.getRequestDispatcher("message_page").forward(request, response);
	}
}
