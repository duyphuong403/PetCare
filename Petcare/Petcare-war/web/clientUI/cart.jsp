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
        
        <div id="sidebar" class="col-4 col-xm-8">
            
            
            Se Them Code vao day
            
            
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