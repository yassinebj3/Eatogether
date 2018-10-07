package com.eatogether.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatogether.model.User;

/**
 * Servlet implementation class Profil
 */
public class Profil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		HttpSession session = request.getSession();
		String mp, mail, nom, prenom, pseudo;
		mp= (String) session.getAttribute("mp");
		mail= (String) session.getAttribute("login");
		
		User u= new User(mp, mail);
		User u1= new User();
		try {
			u1= u.getUser(mp, mail);
			
			nom= u1.getNom();
			prenom=u1.getPrenom();
			pseudo= u1.getPseudo();
			
			request.setAttribute("nom",nom);
			request.setAttribute("presnom",prenom);
			request.setAttribute("pseudo",pseudo);
			
			String nom_nouveau = request.getParameter("nom");
			String prenom_nouveau = request.getParameter("prenom");
			String pseudo_nouveau = request.getParameter("pseudo");
			
			try {
			User u_nouveau=new User(mail, mp, nom, prenom, pseudo);
			u_nouveau.updateUser_info(mail, nom_nouveau, prenom_nouveau, pseudo_nouveau);
			}catch(Exception e) {
				System.out.println("ERREUUUR MODIF");
				e.printStackTrace();
			}
			
			
			
		} catch (Exception e) {
			System.out.println("ERREUUUR 111");
			e.printStackTrace();
		}
		
		
		
		
		
		
		doGet(request, response);
	}

}
