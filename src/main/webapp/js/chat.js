var test = false ;
var compteurid= 0;
$(document).ready(function(){
	$("#messageText").prop('disabled', true);
	$("#send").prop('disabled',true);
	    $.ajax({
	       url : 'Chatchargement',
	       type : 'GET', 
	       dataType : 'json',
	    	     success : function(data){
	    	    	 $("#websocket").append("<script>websocket = new WebSocket(\"wss://"+window.location.host+"/chatroomServerEndpoint\");<\/script>");
	    	    	 websocketonmessage1();
	    	    	 $.each(data.Chat, function(i, obj) {
	    	    		 $.each(data.Ami,function(j,obj2){
	    	    			 if(obj.source==obj2.adressemail){
	    	    			 $(".inbox_chat").append("<div class=\"chat_list\" id=\"chat"+obj.source+"\"><div class=\"chat_people\"><div class=\"chat_img\"> <img id=\"imglien"+i+"\" src=\""+obj2.image+"\" alt=\"sunil\"> </div><div class=\"chat_ib\" id=\"chat_chat\"><h5>"+obj.source+"</h5><a id=\"lien"+i+"\" class=\"lien\"><p id=\""+obj.source+"\">"+obj.message+"</p><input id=\"hiden"+i+"\" name=\"hiden\" type=\"hidden\" value="+obj.source+"></input></a></div></div></div>");
	    	    			 }
	    	    		 });
	    	   	    	compteurid++ ; 
	    	    	 }); 
	    	    	 
	    	    	 $.each(data.Ami, function(i, obj1) {
		    	    		$(".list-group").append("<li class=\"list-group-item\"><button type=\"button\" class=\"btn btn-light \" id=\"ami\" value=\""+obj1.adressemail+"\"><img id=\"img"+obj1.adressemail+"\" src=\""+obj1.image+"\"class=\"img-fluid\" alt=\"Responsive image\" ></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+obj1.adressemail+"</button></li>");
		    	    	 }); 

	    	    	 },

	    	       error : function(resultat, statut, erreur){

	    	       },

	    	       complete : function(resultat, statut){

	    	       }

	    });
	});


var destination="";
$(document).ready(function(){
	$(".list-group").on("click","#ami",function(){
		$("#messageText").prop('disabled', false);
		$("#send").prop('disabled',false);
		$("#msg_history").empty();
		$("#messageText").val("");
		destination = $(this).attr('value');
		var photo1 = $(this).find("img").attr("src");
	
		 $.ajax({
			 
		      url : 'ChatAffiche',
		      type : 'GET', // Le type de la requête HTTP, ici devenu POST
		      data : 'destination='+destination, // On fait passer nos variables, exactement comme en GET, au script more_com.php
		      dataType : 'json',
		   	     success : function(data){
		   	    	$("#websocket").empty();
		   	    	$("#websocket").append("<script>websocket = new WebSocket(\"wss://"+window.location.host+"/chatroomServerEndpoint\");<\/script>");
		   	    	websocketonmessage();
		   	    	test = true ;
		   	    	try{
		   	    	if(data[0].number>=3){
		   	    		$("#messageText").val("Vous avez atteint le nombre maximum de message");
		    	   		$("#messageText").prop('disabled',true);
		    	   		$("#send").prop('disabled',true);

		   	    	}}catch(error){
		   	    		
		   	    	}
		   	    	
		   	    	$.each(data, function(i, obj) {
		   	    		
		   	    		 if((obj.destination==login)&&(obj.source!=login)){
		   	    			 $("#msg_history").append("<div class=\"incoming_msg\"><div class=\"incoming_msg_img\"> <img src=\""+photo1+"\" alt=\"sunil\"> </div><div class=\"received_msg\"><div class=\"received_withd_msg\"><p>"+obj.message+"</p></div></div>");	
		   	    			
		   	    		 }
		   	    		 
		   	    		 else if ((obj.destination!=login)&&(obj.source==login)){
		   	    			$("#msg_history").append("<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+obj.message+"</p></div></div></div>");
		   	    		
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

$(document).ready(function(){
	$(".inbox_chat").on("click",".lien",function(){
		$("#messageText").prop('disabled', false);
		$("#send").prop('disabled',false);
		$("#msg_history").empty();
		$("#messageText").val("");
	 var id = $(this).attr("id");
	 destination = $("#"+id).find("input").val();
	 var photo1 = $("#img"+id).attr("src");
	 $.ajax({
		 
	      url : 'ChatAffiche',
	      type : 'GET', // Le type de la requête HTTP, ici devenu POST
	      data : 'destination='+destination, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	      dataType : 'json',
	   	     success : function(data){
	   	    	$("#websocket").empty();
	   	    	$("#websocket").append("<script>websocket = new WebSocket(\"wss://"+window.location.host+"/chatroomServerEndpoint\");<\/script>");
	   	    	websocketonmessage();
	   	    	test = true ;
	   	    	if(data[0].number>=3){
	   	    		$("#messageText").val("Vous avez atteint le nombre maximum de message");
	    	   		$("#messageText").prop('disabled',true);
	    	   		$("#send").prop('disabled',true);

	   	    	}
	   	    	
	   	    	$.each(data, function(i, obj) {
	   	    		
	   	    		 if((obj.destination==login)&&(obj.source!=login)){
	   	    			 $("#msg_history").append("<div class=\"incoming_msg\"><div class=\"incoming_msg_img\"> <img src=\""+photo1+"\" alt=\"sunil\"> </div><div class=\"received_msg\"><div class=\"received_withd_msg\"><p>"+obj.message+"</p></div></div>");	 
	   	    		 }
	   	    		 
	   	    		 else if ((obj.destination!=login)&&(obj.source==login)){
	   	    			$("#msg_history").append("<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+obj.message+"</p></div></div></div>");

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


function websocketonmessage(){
	websocket.onmessage = function processMessage(message){
	   		var jsonData = JSON.parse(message.data);
	   		if(jsonData.message!=null){
	   			var source = jsonData.username ; 
	   			console.log(source);
	   			console.log(destination);
	   			if(source==destination){
	   			var photo1 = $("img[id='img"+jsonData.username+"']").attr("src");
	   			document.getElementById('msg_history').innerHTML += "<div class=\"incoming_msg\"><div class=\"incoming_msg_img\"> <img src=\""+photo1+"\" alt=\"sunil\"> </div><div class=\"received_msg\"><div class=\"received_withd_msg\"><p>"+jsonData.message+"</p></div></div>";
	   			
	   
	   				if(document.getElementById(jsonData.username)){
	   					
	   					
	   					$("p[id='"+jsonData.username+"']").replaceWith("<b><p id=\""+jsonData.username+"\">"+jsonData.message+"</p></b>");
	   					
	   				}
	   				else{
	   					compteurid++;
	   					var photo1 = $("img[id='img"+jsonData.username+"']").attr("src");
	   			document.getElementById('inbox_chat').innerHTML += "<div class=\"chat_list\"><div class=\"chat_people\"><div class=\"chat_img\"> <img id=\"imglien"+compteurid+"\" src=\""+photo1+"\" alt=\"sunil\"> </div><div class=\"chat_ib\" id=\"chat_chat\"><h5>"+jsonData.username+"</h5><a id=\"lien"+compteurid+"\" class=\"lien\"><p id=\""+jsonData.username+"\">"+jsonData.message+"</p><input id=\"hiden"+compteurid+"\" name=\"hiden\" type=\"hidden\" value="+jsonData.username+"></input></div></a></div></div>";
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
	   					
			$("p[id='"+jsonData.username+"']").replaceWith("<b><p id=\""+jsonData.username+"\">"+jsonData.message+"</p></b>");
			
	   					
	   				}
	   				else{
	   					var photo1 = $("img[id='img"+jsonData.username+"']").attr("src");
	   					compteurid++;
	   					document.getElementById('inbox_chat').innerHTML += "<div class=\"chat_list\"><div class=\"chat_people\"><div class=\"chat_img\"> <img id=\"imglien"+compteurid+"\" src=\""+photo1+"\" alt=\"sunil\"> </div><div class=\"chat_ib\" id=\"chat_chat\"><h5>"+jsonData.username+"<span class=\"chat_date\">Dec 25</span></h5><a id=\"lien"+compteurid+"\" class=\"lien\"><p id=\""+jsonData.username+"\">"+jsonData.message+"</p><input id=\"hiden"+compteurid+"\" name=\"hiden\" type=\"hidden\" value="+jsonData.username+"></input></div></a></div></div>";
	   			}
	   	}}}}


$(document).ready(function(){
	
	$("#send").on("click",function(){
			if(messageText.value.length === 0){
				alert("Veuillez écrire un message !");
			}
			else{
   	 		var valeur = document.getElementById('messageText').value;
   	 		document.getElementById('msg_history').innerHTML += "<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+valeur+"</p></div></div></div>";
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
			}
   	 	});
	
});

$(document).ready(function(){
	$("#dest").click(function(){
		 var destination = $("#destination").val();
	    $.ajax({
	       url : 'UserNameSevlet',
	       type : 'GET', // Le type de la requête HTTP, ici devenu POST
	       data : 'destination='+destination, // On fait passer nos variables, exactement comme en GET, au script more_com.php
	       dataType : 'json',
	    	     success : function(data){
	    	    	$(".msg_history").append("<div class=\"incoming_msg\"><div class=\"outgoing_msg\"><div class=\"sent_msg\"><p>"+data[0].message+"</p></div></div></div>");
	    	       },

	    	       error : function(resultat, statut, erreur){

	    	       },

	    	       complete : function(resultat, statut){

	    	       }

	    });
	   
	});
});

$(window).scroll(function() {
    // 100 = The point you would like to fade the nav in.

    if ($(window).scrollTop() > 100) {

        $('.fixed').addClass('is-sticky');

    } else {

        $('.fixed').removeClass('is-sticky');

    };
});

