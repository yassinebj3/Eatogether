package com.eatogether.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatogether.model.Chat;
import com.fasterxml.jackson.databind.ObjectMapper;


public class ChatInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int number = 0 ; 
		HttpSession session = request.getSession();
		String source = session.getAttribute("login").toString();
		String destination = request.getParameter("destination");
		String msg = request.getParameter("msg");
		
		
		Chat chat = new Chat();
		try {
			number = chat.numberofmsg(source, destination);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json = "{\"number\":\""+number+"\"}";
		System.out.println(json);
		PrintWriter printWriter = response.getWriter();		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}