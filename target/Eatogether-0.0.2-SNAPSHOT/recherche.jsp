<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
                                <div class="slider-link">
                                    <a href="#">Browse Popular</a><span>or</span> <a href="#">Recently Addred</a>
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
                        <h3>Featured Places</h3>
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
							<a href="#" class="btn btn-danger" role="Plus de détails" data-toggle="modal" data-target="#exampleModal" id="btnid" value="<c:out value="${value.id}"/>">Plus de détails</a> 
							<a href="#" class="btn btn-default" role="Match">Match</a>
							</div>
					
                    </div>
                </div>
            </div>
           </c:forEach>
           </div> 
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="#" class="btn btn-danger">VIEW ALL</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//END FEATURED PLACES -->
    
<!-- <nav class="navbar navbar-light" style="background-color: #E8EDF9;">
	<div class="collapse navbar-collapse" id="navbarText">
		<ul class="nav navbar-nav">
			<li class="nav-item"><a href="test.jsp" class="nav-link">Home</a></li>
			<li class="nav-item"><a href="profil.jsp" class="nav-link">Mon profil</a></li>
			<li class="nav-item"><a href="#contact" class="nav-link">Contact</a></li>
			<li class="nav-item"><a href="#about" class="nav-link">About</a></li>
		</ul>
	</div>
</nav> -->

<section class="main-block">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="styled-heading">
                        <h3>Browse Categories</h3>
                    </div>
                </div>
            </div>
          <div class="row"  align="center">
                <div class="col-md-3 category-responsive">
                    <a href="#" class="category-wrap">
                        <div class="category-block">
                            <svg class="category-img" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Layer_3" x="0px" y="0px" viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve" width="512px" height="512px"><g><g>
              <g>
                <path d="M454.976,43.056c-3.591-3.588-9.411-3.591-13.003,0l-95.329,95.326c-3.592,3.591-3.592,9.411-0.001,13.003    c1.796,1.795,4.148,2.692,6.502,2.692c2.352,0,4.706-0.897,6.502-2.692l95.329-95.326    C458.566,52.467,458.566,46.646,454.976,43.056z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M480.9,68.571c-3.592-3.589-9.412-3.589-13.003,0l-95.328,95.328c-3.59,3.592-3.59,9.412-0.001,13.003    c1.796,1.795,4.15,2.692,6.502,2.692c2.352,0,4.706-0.897,6.502-2.692L480.9,81.573C484.491,77.982,484.491,72.161,480.9,68.571z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M390.969,229.548L509.307,111.21c3.591-3.592,3.591-9.412,0-13.003c-3.592-3.588-9.412-3.591-13.003,0L377.968,216.545    c-14.579,14.578-36.871,18.403-55.47,9.521c-3.7-1.766-8.118-0.873-10.839,2.193l-40.209,45.303    c-0.016,0.017-0.034,0.032-0.05,0.05c-0.016,0.018-0.028,0.037-0.044,0.055L97.567,469.464c-0.044,0.05-0.088,0.101-0.131,0.152    c-0.573,0.673-1.114,1.264-1.662,1.813c-11.475,11.474-30.145,11.473-41.615,0c-5.558-5.557-8.619-12.948-8.619-20.808    s3.061-15.25,8.629-20.818c0.534-0.537,1.124-1.076,1.803-1.654c0.052-0.043,0.102-0.087,0.152-0.131l108.648-96.434    c3.798-3.371,4.143-9.182,0.773-12.979c-3.371-3.799-9.183-4.146-12.979-0.773L43.99,414.202    c-1.038,0.885-1.967,1.742-2.833,2.609c-9.031,9.031-14.005,21.038-14.005,33.81c0,12.771,4.973,24.779,14.004,33.81    c9.323,9.321,21.566,13.982,33.812,13.981c12.241,0,24.487-4.659,33.803-13.976c0.883-0.881,1.738-1.811,2.616-2.839    l132.432-149.206l132.434,149.208c0.877,1.029,1.732,1.959,2.609,2.834c9.321,9.321,21.565,13.981,33.809,13.981    c12.245,0,24.49-4.661,33.812-13.982c18.64-18.643,18.64-48.975,0.005-67.613c-0.88-0.883-1.811-1.738-2.838-2.615    l-152.391-135.26l29.815-33.592C345.231,253.911,372.565,247.949,390.969,229.548z M431.514,428.019    c0.05,0.044,0.101,0.088,0.152,0.131c0.673,0.573,1.264,1.114,1.813,1.662c11.473,11.474,11.473,30.143,0.001,41.615    c-11.475,11.473-30.144,11.473-41.622-0.005c-0.543-0.543-1.086-1.135-1.659-1.808c-0.043-0.051-0.087-0.102-0.131-0.152    L256.111,318.54l22.939-25.845L431.514,428.019z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M427.379,16.278c-3.592-3.589-9.412-3.589-13.003,0L296.04,134.617c-18.406,18.404-24.366,45.735-15.807,69.897    l-36.415,32.322l-34.998-31.064c18.099-35.612,11.492-78.851-17.222-107.566c-28.518-28.518-61.55-48.587-93.011-56.508    c-32.843-8.267-61.001-2.748-79.295,15.545s-23.814,46.455-15.545,79.296c7.922,31.459,27.99,64.491,56.51,93.008    c28.714,28.716,71.952,35.323,107.566,17.223c0,0,34.225,38.558,34.659,39.048c1.817,2.047,4.342,3.09,6.88,3.09    c2.171,0,4.349-0.764,6.1-2.318l81.866-72.664c3.065-2.721,3.958-7.141,2.193-10.839c-8.884-18.601-5.058-40.891,9.521-55.468    L427.379,29.281C430.97,25.689,430.97,19.869,427.379,16.278z M210.131,266.737l-33.468-37.706    c-2.964-3.339-7.902-4.069-11.702-1.722c-29.478,18.177-67.188,13.754-91.704-10.763c-26.204-26.203-44.557-56.21-51.68-84.497    c-6.625-26.317-2.819-48.267,10.718-61.803C45.83,56.708,67.78,52.904,94.096,59.53c28.287,7.122,58.296,25.474,84.498,51.678    c24.516,24.515,28.94,62.225,10.762,91.703c-2.344,3.801-1.617,8.737,1.722,11.702l38.888,34.516L210.131,266.737z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g></g> </svg>
                            <h6>Restaurant</h6>
                        </div>
                    </a>
                </div>
           

           
                <div class="col-md-3 category-responsive">
                    <a href="#" class="category-wrap">
                        <div class="category-block">
                            <svg class="category-img" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_3" x="0px" y="0px" viewBox="0 0 511.988 511.988" style="enable-background:new 0 0 511.988 511.988;" xml:space="preserve" width="512px"
                                height="512px"><g><g>
              <g>
                <path d="M489.865,433.23c-1.643-3.989-5.547-6.592-9.856-6.592H10.676c-4.309,0-8.213,2.603-9.856,6.592    c-1.664,3.989-0.747,8.576,2.304,11.627l23.915,23.915c11.371,11.349,25.003,21.867,47.616,21.867h341.333    c22.613,0,36.245-10.517,47.659-21.867l23.915-23.915C490.612,441.806,491.529,437.22,489.865,433.23z M448.521,453.689    c-11.541,11.541-20.053,15.616-32.533,15.616H74.655c-12.48,0-20.992-4.075-32.533-15.616l-5.717-5.717h417.835L448.521,453.689z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M373.322,191.972h-256c-17.643,0-32,14.357-32,32v64c0,61.333,27.691,118.784,75.947,157.632    c4.608,3.691,11.328,2.987,14.997-1.621c3.691-4.587,2.965-11.307-1.621-14.997c-43.221-34.773-68.011-86.165-68.011-141.013v-64    c0-5.867,4.779-10.667,10.667-10.667h256c5.888,0,10.667,4.8,10.667,10.667v64c0,54.827-24.789,106.219-68.011,141.013    c-4.587,3.691-5.312,10.411-1.621,14.997c2.112,2.645,5.205,3.989,8.32,3.989c2.347,0,4.715-0.768,6.677-2.347    c48.299-38.869,75.989-96.32,75.989-157.653v-64C405.322,206.329,390.964,191.972,373.322,191.972z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M328.372,102.628c17.344-21.675,17.344-55.616,0-77.291c-3.691-4.565-10.389-5.333-14.997-1.664    c-4.587,3.691-5.333,10.389-1.664,14.997c10.987,13.739,10.987,36.885-0.021,50.667c-17.344,21.675-17.344,55.616,0,77.291    c2.112,2.645,5.205,4.011,8.341,4.011c2.325,0,4.693-0.768,6.635-2.347c4.608-3.691,5.355-10.389,1.664-14.997    C317.343,139.556,317.343,116.409,328.372,102.628z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M264.308,102.628c17.344-21.675,17.344-55.616,0-77.291c-3.669-4.565-10.389-5.333-14.997-1.664    c-4.608,3.691-5.355,10.389-1.664,14.997c10.987,13.739,10.987,36.885-0.043,50.667c-17.344,21.675-17.344,55.616,0,77.291    c2.112,2.645,5.205,4.011,8.341,4.011c2.325,0,4.672-0.768,6.677-2.347c4.587-3.691,5.333-10.389,1.664-14.997    C253.3,139.556,253.3,116.409,264.308,102.628z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M200.372,102.628c17.344-21.675,17.344-55.616,0-77.291c-3.691-4.565-10.368-5.333-14.997-1.664    c-4.587,3.691-5.333,10.411-1.664,14.997c10.987,13.739,10.987,36.885-0.021,50.667c-17.344,21.675-17.344,55.616,0,77.291    c2.112,2.645,5.205,4.011,8.341,4.011c2.325,0,4.693-0.768,6.656-2.325c4.608-3.691,5.355-10.389,1.664-14.997    C189.364,139.577,189.364,116.409,200.372,102.628z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g><g>
              <g>
                <path d="M447.988,213.305c-35.285,0-64,28.715-64,64s28.715,64,64,64c35.285,0,64-28.715,64-64S483.273,213.305,447.988,213.305z     M447.988,319.972c-23.531,0-42.667-19.136-42.667-42.667c0-23.531,19.136-42.667,42.667-42.667    c23.531,0,42.667,19.136,42.667,42.667C490.655,300.836,471.519,319.972,447.988,319.972z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
              </g>
            </g></g> </svg>
                            <h6>Coffee</h6>
                        </div>
                    </a>
                </div>
                <div class="col-md-3 category-responsive">
                    <a href="#" class="category-wrap">
                        <div class="category-block">
                            <svg class="category-img" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_4" x="0px" y="0px" viewBox="0 0 33 33" style="enable-background:new 0 0 33 33;" xml:space="preserve" width="512px" height="512px"><g><g>
              <g>
                <path d="M20.136,33h-9.212c-2.397,0-4.349-1.951-4.349-4.349V11.265c0-0.276,0.224-0.5,0.5-0.5h16.828    c0.276,0,0.581,0.224,0.581,0.5v17.387C24.484,31.049,22.533,33,20.136,33z M7.575,11.765v16.887c0,1.847,1.502,3.349,3.349,3.349    h9.212c1.847,0,3.349-1.502,3.349-3.349V11.765H7.575z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
                <path d="M26.096,25.574h-2.111c-0.276,0-0.5-0.224-0.5-0.5s0.224-0.5,0.5-0.5h2.111c1.005,0,1.823-0.818,1.823-1.823v-4.693    c0-1.006-0.818-1.824-1.823-1.824h-2.111c-0.276,0-0.5-0.224-0.5-0.5s0.224-0.5,0.5-0.5h2.111c1.557,0,2.823,1.267,2.823,2.824    v4.693C28.919,24.308,27.652,25.574,26.096,25.574z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
                <g>
                  <path d="M11.376,28.365c-0.276,0-0.5-0.224-0.5-0.5V15.691c0-0.276,0.224-0.5,0.5-0.5s0.5,0.224,0.5,0.5v12.174     C11.876,28.142,11.652,28.365,11.376,28.365z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
                  <path d="M19.683,28.365c-0.276,0-0.5-0.224-0.5-0.5V15.691c0-0.276,0.224-0.5,0.5-0.5s0.5,0.224,0.5,0.5v12.174     C20.183,28.142,19.959,28.365,19.683,28.365z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
                  <path d="M15.529,28.365c-0.276,0-0.5-0.224-0.5-0.5V15.691c0-0.276,0.224-0.5,0.5-0.5s0.5,0.224,0.5,0.5v12.174     C16.029,28.142,15.806,28.365,15.529,28.365z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
                </g>
              </g>
              <path d="M23.698,11.765H7.361c-1.809,0-3.28-1.472-3.28-3.28s1.472-3.28,3.28-3.28h0.239C7.936,2.249,10.413,0,13.438,0   c1.795,0,3.482,0.819,4.596,2.213c0.487-0.207,0.993-0.312,1.508-0.312c1.952,0,3.586,1.417,3.909,3.303h0.247   c1.809,0,3.28,1.472,3.28,3.28S25.507,11.765,23.698,11.765z M7.361,6.204c-1.258,0-2.28,1.022-2.28,2.28s1.022,2.28,2.28,2.28   h16.337c1.258,0,2.28-1.022,2.28-2.28s-1.022-2.28-2.28-2.28h-0.693c-0.267,0-0.485-0.208-0.499-0.475   c-0.082-1.586-1.384-2.828-2.964-2.828c-0.485,0-0.964,0.128-1.423,0.38c-0.223,0.124-0.508,0.056-0.652-0.155   C16.554,1.795,15.048,1,13.438,1c-2.646,0-4.786,2.073-4.873,4.721c-0.009,0.27-0.23,0.483-0.5,0.483H7.361z" data-original="#000000" class="active-path" data-old_color="#ff3a6d" fill="#ff3a6d"/>
            </g></g> </svg>
                            <h6>Club & Bar</h6>
                        </div>
                    </a>
                </div>
            </div>
        
    </section>
    <!--//END CATEGORIES -->
    
    <section class="testimonials text-center bg-light">
      <div class="container">
        <h2 class="mb-5">Ce que les gens disent...</h2>
        <div class="row">
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="1.jpg" alt="">
              <h5>Zakaria </h5>
              <p class="font-weight-light mb-0">"Partagez vos repas"</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="1.jpg" alt="">
              <h5>Darine </h5>
              <p class="font-weight-light mb-0">"Rencontrez des nouvelles personnes"</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="3.jpg" alt="">
              <h5>Yassine</h5>
              <p class="font-weight-light mb-0">"Changez votre vie "</p>
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
                        <h2>Reach millions of People</h2>
                        <p>Add your Business infront of millions and earn 3x profits from our listing</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="featured-btn-wrap">
                        <a href="#" class="btn btn-danger"><span class="ti-plus"></span> ADD LISTING</a>
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
    <!--    <c:forEach items="${photo}" var="img">
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
		</c:forEach>--> 
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