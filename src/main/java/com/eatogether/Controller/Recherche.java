package com.eatogether.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.eatogether.model.FoursquareAPIsearch;
import com.eatogether.model.InformationTT;
import com.eatogether.model.PhotoInfoTT;
import com.eatogether.model.Venuedetails;


public class Recherche extends HttpServlet {
	private static final long serialVersionUID = 1L;
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		FoursquareAPIsearch api = new FoursquareAPIsearch();
		String id = request.getParameter("id");
		System.out.println("id"+id);
		InformationTT info =	api.getvenuesdetails(id);
		ArrayList<PhotoInfoTT[]> tt = new ArrayList<PhotoInfoTT[]>();
		ArrayList<String> url = new ArrayList<String>();
		tt=api.photo(info);
		url = api.traitementphoto(tt);
		request.setAttribute("info",  info);
		request.setAttribute("photo", url); 
		
		String json = api.infovenuetojson(id);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

		   
		}

	


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String place = request.getParameter("place");
		String query = request.getParameter("query");
		String limit = request.getParameter("limit");
		String rayon = request.getParameter("rayon");
		FoursquareAPIsearch api = new FoursquareAPIsearch();
		Venuedetails[] result = api.getvenues(place, rayon, query,limit, "");

		request.setAttribute("venue", result);
		String json = api.infovenuetojson(result[0].getId());
		System.out.println(json);
		this.getServletContext()
		.getRequestDispatcher("/recherche.jsp")
		.forward(request, response);
	}

}
