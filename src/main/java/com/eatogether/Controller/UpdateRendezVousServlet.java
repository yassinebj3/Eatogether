package com.eatogether.Controller;

import com.eatogether.Business.IRendezVousBusiness;
import com.eatogether.Business.Implementation.IRendezVousBusinessImplementation;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

public class UpdateRendezVousServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IRendezVousBusiness iRendezVousBusiness = new IRendezVousBusinessImplementation();


    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRendezVousServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Date Date = (Date) session.getAttribute("date");
        int idrdv = (Integer) session.getAttribute("Idrdv");
        JSONObject RendezVousUpdated = new JSONObject(iRendezVousBusiness.updateRDV(idrdv,Date));
        this.getServletContext()
                .getRequestDispatcher("/recherche.jsp")
                .forward(request, response);


    }


}

