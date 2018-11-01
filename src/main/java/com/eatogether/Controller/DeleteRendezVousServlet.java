package com.eatogether.Controller;

import com.eatogether.Buisness.IRendezVousBusiness;
import com.eatogether.Buisness.Implementation.IRendezVousBusinessImplementation;
import com.eatogether.Repository.RendezVous;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class DeleteRendezVousServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IRendezVousBusiness iRendezVousBusiness = new IRendezVousBusinessImplementation();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int idrdv = Integer.valueOf(request.getParameter("id").toString());
       
        iRendezVousBusiness.DeleteRDV(idrdv);
        this.getServletContext()
                .getRequestDispatcher("/Consulterrdv.jsp")
                .forward(request, response);


    }


}

