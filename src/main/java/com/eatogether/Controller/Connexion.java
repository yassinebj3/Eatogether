package com.eatogether.Controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatogether.model.User;
import com.eatogether.model.User_fcb;
import com.fasterxml.jackson.annotation.JsonValue;

import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.Version;
import com.restfb.json.JsonObject;





public class Connexion extends HttpServlet {

	 private static final long serialVersionUID = 1L;
	 ConnectDB db = new ConnectDB();

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		HttpSession session = request.getSession();

		try {
			String acces_token= request.getParameter("acces_token");

			FacebookClient facebookClient=new DefaultFacebookClient(acces_token,Version.VERSION_3_1);


			JsonObject fetchObjectsResults =
			facebookClient.fetchObjects(Arrays.asList("me"), 
				JsonObject.class, Parameter.with("fields","name,id,email,birthday,picture,gender"));
			
			//System.out.println("la chaine "+fetchObjectsResults);

			JsonObject me = (JsonObject) fetchObjectsResults.get("me");
			
			System.out.println("JSON EST "+me);

			String name_user=  me.get("name").toString().substring(1, me.get("name").toString().length()-1);
			String id_user=  me.get("id").toString().substring(1,  me.get("id").toString().length()-1);
			String email_user= me.get("email").toString().substring(1,  me.get("email").toString().length()-1);
			String gender_user= me.get("gender").toString().substring(1,  me.get("gender").toString().length()-1);
			String birthday_user= me.get("birthday").toString().substring(1,  me.get("birthday").toString().length()-1);

			
			JsonObject picture = (JsonObject) me.get("picture");
			JsonObject data = (JsonObject) picture.get("data");

			String picture_user=data.get("url").toString().substring(1, data.get("url").toString().length()-1);


			session.setAttribute("login", email_user);			
			session.setAttribute("name_user", name_user);
			session.setAttribute("picture_user", picture_user);
			
			String[] prenom_nom = name_user.split("\\s+");
			
			try {
				if (!User.isRegistred(email_user)) {
					
					
					User.insertUser1(email_user,"", prenom_nom[0], prenom_nom[1], birthday_user, name_user);
					
				}
				
				this.getServletContext()
				.getRequestDispatcher("/recherche.jsp")
				.forward(request, response);
				
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("ERREUR DE VERIFICATION");
			}
			

		} catch(Exception e) {
			System.out.println("SHHHHHIIIIIIIIIIIIIIIIIIIIIIT");
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();



		String login = request.getParameter("pseudo");
		String mp = request.getParameter("password");

	

		try {
			if (User.isRegistred(login)) {

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
			System.out.println("ERREUR DE VERIFICATION");
		}


	}



}
