<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.h5-nav {
	color: #ffffff ; 
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:if test="${sessionScope.login == null}">
    <jsp:forward page = "login.jsp" />
</c:if>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"
   integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
   crossorigin=""/>

<script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"
   integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA=="
   crossorigin=""></script>
  
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- Hover Effects -->
   <!--  <link rel="stylesheet" href="css/set1.css">  -->
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
   
</head>
<body>
 <div class="nav-menu">
        <div class="bg transition">
            <div class="container-fluid fixed">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <a class="navbar-brand" href="index.html">Eatogether</a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
               
              </button>
                            <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                                <ul class="navbar-nav">
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     					<img src="https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-1/p40x40/38528653_1819079501515690_2328069988956504064_n.jpg?_nc_cat=101&oh=d5e99a20f3d7c2b46e5898f890e64f90&oe=5C45E7A0" class="rounded-circle" > <c:out value="${sessionScope.login}"></c:out></a>
                                         <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="Profil">Gérer</a>
                                                                                  </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Rendez-vous
                    <span class="icon-arrow-down"></span>
                  </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="#">Consulter</a>
                                            <a class="dropdown-item" href="#">Modifier</a>
                                            <a class="dropdown-item" href="#">Supprimer</a>
                                        </div>
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
                                    <li class="nav-item active">
                                        <a class="nav-link" href="#">Mes lieux préférés</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">à propos </a>
                                    </li>
                                    <li><a href="Recherche?deconnexion=true" class="btn btn-outline-light top-btn"><span class="ti-plus"></span> Déconnexion</a></li>
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
                                    <h1>Eatogether</h1>
                                    <h5>Partagez vos repas préférés dans un cadre conviviale..</h5>
                                </div>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-center">
                            <div class="col-md-10">
                                <form class="form-wrap mt-4" method="post" action="Recherche">
                                    <div class="btn-group" role="group" aria-label="Basic example">
                                        <input type="text" id="place" name="place" placeholder="Lieu" class="btn-group1">
                                        <input type="text" id="query" name="query" placeholder="Mot-clé" class="btn-group2">
                                        <input type="text" id="rayon" name="rayon" placeholder="Rayon" class="btn-group2">
                                        <input type="text" id="limit" name="limit" placeholder="Résultats" class="btn-group1">
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


<section class="main-block">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Eatogether</h2>
            <h3 class="section-subheading text-muted">Partagez vos repas préférés dans un cadre conviviale..</h3>
            <br>
          </div>
        </div>
        <div class="row text-center">
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <img class="img-rounded" src="speech.png" alt="">
            </span>
            <h4 class="service-heading">Messagerie instantanée</h4>
            <p class="text-muted">Graçe à Eatogether , vous pouvez échanger vos messages </p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
             <img class="img-rounded" src="couple.png" alt="">
            </span>
            <h4 class="service-heading">Gestion Rendez-vous</h4>
            <p class="text-muted">Vous pouvez à travers notre application , créer,joindre,annuler et modifier un rendez-vous de votre choix </p>
          </div>
          <div class="col-md-4">
            <span class="fa-stack fa-4x">
              <img class="img-rounded" src="resto.png" alt="">
            </span>
            <h4 class="service-heading">Recherche de lieu</h4>
            <p class="text-muted">Eatogether offre à ses utilisateurs la possiblité d'effectuer des recherches sur des lieux à fin de partager ses repas préférés </p>
          </div>
        </div>
      </div>
    </section>
   
   
   
       
    <section class="main-block light-bg">
        <div class="container">
            <div class="row justify-content-center">
            
                <div class="col-md-5">
                
                    <div class="styled-heading">
                        <img class="img-responsive" src="magnifier.png">
                         <br><br>
                          
                          <h4 class="service-heading">Notre Service</h4>
            			 <p class="text-muted">Notre site propose à ses utilisateurs une liste des meilleurs restaurants selon leurs localisations, et ce n’est pas tout ! Le plus important, c’est qu’il vous permettra de faire des rencontres avec d’autres utilisateurs en partageant vos repas préférés</p>
                         <a href="#" class="btn btn-secondary"><span class="ti-plus"></span> Lancer vos recherches ! </a><br><br>
                         <h3>Résultat de recherche</h3>
                         
                    </div>
                    
                </div>
            </div>
           
               <c:set var="count" value="0" scope="page" />
                <div class="row">
                <c:forEach items="${venue}" var="value">
                    <div class="col-md-4 featured-responsive">
                    <div class="featured-place-wrap">
							<div id="mapid${count}"></div>
							<script> var mymap${count} = L.map('mapid${count}').setView([${value.location.lat}, ${value.location.lng}], 20);
	    	    	 L.tileLayer('//{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
	    	    	     attribution: ' &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
	    	    	 }).addTo(mymap${count});
	    	    	 var marker${count} = L.marker([${value.location.lat}, ${value.location.lng}]).addTo(mymap${count});</script>
	    	    	 <style>
				#mapid${count} { height: 250px; }
					</style>
					<br>
					 <div class="featured-title-box">
					 <c:set var="count" value="${count + 1}" scope="page"/>
					 	<h6><c:out value="${value.name}" /></h6>
	    	    		<span class="icon-location-pin"></span><p> <c:out value="${value.location.country }" /> </p><br>
							<c:forEach items="${value.categories}" var="categorie">
						<span class="ti-bookmark"></span></span>	<p>	<c:out value="${categorie.name }" /> <p><br>
							</c:forEach>
							 <div class="bottom-icons">
							<a href="Recherche?id=${value.id}&name=${value.name}&lieu=${value.location.country}" class="btn btn-secondary" role="Plus de détails" id="btnid" value="<c:out value="${value.id}"/>">Plus de détails</a>
							<br> 
							
							</div>
                    </div>
                </div>
            </div>
           </c:forEach>
           </div> 
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END FEATURED PLACES -->
   
   
   
    
    <section class="testimonials text-center bg-light">
      <div class="container">
        <h2 class="mb-5">Ce que les gens disent...</h2>
        <div class="row">
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="1.jpg" alt="">
              <h5>Zakaria </h5>
              <p class="font-weight-light mb-0">"Partagez vos repas"</p><br>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="3.jpg" alt="">
              <h5>Darine </h5>
              <p class="font-weight-light mb-0">"Rencontrez des nouvelles personnes"</p><br>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="3.jpg" alt="">
              <h5>Yassine</h5>
              <p class="font-weight-light mb-0">"Changez votre vie "</p><br>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--============================= ADD LISTING =============================-->
    <section class="main-block light-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="add-listing-wrap">
                        <h2>Plusieurs personnes vous attend</h2>
                        <p>Trouvez la bonne personne !</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="rendezvous.jsp" class="btn btn-secondary"><span class="ti-plus"></span> Consulter </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END ADD LISTING -->
    <!--============================= FOOTER =============================-->
    <footer class="main-block dark-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                         <p>Copyright &copy; Eatogether 2018 </p>
                        <p>Copyright &copy; 2018 Listing. All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <ul>
                            <li><a href="#"><span class="ti-facebook"></span></a></li>
                            <li><a href="#"><span class="ti-twitter-alt"></span></a></li>
                            <li><a href="#"><span class="ti-instagram"></span></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--//END FOOTER -->




    <!-- jQuery, Bootstrap JS. -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <script>
        $(window).scroll(function() {
            // 100 = The point you would like to fade the nav in.

            if ($(window).scrollTop() > 100) {

                $('.fixed').addClass('is-sticky');

            } else {

                $('.fixed').removeClass('is-sticky');

            };
        });
    </script>
</body>

</html>

			<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Détails</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

	
</body>
</html>