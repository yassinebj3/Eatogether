package com.eatogether.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatogether.model.User;


public class Profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String mail;
	
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String nom, prenom, pseudo,date_naiss,gender;
		HttpSession session = request.getSession();
		
		
		mail= (String) session.getAttribute("login");
		
	//	User u= new User();
		
		
		try {
			User u = User.getUser(mail);
			
			nom= u.getNom();
			prenom=u.getPrenom();
			date_naiss=u.getDate_naissance();
			pseudo= u.getPseudo();
			gender=u.getGender();
			
			
			request.setAttribute("nom",nom);
			request.setAttribute("prenom",prenom);
			request.setAttribute("date_naiss",date_naiss);
			request.setAttribute("pseudo",pseudo);
			request.setAttribute("gender",gender);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		this.getServletContext()
		.getRequestDispatcher("/profil.jsp")
		.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nom_nouveau, prenom_nouveau, pseudo_nouveau,date_naiss_nouveau,gender_nouveau;
		nom_nouveau = request.getParameter("nom");
		prenom_nouveau = request.getParameter("prenom");
		pseudo_nouveau = request.getParameter("pseudo");
		date_naiss_nouveau=request.getParameter("date_naiss");
		
		if(request.getParameter("gender").equals("homme") ) {
			gender_nouveau="homme";
		}else {
			gender_nouveau="femme";
		}
				
			try {
			
			User.updateUser_info(mail, nom_nouveau, prenom_nouveau, pseudo_nouveau,date_naiss_nouveau,gender_nouveau);
			
			this.getServletContext()
			.getRequestDispatcher("/recherche.jsp")
			.forward(request, response);
			
			}catch(Exception e) {
				System.out.println("ERREUUUR MODIF");
				e.printStackTrace();
			}
								
			
		//doGet(request, response);
	}

}
