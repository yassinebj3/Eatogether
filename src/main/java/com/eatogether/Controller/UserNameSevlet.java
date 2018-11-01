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


public class UserNameSevlet extends HttpServlet{

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		System.out.println("je suis la");
		response.setContentType("text/html");
		ArrayList a = new ArrayList();
		ArrayList<Chat> listechat = new ArrayList<Chat>();
		//String destination = request.getParameter("destination");
		PrintWriter printWriter = response.getWriter();
		HttpSession httpSession = request.getSession();
		System.out.println("test"+httpSession.getAttribute("destination").toString());
		String json ="";
		Chat chat = new Chat();
		try {
			listechat=chat.getdicussion(httpSession.getAttribute("login").toString());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ObjectMapper mapper = new ObjectMapper();
		json=mapper.writeValueAsString(listechat);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		
	}
	
}
