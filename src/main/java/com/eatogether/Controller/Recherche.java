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
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		String place = request.getParameter("place");
		String query = request.getParameter("query");
		String limit = request.getParameter("limit");
		String rayon = request.getParameter("rayon");
		FoursquareAPIsearch api = new FoursquareAPIsearch();
		Venuedetails[] result = api.getvenues(place, rayon, query,limit, "");
		InformationTT info =	api.getvenuesdetails(result[0].getId());
		request.setAttribute("info",  info);
		request.setAttribute("venue", result);
		//System.out.println("tesst"+result[0].getCategories().getShortName());
		ArrayList<PhotoInfoTT[]> tt = new ArrayList<PhotoInfoTT[]>();
		ArrayList<String> url = new ArrayList<String>();
		tt=api.photo(info);
		url = api.traitementphoto(tt);
		request.setAttribute("info",  info);
		request.setAttribute("venue", result);
		request.setAttribute("photo",url);
		this.getServletContext()
		.getRequestDispatcher("/recherche.jsp")
		.forward(request, response);
	}

}
