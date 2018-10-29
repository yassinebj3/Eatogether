package com.eatogether.Controller;

import com.eatogether.Business.IRendezVousBusiness;
import com.eatogether.Business.Implementation.IRendezVousBusinessImplementation;
import com.eatogether.Repository.RendezVous;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class AllRendezVousServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    IRendezVousBusiness iRendezVousBusiness = new IRendezVousBusinessImplementation();


    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllRendezVousServlet() {
        super();
        // TODO Auto-generated constructor stub
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String mail = (String) session.getAttribute("login");
        List<RendezVous> list=  iRendezVousBusiness.GetListRdvS(mail);
        this.getServletContext()
                .getRequestDispatcher("/recherche.jsp")
                .forward(request, response);


    }


}

