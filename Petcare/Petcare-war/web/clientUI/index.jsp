<%-- 
    Document   : index
    Created on : Dec 13, 2019, 10:08:46 AM
    Author     : Dell
--%>
<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>

<div id="body" class="container">
    <div class="banner">&nbsp;</div>
    <div id="content" class="row">
        <div class="content col-8 col-xm-4">
            <ul>
                <c:forEach items="${Articles}" var="article" >
                    <li> <a href="#"><img src="lib/images/${article.imageName}" width="114" height="160" alt=""></a>
                        <h2>${article.title}</h2>
                        <p>${article.content}<a class="more" href="${article.petGuideId}">View all</a></p>
                    </li>
                </c:forEach>

                <li> <a href="#"><img src="lib/images/cat.jpg" width="114" height="160" alt=""></a>
                    <h2>Something good</h2>
                    <p>Gothica, quam nun c putamus parum claram, anteposuerit litterarum formas humani tatis per seacula. <a class="more" href="#">View all</a></p>
                </li>
                <li> <a href="#"><img src="lib/images/koi.jpg" width="114" height="160" alt=""></a>
                    <h2>Kinds of Fish</h2>
                    <p>Quam nunc putamus parum claram, antep osuerit litter arum formas humanitatis per seacula quarta. <a class="more" href="#">View all</a></p>
                </li>
                <li> <a href="#"><img src="lib/images/bird.jpg" width="114" height="160" alt=""></a>
                    <h2>Fun birds</h2>
                    <p>Mirum est notare quam littera gothica , quam nunc putamus parum claram, anteposuerit. <a class="more" href="#">View all</a></p>
                </li>
            </ul>
        </div>
        <div id="sidebar" class="col-4 col-xm-8">
            <%@include file="../templates-Client/formSearch.jsp" %>
            <div class="section">
                <ul class="navigation">
                    <li class="active"><a href="#">Shopping Guides</a></li>
                </ul>
                <div class="aside">
                    <div>
                        <div>
                            <ul>
                                <c:forEach items="${Categories}" var="item">
                                    <li><a href="#">${item.name}</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="../templates-Client/feature.jsp" %>
</div>

    <%@include file="../templates-Client/footer.jsp" %>