<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.login == null}">
    <jsp:forward page = "login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="author" content="Colorlib">
    <meta name="description" content="#">
    <meta name="keywords" content="#">
    <!-- Favicons -->
    <link rel="shortcut icon" href="#">
    <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Page Title -->
    <title>Listing &amp; Directory Website Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <!-- Simple line Icon -->
    <link rel="stylesheet" href="css/simple-line-icons.css">
    <!-- Themify Icon -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- Hover Effects -->
    <link rel="stylesheet" href="css/set1.css">
    <!-- Swipper Slider -->
    <link rel="stylesheet" href="css/swiper.min.css">
    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- Main CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!--============================= HEADER =============================-->
    <div class="dark-bg sticky-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light">
                        <a class="navbar-brand" href="index.html">Listing</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
              <span class="icon-menu"></span>
            </button>
                        <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
                            <ul class="navbar-nav">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                   Explore
                   <span class="icon-arrow-down"></span>
                 </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" id="navbarDropdownMenuLink1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Listing
                  <span class="icon-arrow-down"></span>
                </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Pages
                  <span class="icon-arrow-down"></span>
                </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link" href="#">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Blog</a>
                                </li>
                                <li><a href="#" class="btn btn-outline-light top-btn"><span class="ti-plus"></span> Add Listing</a></li>
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!--//END HEADER -->
    <!--============================= BOOKING =============================-->
   <section class="slider d-flex align-items-center">
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
   
   
        
    <!--============================= RESERVE A SEAT =============================-->
    <section class="reserve-block">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>${name}</h5>
                    <p></p>
                    <p class="reserve-description">Description.</p>
                </div>
                <div class="col-md-6">
                    <div class="reserve-seat-block">
                        
                        <div class="review-btn">
                            <a href="#" class="btn btn-outline-danger">Retour</a>
                        </div>
                        <div class="reserve-btn">
                            <div class="featured-btn-wrap">
                               <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"> Creer un Rendez-vous</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Un nouveau Rendez-vous</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="RendezVousCreateServlet">
      <div class="modal-body">
        
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email" value="${login}" disabled>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-danger">Confirmer la Création</button>    
      </div>
       </form>
    </div>
  </div>
</div>
    
    
    
    
    <!--//END RESERVE A SEAT -->
    <!--============================= BOOKING DETAILS =============================-->
    <section class="light-bg booking-details_wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-8 responsive-wrap">
                    <div class="booking-checkbox_wrap">
                        <div class="booking-checkbox">
                            
                            <hr>
                        </div>
                        <div class="row">
                        
                        </div>
                    </div>
                    <div class="booking-checkbox_wrap mt-4" id="annonces">
                        <h5>Liste des rendez-vous</h5>
                        <hr>
                       
                    </div>
                </div>
                
                
                  <script>
$(document).ready(function(){
		 var id = "${id}";
	    $.ajax({
	       url : 'DetailsServlet',
	       type : 'POST', // Le type de la requête HTTP, ici devenu POST
	       data : 'id='+id, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	       dataType : 'json',
	    	     success : function(data){
	    	    	 try {
	    	  		$(".contact-info").prepend("<img src=\""+data.venue.photos.groups[1].items[0].prefix+data.venue.photos.groups[1].items[0].height+"x"+data.venue.photos.groups[1].items[0].width+data.venue.photos.groups[1].items[0].suffix+"\" class=\"img-fluid\" /><br>");
	    	    	 }
	    	    	 catch(error) {
	    	    	   console.error(error);
	    	    	 }
	    	   		if(data.venue.facebookName!=null) $("#address-link").append("<span class=\"icon-link\" id=\"icon-link1\"></span><p>Facebook : "+data.venue.contact.facebookName+"</p>");
	    	   		if(data.venue.instagram!=null) $("#address-link").append("<span class=\"icon-link\" id=\"icon-link1\"></span><p> Instagram :"+data.venue.contact.instagram+"</p>");
	    	   		if(data.venue.url!=null) $("#address-link").append(" <span class=\"icon-link\" id=\"icon-link1\"></span><p> Website : "+data.venue.url+"</p>");
	    	   		if(data.venue.likes.summary!=null) $(".review-btn").append("<span> "+data.venue.likes.summary+"</span>");
	    	   		if(data.venue.contact.formattedPhone!=null) $("#address-tel").append(" <span class=\"icon-screen-smartphone\"></span><p>"+data.venue.contact.formattedPhone+"</p>");
	    	   		if(data.venue.rating!=null) $(".reserve-seat-block").append("<div class=\"reserve-rating\"><span>"+data.venue.rating+"</span></div>");
	    	   		if(data.venue.hours.status!=null) $("#address-clock").append("<span class=\"icon-clock\"></span><p>"+data.venue.hours.status+"</p><br>");
	    	   		if(data.venue.hours.timeframes[0].days!=null) $("#address-clock").append("<span class=\"icon-clock\"></span><p>"+data.venue.hours.timeframes[0].days+"</p><br>"); 
	    	   		if(data.venue.hours.timeframes[0].open[0].renderedTime!=null)$("#address-clock").append("<span class=\"icon-clock\"></span><p>"+data.venue.hours.timeframes[0].open[0].renderedTime+"</p><br>");
	    	    	 if(data.venue.description!=null){
	    	    		 $(".booking-checkbox").append("<p>"+data.venue.description+"</p>");
	    	    	 }else {
	    	    		 $(".booking-checkbox").append("<p><div class=\"container\"> <div class=\"row justify-content-center\"><div class=\"col-md-5\"><div class=\"styled-heading\"><img class=\"img-responsive\" src=\"newspaper.png\"><br><br> <h4 class=\"service-heading\">Pas de description </h4></div></div></div></p>");
	    	    	 }
	    	    	
	    	    	 $(".modal-body").append("<div class=\"form-group\">");
	    	    	 $(".modal-body").append("<div class=\"form-group\">");
	    	    	 $(".modal-body").append("<label for=\"recipient-name\" class=\"col-form-label\">Identifiant du lieu</label>");
					 $(".modal-body").append("<input type=\"text\" class=\"form-control\" id=\"resto-id\" name=\"resto-id\" value=\""+id+"\">");
	    	         $(".modal-body").append("</div>");
	    	          
	    	         $(".modal-body").append("<div class=\"form-group\">");
	    	         $(".modal-body").append("<label for=\"recipient-name\" class=\"col-form-label\">Nom du lieu</label>");
	    	         $(".modal-body").append("<input type=\"text\" class=\"form-control\" id=\"recipient-name\" value=\"${name}\" disabled>");
	    	         $(".modal-body").append("</div>") ;
	    	         
	    	         $(".modal-body").append("<div class=\"form-group\">");
	    	         $(".modal-body").append("<label for=\"recipient-name\" class=\"col-form-label\">Date</label>");
	    	         $(".modal-body").append("<input type=\"date\" class=\"form-control\" id=\"date\" name=\"date\">");
	    	         $(".modal-body").append("</div>");
	    	          
	    	         $(".modal-body").append("<div class=\"form-group\">");
	    	         $(".modal-body").append("<label for=\"message-text\" class=\"col-form-label\">Description :</label>");
	    	         $(".modal-body").append("<textarea class=\"form-control\" id=\"message-text\" name=\"message-text\"></textarea>");
	    	         $(".modal-body").append("</div>");
	    	      
	    	         
	    	         $.each(data.info, function(i, obj) {
	    	         $("#annonces").append("<div class=\"customer-review_wrap\"><div class=\"customer-img\"><img src=\"images/customer-img1.jpg\" class=\"img-fluid\" alt=\"#\"><p>"+obj.idLiker.prenom+" "+obj.idLiker.nom+"</p></div><div class=\"customer-content-wrap\"><p class=\"customer-text\"><b><label> Pseudo : </label></b>"+obj.idLiker.pseudo+"</p><p class=\"customer-text\"><b><label> Date de naissance : </label></b>"+obj.idLiker.datenaissance+"</p><p class=\"customer-text\"><b><label> Email : </label></b>"+obj.idLiker.mail+"</p><p class=\"customer-text\"><b><label> Description : </label></b>"+obj.note+"</p><button type=\"button\" id=\"match\" class=\"btn btn-secondary\" value=\""+obj.id+"\">Match</button></div>");
	    	         });	  
	    	         if(data.info.length==0){
	    	        	 $("#annonces").append("<div class=\"container\"> <div class=\"row justify-content-center\"><div class=\"col-md-5\"><div class=\"styled-heading\"><img class=\"img-responsive\" src=\"restaurant-date-calendar-page.png\"><br><br> <h4 class=\"service-heading\">Soyez le premier a Creer un Rendez-vous !</h4><p class=\"text-muted\">Eatogether offre a ses utilisateurs la possiblite de creer un rendez-vous et rencontrez des personnes interessantes</p><h3>Lancez un rendez-vous!</h3></div></div></div>");
	    	       }
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
	$("#annonces").on("click","#match",function(){
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
                
                
                <div class="col-md-4 responsive-wrap">
                    <div class="contact-info">
                    	
                        <div class="address" id="address1">
                            <span class="icon-location-pin"></span>
                        		  <p>${lieu}</p> 
                        </div>
                        <div class="address" id="address-tel">
                           
                           
                        </div>
                        <div class="address" id="address-link">
                           
                        </div>
                        <div class="address" id="address-clock">
                           
                           
                        </div>
                        
                    </div>
                 
                </div>
            </div>
        </div>
    </section>
    <!--//END BOOKING DETAILS -->
    <!--============================= FOOTER =============================-->
    <footer class="main-block dark-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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
    <!-- Magnific popup JS -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- Swipper Slider JS -->
    <script src="js/swiper.min.js"></script>
    <script>
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            slidesPerGroup: 3,
            loop: true,
            loopFillGroupWithBlank: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    </script>
    <script>
        if ($('.image-link').length) {
            $('.image-link').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
        if ($('.image-link2').length) {
            $('.image-link2').magnificPopup({
                type: 'image',
                gallery: {
                    enabled: true
                }
            });
        }
    </script>
</body>

</html>
