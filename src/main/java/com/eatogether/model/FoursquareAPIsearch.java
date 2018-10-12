package com.eatogether.model;

import static io.restassured.RestAssured.*;
import java.io.IOException;
import java.util.ArrayList;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;


import io.restassured.response.Response;

public class FoursquareAPIsearch {



	
	/* public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		String resultfoursquare ;
		String venues;
		resultfoursquare=getvenues("marseille", "", "tacos", "", "");
		
		
		//System.out.println(resultfoursquare);
		venues=venuedeserialize(resultfoursquare);
		venueinformation(venues);
		
		resultfoursquare = getvenuesdetails(venuedetails[0].getId());
		venues=venuedeserializestep2(resultfoursquare);
		infostep2(venues);
		ContactTT contact  = contactstep2();
		LikesTT like = likestep2();
		StatsTT stat = statstep2();
		MenuTT menu = menustep2();
		ArrayList<PhotoInfoTT[]> tt = new ArrayList<PhotoInfoTT[]>();
		ArrayList<String> url = new ArrayList<String>();
		tt=photo();
		url = traitementphoto(tt);
		
		
		
		for(int i = 0 ; i<1;i++) {
		System.out.println("nom :"+venuedetails[i].getName());
		System.out.println("id :"+venuedetails[i].getId());
		LocationVenue venu = getlocationvenue(i);
		System.out.println("adresse :"+venu.getAddress());
		System.out.println("city :"+venu.getCity());
		System.out.println("country :"+venu.getCountry());
		System.out.println("lieu :"+venu.getNeighborhood());
		Categorievenue cat = Categorieinformation(i);
		System.out.println("catégorie :"+cat.name);
		System.out.println("catégorie id : "+cat.id);
		System.out.println("catégorie : "+cat.pluralName);
		System.out.println("Facebook :"+contact.getFacebookName());
		System.out.println("URL :"+infovenue.getUrl());
		System.out.println("likes :"+like.getCount());
	//s	System.out.println("Menu :"+menu.getType());
		System.out.println("stats :"+stat.getTipCount());
		for(int j =0 ;j<url.size();j++) {
			System.out.println("photo :"+url.get(j));
		}
	
		}}
		
		
		
		// getvenuesdetails("579e332f498e7d497358604c");

	*/

	public static Venuedetails[] getvenues(String near, String radius, String query, String limit, String categoryid)
			throws JsonParseException, JsonMappingException, IOException {

		final String nearParameter = "near";
		String radiusParameter = "radius";
		String queryParameter = "query";
		String limitParameter = "limit";
		String categoryidParameter = "categoryId";

		if (radius.equals("")) {
			radiusParameter = "";
		}

		if (query.equals("")) {
			queryParameter = "";
		}

		if (limit.equals("")) {
			limitParameter = "";
		}

		if (categoryid.equals("")) {
			categoryidParameter = "";
		}

		Response resp = given()
				.params(nearParameter, near, radiusParameter, radius, queryParameter, query, limitParameter, limit,
						categoryidParameter, categoryid)

				.params("client_id", "JKGZ204YBKPLRSNJY1WTMQJ1OAZDRR13IMEAYKE2UHJDVG1X")
				.params("client_secret", "MT5Z3ZFMWOBDPH03BGJBCO3LF1X5MIQT05MXNVXKP3SJM5A3").params("v", "20180922")
				.when().get("https://api.foursquare.com/v2/venues/search");
		
		Venuedetails[] venuedetails;
		System.out.println(resp.asString());
		String deserialize = venuedeserialize(resp.asString());
		venuedetails=venueinformation(deserialize);
	/*	for(int i = 0 ; i<venuedetails.length;i++) {
				venuedetails[i].setCategories(Categorieinformation(i,venuedetails));
				venuedetails[i].setLocation(getlocationvenue(i,venuedetails));
			} */
		return venuedetails;	
	}

	
	public static String venuedeserializestep2(String resp) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		Venue venue = mapper.readValue(resp, Venue.class);

		String venueinfo;
		ObjectMapper objectMapper = new ObjectMapper();
		venueinfo = objectMapper.writeValueAsString(venue.getResponse());
		
	//	System.out.println(venueinfo);
		
		Venueinfo info = mapper.readValue(venueinfo, Venueinfo.class);
		String venuedetails = objectMapper.writeValueAsString(info.getVenue());

		return venuedetails;
	}
	
	public static InformationTT infostep2(String resp) throws JsonParseException, JsonMappingException, IOException {
		InformationTT infovenue ;
		ObjectMapper mapper = new ObjectMapper();
		infovenue = mapper.readValue(resp, InformationTT.class);
		return infovenue ;
	}
	
	
	public static ContactTT contactstep2(InformationTT infovenue) throws IOException {
		ContactTT cont;
		String contact ; 
		ObjectMapper objectMapper = new ObjectMapper();
		contact = objectMapper.writeValueAsString(infovenue.getContact());
		
		
		ObjectMapper mapper = new ObjectMapper();
		cont = mapper.readValue(contact, ContactTT.class);
		return cont;
	}
	
	public static LikesTT likestep2(InformationTT infovenue) throws IOException {
		LikesTT like;
		String info ; 
		ObjectMapper objectMapper = new ObjectMapper();
		info = objectMapper.writeValueAsString(infovenue.getLikes());
		
		
		ObjectMapper mapper = new ObjectMapper();
		like = mapper.readValue(info, LikesTT.class);
		return like;
	}
	
	public static StatsTT statstep2(InformationTT infovenue) throws IOException {
		StatsTT stats;
		String info ; 
		ObjectMapper objectMapper = new ObjectMapper();
		info = objectMapper.writeValueAsString(infovenue.getStats());
		
		
		ObjectMapper mapper = new ObjectMapper();
		stats = mapper.readValue(info, StatsTT.class);
		return stats;
	}
	
	public static MenuTT menustep2(InformationTT infovenue) throws IOException {
		MenuTT menu;
		String info ; 
		ObjectMapper objectMapper = new ObjectMapper();
		info = objectMapper.writeValueAsString(infovenue.getMenu());
		
		
		ObjectMapper mapper = new ObjectMapper();
		menu = mapper.readValue(info, MenuTT.class);
		return menu;
	}
	
	public static ArrayList<PhotoInfoTT[]> photo(InformationTT infovenue) throws IOException {
		
		String info ; 
		ObjectMapper objectMapper = new ObjectMapper();
		info = objectMapper.writeValueAsString(infovenue.getPhotos());

		ObjectMapper mapper = new ObjectMapper();
		PhotoTT photo = mapper.readValue(info, PhotoTT.class);
		
		
		info = objectMapper.writeValueAsString(photo.getGroups());
			
	//	System.out.println(info);
		PhotosTT[] photos = mapper.readValue(info, PhotosTT[].class);
		
		ArrayList<PhotoInfoTT[]> tt = new ArrayList<PhotoInfoTT[]>();
		for(int i=0;i<photos.length;i++) {
		
		info = objectMapper.writeValueAsString(photos[i].getItems());	
		PhotoInfoTT[] photoinf = mapper.readValue(info, PhotoInfoTT[].class);
		tt.add(photoinf);
		}
		return tt ;
	}
	
	public static ArrayList<String> traitementphoto(ArrayList<PhotoInfoTT[]> tt) {
		
		ArrayList<String> url = new ArrayList<String>();
		for(int i=0;i<tt.size();i++) {
			for(int j=0;j<tt.get(i).length;j++) {
			url.add(""+tt.get(i)[j].getPrefix()+tt.get(i)[j].getHeight()+"x"+tt.get(i)[j].getWidth()+tt.get(i)[j].getSuffix());
			}
		}
		return url;
	}
	
	
	public static String venuedeserialize(String resp) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		Venue venue = mapper.readValue(resp, Venue.class);

		String venueinfo;
		ObjectMapper objectMapper = new ObjectMapper();
		venueinfo = objectMapper.writeValueAsString(venue.getResponse());
		
		Venuesinfo info = mapper.readValue(venueinfo, Venuesinfo.class);
		String venuedetails = objectMapper.writeValueAsString(info.getVenues());

		return venuedetails;
	}

	public static Venuedetails[] venueinformation(String venueinfo) throws JsonParseException, JsonMappingException, IOException {
		Venuedetails[] venuedetails;
		ObjectMapper mapper = new ObjectMapper();
		venuedetails = mapper.readValue(venueinfo, Venuedetails[].class);
		return venuedetails ;
	}

	public static LocationVenue getlocationvenue(int i,Venuedetails[] venuedetails) throws IOException {

		ObjectMapper mapper = new ObjectMapper();
		ObjectMapper objectMapper = new ObjectMapper();
		String venueinfo;
		venueinfo = objectMapper.writeValueAsString(venuedetails[i].getLocation());
		LocationVenue location = mapper.readValue(venueinfo, LocationVenue.class);

		return location;
	}

	public static Categorievenue[] Categorieinformation(int i,Venuedetails[] venuedetails) throws IOException {
		ObjectMapper mapper = new ObjectMapper();
		ObjectMapper objectMapper = new ObjectMapper();
		String venueinfo;
		venueinfo = objectMapper.writeValueAsString(venuedetails[0].getCategories());
		Categorievenue[] catvenu = mapper.readValue(venueinfo, Categorievenue[].class);
		return catvenu;
	}

	public static InformationTT getvenuesdetails(String id) throws JsonParseException, JsonMappingException, IOException {


		Response resp = given().params("client_id", "JKGZ204YBKPLRSNJY1WTMQJ1OAZDRR13IMEAYKE2UHJDVG1X")
				.params("client_secret", "MT5Z3ZFMWOBDPH03BGJBCO3LF1X5MIQT05MXNVXKP3SJM5A3").params("v", "20180922")
				.when().get("https://api.foursquare.com/v2/venues/" + id);

		String venues=venuedeserializestep2(resp.asString());
		InformationTT infovenue =	infostep2(venues);

		return infovenue ;
	}


	public String infovenuetojson(String id) throws JsonParseException, JsonMappingException, IOException {
		InformationTT info = getvenuesdetails(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonInString = mapper.writeValueAsString(info);
		return jsonInString;
		
	}

}
