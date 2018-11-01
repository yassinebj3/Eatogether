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
    
        <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
 <style>
.container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}
</style>   
   
</head>
<body>
<script>
var test = false ;
var compteurid= 0;
$(document).ready(function(){
	$("#messageText").prop('disabled', true);
	$("#send").prop('disabled',true);
	    $.ajax({
	       url : 'Chatchargement',
	       type : 'GET', // Le type de la requête HTTP, ici devenu POST
	       dataType : 'json',
	    	     success : function(data){
	    	    	 $("#websocket").append("<script>websocket = new WebSocket(\"ws://localhost:8080/Eatogether/chatroomServerEndpoint\");<\/script>");
	    	    	 websocketonmessage1();
	    	    	 $.each(data.Chat, function(i, obj) {
	    	    		$(".inbox_chat").append("<div class=\"chat_list\" id=\"chat"+obj.source+"\"><div class=\"chat_people\"><div class=\"chat_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div><div class=\"chat_ib\" id=\"chat_chat\"><h5>"+obj.source+"<span class=\"chat_date\">Dec 25</span></h5><a id=\"lien"+i+"\" class=\"lien\"><p id=\""+obj.source+"\">"+obj.message+"</p><input id=\"hiden"+i+"\" name=\"hiden\" type=\"hidden\" value="+obj.source+"></input></a></div></div></div>");
	    	   	    	compteurid++ ; 
	    	    	 }); 
	    	    	 
	    	    	 $.each(data.Ami, function(i, obj1) {
		    	    		$(".list-group").append("<li class=\"list-group-item\"><button type=\"button\" class=\"btn btn-primary btn-block\" id=\"ami\" value=\""+obj1+"\">"+obj1+"</button></li>");
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
	$(".list-group").on("click","#ami",function(){
		$("#messageText").prop('disabled', false);
		$("#send").prop('disabled',false);
		$("#msg_history").empty();
		$("#messageText").val("");
		var destination = $("#ami").attr('value');
		 $.ajax({
			 
		      url : 'ChatAffiche',
		      type : 'GET', // Le type de la requête HTTP, ici devenu POST
		      data : 'destination='+destination, // On fait passer nos variables, exactement comme en GET, au script more_com.php
		      dataType : 'json',
		   	     success : function(data){
		   	    	$("#websocket").empty();
		   	    	$("#websocket").append("<script>websocket = new WebSocket(\"ws://localhost:8080/Eatogether/chatroomServerEndpoint\");<\/script>");
		   	    	websocketonmessage();
		   	    	test = true ;
		   	    	if(data[0].number>=3){
		   	    		$("#messageText").val("Vous avez atteint le nombre maximum de message");
		    	   		$("#messageText").prop('disabled',true);
		    	   		$("#send").prop('disabled',true);

		   	    	}
		   	    	
		   	    	$.each(data, function(i, obj) {
		   	    		
		   	    		 if((obj.destination=='${sessionScope.login}')&&(obj.source!='${sessionScope.login}')){
		   	    			 $("#msg_history").append("<div class=\"incoming_msg\"><div class=\"incoming_msg_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div><div class=\"received_msg\"><div class=\"received_withd_msg\"><p>"+obj.message+"</p><span class=\"time_date\"> 11:01 AM    |    June 9</span></div></div>");	 
		   	    		 }
		   	    		 
		   	    		 else if ((obj.destination!='${sessionScope.login}')&&(obj.source=='${sessionScope.login}')){
		   	    			$("#msg_history").append("<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+obj.message+"</p><span class=\"time_date\"> 11:01 AM    |    June 9</span></div></div></div>");

		   	    		 }
		   	    		
		   	    	 });
		   	    	 
	   	 
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
var destination="";
$(document).ready(function(){
	$(".inbox_chat").on("click",".lien",function(){
		$("#messageText").prop('disabled', false);
		$("#send").prop('disabled',false);
		$("#msg_history").empty();
		$("#messageText").val("");
	 var id = $(this).attr("id");
	 destination = $("#"+id).find("input").val();
	 $.ajax({
		 
	      url : 'ChatAffiche',
	      type : 'GET', // Le type de la requête HTTP, ici devenu POST
	      data : 'destination='+destination, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	      dataType : 'json',
	   	     success : function(data){
	   	    	$("#websocket").empty();
	   	    	$("#websocket").append("<script>websocket = new WebSocket(\"ws://localhost:8080/Eatogether/chatroomServerEndpoint\");<\/script>");
	   	    	websocketonmessage();
	   	    	test = true ;
	   	    	if(data[0].number>=3){
	   	    		$("#messageText").val("Vous avez atteint le nombre maximum de message");
	    	   		$("#messageText").prop('disabled',true);
	    	   		$("#send").prop('disabled',true);

	   	    	}
	   	    	
	   	    	$.each(data, function(i, obj) {
	   	    		
	   	    		 if((obj.destination=='${sessionScope.login}')&&(obj.source!='${sessionScope.login}')){
	   	    			 $("#msg_history").append("<div class=\"incoming_msg\"><div class=\"incoming_msg_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div><div class=\"received_msg\"><div class=\"received_withd_msg\"><p>"+obj.message+"</p><span class=\"time_date\"> 11:01 AM    |    June 9</span></div></div>");	 
	   	    		 }
	   	    		 
	   	    		 else if ((obj.destination!='${sessionScope.login}')&&(obj.source=='${sessionScope.login}')){
	   	    			$("#msg_history").append("<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+obj.message+"</p><span class=\"time_date\"> 11:01 AM    |    June 9</span></div></div></div>");

	   	    		 }
	   	    		
	   	    	 });
	   	    	 
   	 
	   	       },

	   	       error : function(resultat, statut, erreur){
	   	    	
	   	       },

	   	       complete : function(resultat, statut){
	   	    	
	   	       }

	   });

		
});
	
	
});</script>

<div id="websocket">

</div>

<script>

function websocketonmessage(){
	websocket.onmessage = function processMessage(message){
	   		var jsonData = JSON.parse(message.data);
	   		if(jsonData.message!=null){
	   			var source = jsonData.username ; 
	   			if(source==destination){
	   			document.getElementById('msg_history').innerHTML += "<div class=\"incoming_msg\"><div class=\"incoming_msg_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div><div class=\"received_msg\"><div class=\"received_withd_msg\"><p>"+jsonData.message+"</p><span class=\"time_date\"> 11:01 AM    |    June 9</span></div></div>";
	   			
	   
	   				if(document.getElementById(jsonData.username)){
	   					
	   					
	   					$('#'+jsonData.username).replaceWith("<b><p id=\""+jsonData.username+"\">"+jsonData.message+"</p></b>");
	   					
	   				}
	   				else{
	   					compteurid++;
	   			document.getElementById('inbox_chat').innerHTML += "<div class=\"chat_list\"><div class=\"chat_people\"><div class=\"chat_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div><div class=\"chat_ib\" id=\"chat_chat\"><h5>"+jsonData.username+"<span class=\"chat_date\">Dec 25</span></h5><a id=\"lien"+compteurid+"\" class=\"lien\"><p id=\""+jsonData.username+"\">"+jsonData.message+"</p><input id=\"hiden"+compteurid+"\" name=\"hiden\" type=\"hidden\" value="+jsonData.username+"></input></div></a></div></div>";
	   				}
	   			  compteur++;
	   		 }
	   	}}}
	   	
function websocketonmessage1(){
	websocket.onmessage = function processMessage(message){
	   		var jsonData = JSON.parse(message.data);
	   		if(jsonData.message!=null){
	   			var source = jsonData.username ; 
	   			if(source!=destination){
		if(document.getElementById(jsonData.username)){
	   					
			$('#'+jsonData.username).replaceWith("<b><p id=\""+jsonData.username+"\">"+jsonData.message+"</p></b>");
			
	   					
	   				}
	   				else{
	   					compteurid++;
	   					document.getElementById('inbox_chat').innerHTML += "<div class=\"chat_list\"><div class=\"chat_people\"><div class=\"chat_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div><div class=\"chat_ib\" id=\"chat_chat\"><h5>"+jsonData.username+"<span class=\"chat_date\">Dec 25</span></h5><a id=\"lien"+compteurid+"\" class=\"lien\"><p id=\""+jsonData.username+"\">"+jsonData.message+"</p><input id=\"hiden"+compteurid+"\" name=\"hiden\" type=\"hidden\" value="+jsonData.username+"></input></div></a></div></div>";
	   			}
	   	}}}}

</script>

<script>

$(document).ready(function(){
	
	$("#send").on("click",function(){
   	 		var valeur = document.getElementById('messageText').value;
   	 		document.getElementById('msg_history').innerHTML += "<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+valeur+"</p><span class=\"time_date\"> 11:01 AM    |    June 9</span></div></div></div>";
   	 		var valeur = messageText.value;
   	 		messageText.value ="";
  	  	websocket.send(valeur);

   	 	$.ajax({
 	       url : 'ChatInsert',
 	       type : 'POST', 
 	       data : 'destination='+destination+'&msg='+valeur,
 	       dataType : 'json',
 	    	     success : function(data){
 	    	   		if(data.number>=3){
 	    	   			
 	    	   			$("#messageText").val("Vous avez atteint le nombre maximum de message");
 	    	   			$("#messageText").prop('disabled',true);
 	    	   			$("#send").prop('disabled',true);
 	    	   			
 	    	   		}
 	    	    	
 	    	    	
 	    	    	 },

 	    	       error : function(resultat, statut, erreur){

 	    	       },

 	    	       complete : function(resultat, statut){

 	    	       }

 	    });
   	 	});
});

</script>
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
                                            <a class="dropdown-item" href="#">Liste d'amis</a>
                                            <a class="dropdown-item" href="#">Messages</a>
                                            <a class="dropdown-item" href="#">Gérer liste d'amis</a>
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
   

    		<script>

$(document).ready(function(){
	$("#dest").click(function(){
		 var destination = $("#destination").val();
	    $.ajax({
	       url : 'UserNameSevlet',
	       type : 'GET', // Le type de la requête HTTP, ici devenu POST
	       data : 'destination='+destination, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	       dataType : 'json',
	    	     success : function(data){
	    	    	$(".msg_history").append("<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+data[0].message+"</p><span class=\"time_date\"> 11:01 AM    |    June 9</span></div></div></div>");
	    	       },

	    	       error : function(resultat, statut, erreur){

	    	       },

	    	       complete : function(resultat, statut){

	    	       }

	    });
	   
	});
});



</script>


    
<div class="container">
  <div class="row justify-content-center">
            
                <div class="col-md-5">
                
                    <div class="styled-heading">
                        <img class="img-responsive" src="chat.png">
                         <br><br>
                          
                          <h4 class="service-heading">Partagez vos messages instantanement !</h4>
            			 <p class="text-muted">Eatogether offre à ses utilisateurs un messenger qui permet d'échanger les messages et s'orginser pour un rendez-vous</p>
                         <h3>Lancez vos discussion !</h3>
                         
                    </div>
                    
                </div>
            </div>
<br><br>
<div class="messaging">
      <div class="inbox_msg">
     
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Recent</h4>
            </div>
          </div>
          <div class="inbox_chat" id="inbox_chat">
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history" id="msg_history">
            
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" id="messageText" name="messageText" />
              <button class="msg_send_btn" type="button" id="send" value="Send"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      
    </div>
    </div>
  
  
     
  
        <div class="container">
            <div class="row justify-content-right">
                <div class="col-md-5">
                <div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Liste d'amis
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
         <ul class="list-group"></ul>
      </div>
    </div>
  </div>
                   
						
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

 <script>
$(document).ready(function(){
	$("#btnid").click(function(){
		 var id = $("#btnid").attr('value')
	    $.ajax({
	       url : 'Recherche',
	       type : 'GET', // Le type de la requête HTTP, ici devenu POST
	       data : 'id='+id, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	       dataType : 'json',
	    	     success : function(data){
	    	    	 $(".modal-body").append("<img src=\""+data.photos.groups[1].items[0].prefix+data.photos.groups[1].items[0].height+"x"+data.photos.groups[1].items[0].width+data.photos.groups[1].items[0].suffix+"\" class=\"img-responsive\" /><br>");
	    	    	 $(".modal-body").append("<label> Facebook : </label>"+data.contact.facebookName+"<br>");
	    	    	 $(".modal-body").append("<label> Instagram : </label>"+data.contact.instagram+"<br>");
	    	    	 $(".modal-body").append("<label> Website : </label>"+data.url+"<br>");
	    	    	 $(".modal-body").append("<label> Likes : </label>"+data.likes.summary+"<br>");
	    	    	 $(".modal-body").append("<label> Rating :</label>"+data.rating+"<br>");
	    	    	 $(".modal-body").append("<label> Menu :</label>"+data.menu.url+"<br>");
	    	    	 $(".modal-body").append("<label> Hours :</label>"+data.hours.status+"<br>");
	    	    	 
	    	    	 
	    	    	 var mymap = L.map('mapid').setView([48.86050541196407, 2.3478661421279465], 13);
	    	    	 L.tileLayer('//{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
	    	    	     attribution: ' &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
	    	    	 }).addTo(mymap);
	    	    	 var marker = L.marker([51.5, -0.09]).addTo(mymap);
	    	    	 
	    	    	 
	    	       },

	    	       error : function(resultat, statut, erreur){

	    	       },

	    	       complete : function(resultat, statut){

	    	       }

	    });
	   
	});
});
</script> 
</body>
</html>