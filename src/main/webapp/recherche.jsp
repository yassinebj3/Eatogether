<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@import url(https://fonts.googleapis.com/css?family=Roboto:300);

.login-page {
  width: 500px;
  padding: 20% 0 0;
  margin: auto;
}
.form {
  position: relative;
  float: left ;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form2 {
  position: relative;
  float : center;
  z-index: 1;
  background: #FFFFFF;
  max-width: 360px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: left;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form button {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #4CAF50;
  font-family: "Roboto", sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
img {
    border-radius: 8px;
    max-width: 100%;
    height: auto;
}

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
    background-color: #111;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<ul>
  <li><a href="test.jsp">Home</a></li>
  <li><a href="profil.jsp">Mon profil</a></li>
  <li><a href="#contact">Contact</a></li>
  <li><a href="#about">About</a></li>
</ul>
		<div class="form">
			<form method="post" action="Recherche">
				<label>Place</label> <input id="place" name="place" type="text" 
				placeholder="Place" />
				 <label>Mot-clé</label> <input id="query"
					name="query" type="text" placeholder="mot-clé" />
					 <label>Rayon</label> <input id="rayon" name="rayon" type="num" /> 
					 <label>Nombre de resultat</label> <input id="limit" name="limit" type="num" />

				<button>Recherche</button>
				<br>
			<div class="form2">
				<c:forEach items="${venue}" var="value">
					<%-- Affiche chacune des valeurs pour la clé donnée --%>
					<label>id :<c:out value="${value.id}" />
					</label>
					<br>
					<label>name :<c:out value="${value.name}" /></label>
					<br>
					<label>Pays <c:out value="${value.location.country }" /></label>
					<br>
					<c:forEach items="${value.categories}" var="categorie">
						<label>Categorie : <c:out value="${categorie.name }" /></label>
						<br>
					</c:forEach>
				</c:forEach>
				<label>ID :</label>
				<c:out value="${info.id }" />
				<br> <label>URL :</label>
				<c:out value="${info.url }" />
				<br> <label>CanonicalURL :</label>
				<c:out value="${info.canonicalURL }" />
				<br> <label>Rating :</label>
				<c:out value="${info.rating }" />
				<br> <label>Description :</label>
				<c:out value="${info.description }" />
				<br> <label>Tel : </label>
				<c:out value="${info.contact.formattedPhone }" />
				<br> <label>Facebook :</label>
				<c:out value="${info.contact.facebookName }" />
				<br> <label>Instagram :</label>
				<c:out value="${info.contact.instagram }" />
				<br> <label>Likes :</label>
				<c:out value="${info.likes.summary }" />
				<br> <label>Menu :</label>
				<c:out value="${info.menu.type }" />
				<br>
				<c:forEach items="${photo}" var="img">
					<label>Image :</label>
					<img src="<c:out value="${img}" />"/>
					<br>
				</c:forEach>
				</div>
			</form>
			</div>
</body>
</html>