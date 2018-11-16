<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.login == null}">
    <jsp:forward page = "login.jsp" />
</c:if>
<c:if test="${sessionScope.facebook == true}">
    <jsp:forward page = "recherche.jsp" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gestion de compte</title>

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"
   integrity="sha512-puBpdR0798OZvTTbP4A8Ix/l+A4dHDD0DGqYW6RQ+9jxkRFclaxxQb/SJAWZfWAkuyeQUytO7+7N4QKrDh+drA=="
   crossorigin=""/>

<script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"
   integrity="sha512-nMMmRyTVoLYqjP9hrbed9S+FzjZHW5gY1TWCHA5ckwXZBadntCNs8kEqAWdrb9O7rxbCaA4lKTIWjDXZxflOcA=="
   crossorigin=""></script>
  
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet">
    <link rel="stylesheet" href="css/simple-line-icons.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/rendezvous.css">
</head>
<body>
<script>

function check(){
	var fistInput = document.getElementById("password_nouveau").value;
	var secondInput = document.getElementById("password_nouveau2").value;

	
	
	if (fistInput > secondInput ) {
	
		alert("Les nouveaux mot de passe ne correspondent pas");		
		
	}else if(fistInput < secondInput) {
	      	alert("Les nouveaux mot de passe ne correspondent pas");
	    }else{
	
		  sub();		}
	
	 
}

function sub(){
	var form = document.getElementById("form1");
	form.submit();
	
}


</script>
	<script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/recherche.js"></script>
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
                                    <h5>Partagez vos repas préférés dans un cadre conviviale..</h5>
                                </div>
                            </div>
                        </div>
                        <form class="form-wrap mt-4" method="post" action="Compte" id="form1">
                        <br>
    							
    							<div class="row d-flex justify-content-center">
    							<div class="col-md-10">
    								    <input id="password_ancien" name="password_ancien" type="password" placeholder="Tapez votre ancien mot de passe" class="btn-group1" required="true"/>
    								</div>
    							</div>     
      							<br>
     								 
   									 <div class="row d-flex justify-content-center">
    							<div class="col-md-10">
      								 <input id="password_nouveau" name="password_nouveau" type="password" placeholder="Tapez votre nouveau mot de passe" class="btn-group1"/>
      								</div></div><br>
      							
      							
      								 <div class="row d-flex justify-content-center">
    							<div class="col-md-10">
      								<input id="password_nouveau2" name="password_nouveau2" type="password" placeholder="Retapez votre nouveau mot de passe" class="btn-group1" />
      								</div></div><br>
      							
      							
      							
      							
      							
      									<div class="row d-flex justify-content-center">
    							<div class="col-md-10">             
                                         <button id="btn" class="btn-form" onclick="check();" >MODIFIER</button>
                                  <div id="profile">

									</div>  
										 <c:if test="${err != null}">
         								 <br>
         								 <div style="color:red !important" >
      							 		<b><c:out value="${err}"/></b>
     									 </div>      
      									  </c:if>    
			  								
                                        </div></div><br><br>
                                        <div class="row d-flex justify-content-center">
                                        <div class="col-md-10">
                                            <a href="recherche.jsp" class="btn-form">Retour</a>
                                        </div></div>
                                         </form><br><br><br>
                                         
                                         <img class="img-responsive" src="images/foursquare1.png"><br>
                                         
                                    </div>
                            </div>
                       </div>
                </div>
    </section>
</body>
</html>

</body>
</html>