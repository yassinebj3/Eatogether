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
		
		String nom, prenom, pseudo;
		HttpSession session = request.getSession();
		
		
		mail= (String) session.getAttribute("login");
		
	//	User u= new User();
		
		
		try {
			User u1 = User.getUser(mail);
			
			nom= u1.getNom();
			prenom=u1.getPrenom();
			pseudo= u1.getPseudo();
			
			System.out.println("le nom = "+nom+" prenom= "+prenom+" pseudo= "+pseudo);
			
			request.setAttribute("nom",nom);
			request.setAttribute("prenom",prenom);
			request.setAttribute("pseudo",pseudo);
			
			
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

		String nom_nouveau, prenom_nouveau, pseudo_nouveau;
		nom_nouveau = request.getParameter("nom");
		prenom_nouveau = request.getParameter("prenom");
		pseudo_nouveau = request.getParameter("pseudo");
				
			try {
			User u_nouveau=new User();
			u_nouveau.updateUser_info(mail, nom_nouveau, prenom_nouveau, pseudo_nouveau);
			}catch(Exception e) {
				System.out.println("ERREUUUR MODIF");
				e.printStackTrace();
			}
						
		
		doGet(request, response);
	}

}
