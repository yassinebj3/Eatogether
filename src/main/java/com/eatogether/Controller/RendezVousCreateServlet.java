package com.eatogether.Controller;

import com.eatogether.Business.IRendezVousBusiness;
import com.eatogether.Business.Implementation.IRendezVousBusinessImplementation;
import com.eatogether.Consumer.IRendezVous;
import com.eatogether.Consumer.IUsers;
import com.eatogether.Consumer.Implemenation.RendezVousImplementation;
import com.eatogether.Consumer.Implemenation.UsersImplementation;
import com.eatogether.Consumer.Transformation.IRendezVousTransformation;
import com.eatogether.Consumer.Transformation.IUserTransformation;
import com.eatogether.Consumer.Transformation.Implementation.TransformationRdv;
import com.eatogether.Consumer.Transformation.Implementation.TransformationUser;
import com.eatogether.Repository.RendezVous;
import com.eatogether.Repository.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RendezVousCreateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IRendezVousBusiness iRendezVousBusiness = new IRendezVousBusinessImplementation();


    /**
     * @see HttpServlet#HttpServlet()
     */
    public RendezVousCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String mail = (String) session.getAttribute("login");
        String idRestaurant = (String) session.getAttribute("idrestaurant");
        Date date = (Date) session.getAttribute("daterdv");
        String note =(String) session.getAttribute("Description de date");
        RendezVous rendezVous = new RendezVous();
        rendezVous.setIdRestraunt(idRestaurant);
        rendezVous.setDateRdv( date);
        rendezVous.setNote(note);
        iRendezVousBusiness.CreateRdvWithouTarget(mail,rendezVous);
        this.getServletContext()
                .getRequestDispatcher("/recherche.jsp")
                .forward(request, response);


    }


}

