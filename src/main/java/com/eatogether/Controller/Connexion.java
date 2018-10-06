package com.eatogether.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatogether.model.User;




public class Connexion extends HttpServlet {

	private static final long serialVersionUID = 1L;
	ConnectDB db = new ConnectDB();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		
		
				String login = request.getParameter("pseudo");
				String mp = request.getParameter("password");
				

				User utilisateur = new User(login,mp);
				
			

				
						try {
							if (utilisateur.isRegistred(mp, login)) {
								session.setAttribute("mp", mp); // creation d'une
																// variable de
																// session
								session.setAttribute("login", login);
								this.getServletContext()
								.getRequestDispatcher("/recherche.jsp")
								.forward(request, response);
							} else {

								String err = "Nom ou mot de passe incorrect !";
								request.setAttribute("err", err);
								this.getServletContext()
										.getRequestDispatcher("/login.jsp")
										.forward(request, response);

							}
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
			
		

	}
