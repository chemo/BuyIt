package com.epam.lab.buyit.controller.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class ParticipateInOwnAuctionFilter implements Filter {

	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		if(httpRequest.getAttribute("participateInOwnAuction") != null)
		{
			httpRequest.setAttribute("message", httpRequest.getAttribute("participateInOwnAuction"));
			httpRequest.setAttribute("alert", "block");
			request.setAttribute("messageHeader", "Warning");
			httpRequest.getRequestDispatcher("message_page").forward(httpRequest, response);
		} else chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
