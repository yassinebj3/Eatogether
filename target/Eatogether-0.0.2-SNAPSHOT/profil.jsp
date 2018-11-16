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
  <title>Mon profil</title>  
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
	var date_input = document.getElementById("date_naiss").value;
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; 
	var yyyy = today.getFullYear();
	if(dd<10) { dd = '0'+dd } 
	if(mm<10) { mm = '0'+mm } 

	today = yyyy + '-' + mm + '-' + dd;	
	if (today < date_input ) {
	
		alert("Date de naissance doit etre inférieur à celle d'aujourd'hui ");		
		
	}else{
		var form = document.getElementById("form1");
		form.submit();
	}		 
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
                        <form class="form-wrap mt-4" id="form1" method="post" action="Profil">
                        <br>
    							
    							<div class="row d-flex justify-content-center">
    							<div class="col-md-10">
    								     <input id="email" name="email" class="btn-group1" type="email" value="${login}" placeholder="Email" required="true"/>  
    								</div>
    							</div>     
      							<div style="color:red !important" >
      
       							 <c:if test="${err == 'true'}">
      							  <c:out value="  L'utilisateur existe dèja"/>
     									 </c:if>
      
     									 </div><br>
     								<div class="row d-flex justify-content-center">
    							<div class="col-md-10">	 
    								 
   									 <input id="pseudo" name="pseudo" type="text" placeholder="Pseudo" value="${pseudo}" class="btn-group1" required="true"/>
   									 </div></div><br>
   									 <div class="row d-flex justify-content-center">
    							<div class="col-md-10">
      								<input id="nom" name="nom" type="text" value="${nom}" class="btn-group1" placeholder="Nom"/ >
      								</div></div><br>
      								<div class="row d-flex justify-content-center">
    							<div class="col-md-10">
     								 <input id="prenom" name="prenom" type="text" value="${prenom}"  class="btn-group1" placeholder="Prénom" required="true"/>
     								 </div></div><br>
     								 <div class="row d-flex justify-content-center">
    							<div class="col-md-10">
      								<input id="date_naiss" name="date_naiss" class="btn-group1" value="${date_naiss}" type="date" required="true"/>
      								<div id="erreur"></div>
      								</div></div><br>
      								
      								<div class="row d-flex justify-content-center">
                            <div class="col-md-10">
                     
                                    	<input id="homme" class="form-check-input" name="gender" class="btn-group1" type="radio" ${gender=='homme'?'checked':''} /><label>&nbsp;Homme&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> 
    								    <input id="femme" class="form-check-input" name="gender" class="btn-group1" type="radio" ${gender=='femme'?'checked':''} /><label>&nbsp;Femme&nbsp;</label><br/>
    			
    							</div>
    							</div><br>
      								
      									<div class="row d-flex justify-content-center">
    							<div class="col-md-10">
    				
                                         <button onclick="check();" class="btn-form" >Enregistrer</button>
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