<%--
  Created by IntelliJ IDEA.
  User: Darine
  Date: 20/10/2018
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form method="post" action="Create">
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

</body>
</html>
