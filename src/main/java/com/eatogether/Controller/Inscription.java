package com.eatogether.Controller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.eatogether.model.User;

/**
 * Servlet implementation class Test
 */
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
	
        
    }
    
		public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
			HttpSession session = request.getSession();
		
			
					String gender;
					if(request.getParameter("gender").equals("homme") ) {
						gender="homme";
					}else {
						gender="femme";
					}
					
			        String mail = request.getParameter("email");
			        String pseudo = request.getParameter("pseudo");												
					String name = request.getParameter("nom");
					String prename = request.getParameter("prenom");
					String date_naiss=request.getParameter("date");
					String mp = request.getParameter("password");	
									

					
					try {
						
						if(!User.isRegistred2(mail)) {
							User.insertUser1(mail, mp, name, prename,date_naiss,pseudo,gender);
							session.setAttribute("mail", mail);						
							
							this.getServletContext()
							.getRequestDispatcher("/login.jsp")
							.forward(request, response);
						
						}else {
							System.out.println("ERREUR L UTILISATEUR EXISTE DEJA");
							
							//session.invalidate();
							String err="true";
		                    request.setAttribute(err, true);
		                    this.getServletContext()
							.getRequestDispatcher("/inscription.jsp")
							.forward(request, response);
						}
							
					} catch (Exception e) {
						
						e.printStackTrace();
					}
				

				}
			
		}
	


