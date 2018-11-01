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
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    
    
    
    
    <section class="main-block light-bg">
        <div class="container">
              <div class="row justify-content-center">
            
                <div class="col-md-5">
                
                    <div class="styled-heading">
                        <img class="img-responsive" src="cutlery.png">
                         <br><br>
                          
                          <h4 class="service-heading">Rendez-vous</h4>
            			 <p class="text-muted">Consulter et choisir les rendez-vous à votre choix afin de échanger ton repas avec la bonne personne</p>
                         <br><br>
                         <h3>Liste des rendez-vous</h3>
                         
                    </div>
                    
                </div>
            </div>
           
                <div class="row" id="row1">
                   
                </div>
           
            <div class="row justify-content-center">
                <div class="col-md-4">
                </div>
            </div>
        </div>
    </section>
    <!--//END FEATURED PLACES -->
    


    
    <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Détails sur le lieu </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    
    

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
$(document).ready(function(){
	    $.ajax({
	       url : 'AllRendezVousServlet',
	       type : 'POST', // Le type de la requête HTTP, ici devenu POST
	       dataType : 'json',
	    	     success : function(data){
	    	    	 $.each(data, function(i, obj) {
	    	    		 $("#row1").append("<div class=\"col-md-4 featured-responsive\"><div class=\"featured-place-wrap\"><div class=\"featured-title-box\"><h6> Rejoindre son rendez-vous ! </h6><p><b>Nom :</b> "+obj.idLiker.nom+"</p><br><p><b>Prénom :</b>"+obj.idLiker.prenom+"</p><br><p><b>Date de naissance :</b>"+obj.idLiker.datenaissance+"<p><br><p><b>Email :</b>"+obj.idLiker.mail+"<p><br><p><b>Date de Rendez-vous :</b>"+obj.dateRdv+"</p><p><b>Description :</b>"+obj.note+"</p><div class=\"bottom-icons\"> <a href=\"#\" class=\"btn btn-danger\" role=\"Plus de détails\" id=\"btnid\" data-toggle=\"modal\" data-target=\"#exampleModal\" value=\""+obj.idRestraunt+"\" >Plus de détails</a><br><a class=\"btn btn-secondary\" id=\"match\" value=\""+obj.id+"\" role=\"Match\">Match</a></div></div></div></div></div>");

	    	    	 }); 
	    	    	 },

	    	       error : function(resultat, statut, erreur){

	    	       },

	    	       complete : function(resultat, statut){

	    	       }

	    });
	});
</script>

<script>


$(document).ready(function(){
	$("#row1").on("click","#match",function(){
		 var id = $("#match").attr('value');
	    $.ajax({
	       url : 'RendezVousAddTargetServlet',
	       type : 'POST', // Le type de la requête HTTP, ici devenu POST
	       data : 'Idrdv='+id, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	       dataType : 'json',
	    	     success : function(data){
	
	    	       },
	    	       error : function(resultat, statut, erreur){
	    	       },
	    	       complete : function(resultat, statut){
	    	       }
	    });
	});
});
    </script>
    <script>
    $(document).ready(function(){
	$("#row1").on("click","#btnid",function(){
		 var id = $("#btnid").attr('value');
	    $.ajax({
	       url : 'DetailsServlet',
	       type : 'POST', // Le type de la requête HTTP, ici devenu POST
	       data : 'id='+id, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	       dataType : 'json',
	    	     success : function(data){
	    	    	 $(".modal-body").append("<img src=\""+data.photos.groups[1].items[0].prefix+"470x470"+data.photos.groups[1].items[0].suffix+"\" class=\"rounded\" /><br>");
	    	    	 $(".modal-body").append("<label> Facebook : </label>"+data.contact.facebookName+"<br>");
	    	    	 $(".modal-body").append("<label> Instagram : </label>"+data.contact.instagram+"<br>");
	    	    	 $(".modal-body").append("<label> Website : </label>"+data.url+"<br>");
	    	    	 $(".modal-body").append("<label> Likes : </label>"+data.likes.summary+"<br>");
	    	    	 $(".modal-body").append("<label> Rating :</label>"+data.rating+"<br>");
	    	    	 $(".modal-body").append("<label> Menu :</label>"+data.menu.url+"<br>");
	    	    	 $(".modal-body").append("<label> Hours :</label>"+data.hours.status+"<br>");
	    	       },
	    	       error : function(resultat, statut, erreur){
	    	       },
	    	       complete : function(resultat, statut){
	    	       }
	    });
	});
});
    
    
    </script>
    
    
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