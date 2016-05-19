<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!--%@ taglib prefix="c" uri="http://www.springframework.org/tags" %-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 04.05.2016
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCss" />
    <spring:url value="/resources/css/style.css" var="myCss" />
    <spring:url value="/resources/js/jquery-2.2.3.min.js" var="jqueryJs" />
    <spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJs" />

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>All Ratings - Metascore, Tomatoes, IMDb - All in one place</title>

    <!-- Bootstrap -->
    <link href="${bootstrapCss}" rel="stylesheet">
    <link href="${myCss}" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div id="main-content" class="container">

    <div class="panel panel-default">
        <div class="panel-heading"><h3>${movie.title} (${movie.year})</h3></div>
        <div class="panel-body">
            <div class="img-text">
                <img id="movie-panel-image" src="${movie.poster}">
                <div class="img-text-text">
                    <p>${movie.released}</p>
                    <p>${movie.age}</p>
                    <p>${movie.country}</p>
                    <p>${movie.runtime}</p>
                    <p>${movie.genre}</p>
                </div>
            </div>

            <div class="panel-text">

                <div class="ratings">
                    <h4>
                        <c:if test="${movie.metascore > 60}">
                            <span class="label label-metacritic-good">Metascore: ${movie.metascore}</span>
                        </c:if>

                        <c:if test="${movie.metascore < 40}">
                            <span class="label label-metacritic-bad">Metascore: ${movie.metascore}</span>
                        </c:if>

                        <c:if test="${movie.metascore < 61 && movie.metascore > 39}">
                            <span class="label label-metacritic-medium">Metascore: ${result.metascore}</span>
                        </c:if>


                        <c:if test="${movie.tomatoes >= 60}">
                            <img class="rating-img" src="<c:url value="/resources/img/rating-img/tomato.png"/>">
                        </c:if>
                        <c:if test="${movie.tomatoes < 60}">
                            <img class="rating-img" src="<c:url value="/resources/img/rating-img/rotten.png"/>">
                        </c:if>

                        <span>${movie.tomatoes}%</span>

              <span class="imdbRatingPlugin" data-user="ur51759955" data-title="${movie.imdbID}" data-style="p3">
                <a href="http://www.imdb.com/title/${movie.imdbID}/?ref_=plg_rt_1" target="_blank">
                    <img src="http://g-ecx.images-amazon.com/images/G/01/imdb/plugins/rating/images/imdb_37x18.png" />
                </a>
              </span>
                        <script>(function(d,s,id){var js,stags=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src="http://g-ec2.images-amazon.com/images/G/01/imdb/plugins/rating/js/rating.min.js";stags.parentNode.insertBefore(js,stags);})(document,'script','imdb-rating-api');
                        </script></h4>

                </div>

                <h4>Plot</h4>

                <div class="plot-text">
                    <content>${movie.plot}</content>
                </div>

                <h4>Directed by:</h4><p>${movie.director}</p>
                <h4>Cast:</h4><p>${movie.cast}</p>

            </div>
        </div>

</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${jqueryJs}"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${bootstrapJs}"></script>
</body>
</html>
