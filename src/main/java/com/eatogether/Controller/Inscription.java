package com.eatogether.Controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.eatogether.model.User;

public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

   
public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
        
    }
    
		public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
			HttpSession session = request.getSession();
		/*	if ("POST".equalsIgnoreCase(request.getMethod()))
			{
				if (request.getParameter("valider") != null
						|| "POST".equalsIgnoreCase(request.getMethod()))
				
				{ */ 
					//String login = request.getParameter("pseudo");
					String mp = request.getParameter("password");
					//String date_naissance= request.getParameter("date_naissance");
					String mail = request.getParameter("email");
					String name = request.getParameter("nom");
					String prename = request.getParameter("prenom");
					String date_naiss=request.getParameter("date");
					String pseudo = request.getParameter("pseudo");

					User P = new User(mail, mp, name, prename,pseudo);
					try {
						P.insertUser1(mail, mp, name, prename,date_naiss,pseudo);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					User u1 = new User(mail, mp);

					try {

						session.setAttribute("mp", mp);
						session.setAttribute("mail", mail);

						User User = u1.getUser(mail);
						request.setAttribute("User", User);
						this.getServletContext()
								.getRequestDispatcher("/login.jsp")
								.forward(request, response);

						// response.sendRedirect("accueil_patient.jsp");

					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			
		}
	


