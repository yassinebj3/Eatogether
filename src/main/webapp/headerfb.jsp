<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"
   integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
   crossorigin=""/>

<script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"
   integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA=="
   crossorigin=""></script>

<div class="nav-menu">
        <div class="bg transition">
            <div class="container-fluid fixed">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                      	  <img class="img-responsive" src="images/logo2.png">
                            <a class="navbar-brand" href="recherche.jsp">&nbsp;&nbsp;Eatogether</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
               
              </button>
                            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     					<img src="${picture_user}" class="rounded-circle" > <c:out value="${sessionScope.login}"></c:out></a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Rendez-vous
                    <span class="icon-arrow-down"></span>
                  </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        	<a class="dropdown-item" href="rendezvous.jsp">Tout les Rendez-vous</a>
                                            <a class="dropdown-item" href="Consulterrdv.jsp">Mes Rendez-vous</a>
                                        
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Amis et messages
                    <span class="icon-arrow-down"></span>
                  </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="chat.jsp">Messagerie</a>
                                        </div>
                                    </li>
                                    
                                    
                                     <li class="nav-item dropdown">
                                        <a class="nav-link" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Recherche des lieux
                    <span class="icon-arrow-down"></span>
                  </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="recherche.jsp">Recherche</a>
                                        </div>
                                    </li>     
                                       <li><a href="DeconnexionServlet?deconnexion=true" onclick="FB.logout();" class="btn btn-outline-light top-btn"><span class="ti-plus"></span> Déconnexion</a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <section class="slider d-flex align-items-center">
        <!-- <img src="images/slider.jpg" class="img-fluid" alt="#"> -->
        <div class="container">
            <div class="row d-flex justify-content-center">
                <div class="col-md-12">
                    <div class="slider-title_box">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="slider-content_wrap">
                                	<img class="img-responsive" src="images/logo1.png"><br>
                                    <h1>Eatogether</h1>
                                    <h5>Partagez vos repas préférés dans un cadre convivial..</h5>
                                </div>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-10">
                                <form class="form-wrap mt-4" method="post" action="Recherche">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <input type="text" id="place" name="place" placeholder="Lieu" class="btn-group1" required>
                                        <input type="text" id="query" name="query" placeholder="Mot-clé" class="btn-group2"required>
                                        <input type="number" id="rayon" name="rayon" placeholder="Rayon en KM" class="btn-group2"required min="10" max="100">
                                        <input type="number" id="limit" name="limit" placeholder="Résultats" class="btn-group1"required min="1" max="10">
                                        <button type="submit" class="btn-form"><span class="icon-magnifier search-icon"></span>Recherche<i class="pe-7s-angle-right"></i></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


 <script>
  function statusChangeCallback(response) {
  
    if (response.status === 'connected') {
    	console.log('Logged in and authenticated');
   
    //	 window.location.href="Connexion?acces_token="+ response.authResponse.accessToken;
    
    //	setElements(true);
  
    } else {
    	console.log('NOT Logged');
    //	setElements(false);
    //	FB.login();
    	
   //   document.getElementById('status').innerHTML = 'Please log ' +
    //    'into this app.';
    }
    
  }
  
/*  function setElements(isLoggedIn){
	  
	  if(isLoggedIn){
          document.getElementById('fb_btn').style.display = 'none';
          document.getElementById('profile').style.display = 'block';
          document.getElementById('logout').style.display = 'block';
         
        } else {
          document.getElementById('fb_btn').style.display = 'block';
          document.getElementById('profile').style.display = 'none';
       document.getElementById('logout').style.display = 'none';
         
        }
	  
  }*/
  
  function test(){	
	  FB.getLoginStatus(function(response) {
	     
		  if (response.status === 'connected') {
			  window.location.href="Connexion?acces_token="+ response.authResponse.accessToken;}
		  
	    });
	  

  }

 
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
  }

  window.fbAsyncInit = function() {
    FB.init({
      appId      : '717842305245487',
      cookie     : true,    
      xfbml      : true, 
      version    : 'v3.1' 
    });

    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });

  };

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));
  
  
  function logout(){
	  FB.logout();
  }
  </script>
