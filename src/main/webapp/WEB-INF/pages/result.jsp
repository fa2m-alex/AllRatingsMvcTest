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

    <c:forEach items="${results}" var="result">
        <div class="panel panel-default">
            <div class="panel-body">
                <a href="/movies/${result.imdbID}"><img class="panel-image" src="${result.poster}"></a>
                <div class="panel-text">
                    <a href="/movies/${result.imdbID}"><h4>${result.title} (${result.year})</h4></a>
                    <div class="ratings">
                        <h4>
                            <a href="http://www.imdb.com/title/${result.imdbID}/criticreviews?ref_=tt_ov_rt" target="_blank">
                                <c:if test="${result.metascore == 0}">
                                    <span class="label label-default">Metascore: N/A</span>
                                </c:if>
                                
                                <c:if test="${result.metascore > 60}">
                                    <span class="label label-metacritic-good">Metascore: ${result.metascore}</span>
                                </c:if>

                                <c:if test="${result.metascore < 40 && result.metascore > 0}">
                                    <span class="label label-metacritic-bad">Metascore: ${result.metascore}</span>
                                </c:if>

                                <c:if test="${result.metascore < 61 && result.metascore > 39}">
                                    <span class="label label-metacritic-medium">Metascore: ${result.metascore}</span>
                                </c:if>
                            </a>



                            <c:if test="${result.tomatoes == 0}">
                                <span class="label label-default">Tomatoes: N/A</span>
                            </c:if>

                            <c:if test="${result.tomatoes >= 60}">
                                <img class="rating-img" src="<c:url value="/resources/img/rating-img/tomato.png"/>">
                                <span>Tomatoes: ${result.tomatoes}%</span>
                            </c:if>
                            <c:if test="${result.tomatoes < 60 && result.tomatoes > 0}">
                                <img class="rating-img" src="<c:url value="/resources/img/rating-img/rotten.png"/>">
                                <span>Tomatoes: ${result.tomatoes}%</span>
                            </c:if>



                            <a href="http://www.imdb.com/title/${result.imdbID}" target="_blank">
                                <img src="<c:url value="/resources/img/rating-img/imdb.png"/>">
                            </a>
                            <span>${result.imdbRating}</span>

                        </h4>

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
