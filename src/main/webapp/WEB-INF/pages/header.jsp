<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alex
  Date: 18.05.2016
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<header>
    <nav class="navbar navbar-default">


        <div class="container-fluid">

            <div class="navbar-header">

                <!--div id="about-link">
                    <a href="#">About</a>
                </div-->

                <form class="navbar-form" role="search" method="post" action="results">
                    <a href="/"><img id="logo-img" alt="Brand" src="<c:url value="/resources/img/logo.png"></c:url>"></a>
                    <div class="form-group">
                        <input type="text" class="form-control search-form" name="query" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>

            </div>

        </div>



    </nav>
</header>
