<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>
<nav class="navbar navbar-light" style="background-color: #E8EDF9;">
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="nav navbar-nav">
			<li class="nav-item"><a href="test.jsp" class="nav-link">Home</a></li>
			<li class="nav-item"><a href="profil.jsp" class="nav-link">Mon profil</a></li>
			<li class="nav-item"><a href="#contact" class="nav-link">Contact</a></li>
			<li class="nav-item"><a href="#about" class="nav-link">About</a></li>
		</ul>
	</div>
</nav>
	<div class="container-fluid">
		<form method="post" action="Recherche">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label>Place</label> <input id="place" name="place" type="text"
						placeholder="Place" class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label>Mot-clé</label> <input id="query" name="query" type="text"
						placeholder="mot-clé" class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label>Rayon</label><input id="rayon" name="rayon" type="num"
						class="form-control" />
				</div>
				<div class="form-group col-md-6">
					<label>Nombre de resultat</label> <input id="limit" name="limit"
						type="num" class="form-control" />
				</div>
				<button class="btn btn-primary">Recherche</button>
				<br>
			</div>
		</form>
		<div class="row">
		<c:forEach items="${venue}" var="value">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<div class="caption">
						<h3><c:out value="${value.name}" /></h3>
						<p>
							
							<label> Pays :</label>	<c:out value="${value.location.country }" /><br>
							<c:forEach items="${value.categories}" var="categorie">
							<label>Categorie :</label>		<c:out value="${categorie.name }" /><br>
							</c:forEach>
						</p>
						<p>
							<a href="#" class="btn btn-primary" role="Plus de détails" data-toggle="modal" data-target="#exampleModal" id="btnid" value="<c:out value="${value.id}"/>">Plus de détails</a> <a
							href="#" class="btn btn-default" role="Match">Match</a>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
			
			
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
       <c:forEach items="${photo}" var="img">
							<img src="<c:out value="${img}" /> "class="img-responsive" /><br>
							<label>Site :</label><c:out value="${info.url }" /><br>
							<label></label><c:out value="${info.canonicalURL }" /><br>
							<label>Rating :</label><c:out value="${info.rating }" /><br>
							<label>Phone Number :</label><c:out value="${info.contact.formattedPhone }" /><br>
							<label>Facebook :</label><c:out value="${info.contact.facebookName }" /><br>
							<label>instagram :</label><c:out value="${info.contact.instagram }" /><br>
							<label>Likes :</label><c:out value="${info.likes.summary }" /><br>
							<label>Types :</label><c:out value="${info.menu.type }" /><br>
							<label>Descrption :</label><c:out value="${info.description }" /><br>
		</c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
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
	    	    	 
	    	    	 
	    	    	 
	    	    	 
	    	       },

	    	       error : function(resultat, statut, erreur){

	    	       },

	    	       complete : function(resultat, statut){

	    	       }

	    });
	   
	});
});
</script> 
	<!--  	<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="..." alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>...</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>

			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="..." alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>...</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="..." alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>...</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="..." alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>...</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Button</a> <a
								href="#" class="btn btn-default" role="button">Button</a>
						</p>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="..." alt="...">
					<div class="caption">
						<h3>Thumbnail label</h3>
						<p>...</p>
						<p>
							<a href="#" class="btn btn-primary" role="button">Plus de détails</a> <a
								href="#" class="btn btn-default" role="button">Rendez-vous</a>
						</p>
					</div>
				</div>
			</div>
		</div> -->
	</div>





</body>
</html>