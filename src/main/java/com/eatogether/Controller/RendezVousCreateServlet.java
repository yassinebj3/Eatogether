package com.eatogether.Controller;

import com.eatogether.Buisness.IRendezVousBusiness;
import com.eatogether.Buisness.Implementation.IRendezVousBusinessImplementation;
import com.eatogether.Consumer.IRendezVous;
import com.eatogether.Consumer.IUsers;
import com.eatogether.Consumer.Implementation.RendezVousImplementation;
import com.eatogether.Consumer.Implementation.UsersImplementation;
import com.eatogether.Consumer.Transformation.IRendezVousTransformation;
import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Consumer.Transformation.Implementation.TransformationRdv;
import com.eatogether.Consumer.Transformation.Implementation.TransformationUser;
import com.eatogether.Repository.RendezVous;
import com.eatogether.Repository.User;
import com.eatogether.Repository.RepositoryBean.UtilisateurBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RendezVousCreateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IRendezVousBusiness iRendezVousBusiness = new IRendezVousBusinessImplementation();

    


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	HttpSession session = request.getSession();
        String mail = session.getAttribute("login").toString();
        System.out.println(mail);
        String idRestaurant = request.getParameter("resto-id");
        System.out.println("idresto"+idRestaurant);
        Date date = null;
		try {
			date = formatter.parse(request.getParameter("date"));
			System.out.println(request.getParameter("date").toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        String note =request.getParameter("message-text");
        RendezVous rendezVous = new RendezVous();
        rendezVous.setIdRestraunt(idRestaurant);
        rendezVous.setDateRdv(date);
        rendezVous.setNote(note);
        
      
        iRendezVousBusiness.CreateRdvWithouTarget(mail,rendezVous);
        this.getServletContext()
                .getRequestDispatcher("/recherche.jsp")
                .forward(request, response);


    }


}

