package com.eatogether.Controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatogether.Consumer.IUsers;
import com.eatogether.Consumer.Implementation.UsersImplementation;
import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Consumer.Transformation.Implementation.TransformationUser;
import com.eatogether.Repository.User;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;

import com.eatogether.model.User_fcb;
import com.fasterxml.jackson.annotation.JsonValue;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Parameter;
import com.restfb.Version;
import com.restfb.json.JsonObject;




public class Connexion extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	 private IUsers iUsers = new UsersImplementation();
	 IUserTransformation iUserTransformation = new TransformationUser();
	ConnectDB db = new ConnectDB();

	public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException{
		HttpSession session = request.getSession();

		try {
			
			String acces_token= request.getParameter("acces_token");
			FacebookClient facebookClient=new DefaultFacebookClient(acces_token,Version.VERSION_3_1);
			JsonObject fetchObjectsResults =
			facebookClient.fetchObjects(Arrays.asList("me"), 
				JsonObject.class, Parameter.with("fields","name,id,email,picture"));

			JsonObject me = (JsonObject) fetchObjectsResults.get("me");
	
			String name_user=  me.get("name").toString().substring(1, me.get("name").toString().length()-1);
			String id_user=  me.get("id").toString().substring(1,  me.get("id").toString().length()-1);
			String email_user= me.get("email").toString().substring(1,  me.get("email").toString().length()-1);
			JsonObject picture = (JsonObject) me.get("picture");
			JsonObject data = (JsonObject) picture.get("data");

			String picture_user=data.get("url").toString().substring(1, data.get("url").toString().length()-1);


			session.setAttribute("login", email_user);			
			session.setAttribute("picture_user", picture_user);
			
			String[] prenom_nom = name_user.split("\\s+");
			
			
			
			User user = new User();
			user.setMail(email_user);
			user.setImage(picture_user);
			user.setDatenaissance("");
			user.setNom(prenom_nom[1]);
			user.setPrenom(prenom_nom[0]);
			user.setPseudo("");
			user.setSexe("");
			
			session.setAttribute("facebook", true);
			UtilisateurBean utilisateurPersistance = iUserTransformation.fromUserToUserBean(user);
			
			boolean emailexist =false ;
			try {
				if (iUsers.getUserexistemail(email_user)) {	 
					emailexist=true ; 
				}	
				
			} catch (Exception e) {
				String err = "Nom ou mot de passe incorrect !";
				request.setAttribute("err", err);
			}
			
			if(emailexist==false) {
			iUsers.persistuser(utilisateurPersistance);
			}
			else {
			this.getServletContext()
			.getRequestDispatcher("/recherche.jsp")
			.forward(request, response);}

		} catch(Exception e) {
			
		}

		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		HttpSession session = request.getSession();



		String login = request.getParameter("pseudo");
		String mp = request.getParameter("password");

	
		try {
			if (iUsers.getUserexist(login,mp)) {
				
				String picture_user="images/profile-user (2).png";
				session.setAttribute("login", login);	
				session.setAttribute("picture_user", picture_user);

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
			String err = "Nom ou mot de passe incorrect !";
			request.setAttribute("err", err);
			this.getServletContext()
			.getRequestDispatcher("/login.jsp")
			.forward(request, response);
		}


	}



}