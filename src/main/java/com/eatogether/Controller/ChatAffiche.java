package com.eatogether.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatogether.model.Chat;
import com.fasterxml.jackson.databind.ObjectMapper;


public class ChatAffiche extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String source = session.getAttribute("login").toString();
		String destination = request.getParameter("destination");
		session.setAttribute("destination", destination);
		ArrayList<Chat> listechatSrc = new ArrayList<Chat>();
		ArrayList<Chat> listechatDes = new ArrayList<Chat>();
		
		PrintWriter printWriter = response.getWriter();
		
		String json ="";
		Chat chat = new Chat();
		
		try {
			chat.setNumber(String.valueOf(chat.numberofmsg(source, destination)));
			listechatSrc=chat.getdicussionSrc(source,destination);
			listechatDes=chat.getdicussionSrc(destination,source);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		listechatSrc.addAll(listechatDes);
		Collections.sort(listechatSrc,  new Sortbyid());
		ObjectMapper mapper = new ObjectMapper();
		json=mapper.writeValueAsString(listechatSrc);
		System.out.println("aa"+json);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		try {
			chat.deletechat(destination, source);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
