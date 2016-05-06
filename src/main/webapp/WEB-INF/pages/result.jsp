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
<header>
    <nav class="navbar navbar-default">


        <div class="container-fluid">

            <div class="navbar-header">

                <div id="about-link">
                    <a href="#">About</a>
                </div>

                <form class="navbar-form" role="search" method="post" action="http://localhost:8080/">
                    <a href="#"><img id="logo-img" alt="Brand" src="<c:url value="/resources/img/logo.png"></c:url>"></a>
                    <div class="form-group">
                        <input type="text" class="form-control search-form" name="query" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>

            </div>

        </div>



    </nav>
</header>


<div id="main-content" class="container">

    <c:forEach items="${results}" var="result">
        <div class="panel panel-default">
            <div class="panel-body">
                <img class="panel-image" src="${result.poster}">
                <div class="panel-text">
                    <h4>${result.title} (${result.year})</h4>
                    <div class="ratings">
                        <h3>
                            <c:if test="${result.metascore > 60}">
                                <span class="label label-metacritic-good">Metascore: ${result.metascore}</span>
                            </c:if>

                            <c:if test="${result.metascore < 40}">
                                <span class="label label-metacritic-bad">Metascore: ${result.metascore}</span>
                            </c:if>

                            <c:if test="${result.metascore < 61 && result.metascore > 40}">
                                <span class="label label-metacritic-medium">Metascore: ${result.metascore}</span>
                            </c:if>

                            <img class="rating-img" src="<c:url value="/resources/img/rating-img/rotten.png"/>">
                            <span class="label label-default">Tomatoes: 56%</span>

              <span class="imdbRatingPlugin" data-user="ur51759955" data-title="${result.imdbID}" data-style="p1">
                <a href="http://www.imdb.com/title/${result.imdbID}/?ref_=plg_rt_1" target="_blank">
                    <img src="http://g-ecx.images-amazon.com/images/G/01/imdb/plugins/rating/images/imdb_46x22.png" />
                </a>
              </span>
                            <script>(function(d,s,id){var js,stags=d.getElementsByTagName(s)[0];if(d.getElementById(id)){return;}js=d.createElement(s);js.id=id;js.src="http://g-ec2.images-amazon.com/images/G/01/imdb/plugins/rating/js/rating.min.js";stags.parentNode.insertBefore(js,stags);})(document,'script','imdb-rating-api');
                            </script></h3>

                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

</div>



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${jqueryJs}"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${bootstrapJs}"></script>
</body>
</html>
