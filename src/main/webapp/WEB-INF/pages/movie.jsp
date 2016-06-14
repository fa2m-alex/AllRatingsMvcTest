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
    <link rel="shortcut icon" href="/resources/img/logo.png" type="image/png">

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

                <c:if test="${!movie.poster.equals('N/A')}">
                    <img id="movie-panel-image" src="${movie.poster}">
                </c:if>
                <c:if test="${movie.poster.equals('N/A')}">
                    <img id="movie-panel-image" src="/resources/img/no-image.png">
                </c:if>

                <div class="ratings">
                    <h4>
                        <a href="http://www.imdb.com/title/${movie.imdbID}/criticreviews?ref_=tt_ov_rt" target="_blank">
                            <c:if test="${movie.metascore == 0}">
                                <span class="label label-default">Metascore: N/A</span>
                            </c:if>

                            <c:if test="${movie.metascore > 60}">
                                <span class="label label-metacritic-good">Metascore: ${movie.metascore}</span>
                            </c:if>

                            <c:if test="${movie.metascore < 40 && movie.metascore > 0}">
                                <span class="label label-metacritic-bad">Metascore: ${movie.metascore}</span>
                            </c:if>

                            <c:if test="${movie.metascore < 61 && movie.metascore > 39}">
                                <span class="label label-metacritic-medium">Metascore: ${movie.metascore}</span>
                            </c:if>
                        </a>

                        <br><br>

                        <c:if test="${movie.tomatoes == 0}">
                            <span class="label label-default">Tomatoes: N/A</span>
                        </c:if>

                        <c:if test="${movie.tomatoes >= 60}">
                            <img class="rating-img" src="<c:url value="/resources/img/rating-img/tomato.png"/>">
                            <span>Tomatoes: ${movie.tomatoes}%</span>
                        </c:if>
                        <c:if test="${movie.tomatoes < 60 && movie.tomatoes > 0}">
                            <img class="rating-img" src="<c:url value="/resources/img/rating-img/rotten.png"/>">
                            <span>Tomatoes: ${movie.tomatoes}%</span>
                        </c:if>

                        <br><br>

                        <a href="http://www.imdb.com/title/${movie.imdbID}" target="_blank">
                            <img src="<c:url value="/resources/img/rating-img/imdb.png"/>">
                        </a>
                        <span>${movie.imdbRating}</span>

                    </h4>

                </div>

                <br>

                <h4>Download:</h4>
                <a href="${rarbg}${searchQuery}" target="_blank">Rarbg</a>
                <a href="${toloka}${searchQuery}" target="_blank">Toloka</a>
                <br>
                <a href="${rutracker}${searchQuery}" target="_blank">Rutracker</a>
                <a href="${kickass}${searchQuery}" target="_blank">Kickass</a>

                <br>

                <h4>Subtitles:</h4><a href="${subscene}${searchQuery}" target="_blank">Subscene</a>

            </div>

            <div class="panel-text">


                <h4><b>Plot</b></h4>

                <div class="plot-text">
                    <content>${movie.plot}</content>
                </div>

                <h4><b>Directed by:</b></h4><p>${movie.director}</p>
                <h4><b>Cast:</b></h4><p>${movie.cast}</p>

                <h4><b>Released:</b></h4><p>${movie.released}</p>
                <h4><b>MPAA Rating:</b></h4><p>${movie.age}</p>
                <h4><b>Country:</b></h4><p>${movie.country}</p>
                <h4><b>Runtime:</b></h4><p>${movie.runtime}</p>
                <h4><b>Genre:</b></h4><p>${movie.genre}</p>

            </div>
        </div>
    </div>
</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${jqueryJs}"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${bootstrapJs}"></script>
</body>
</html>
