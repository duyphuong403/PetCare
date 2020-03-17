<%-- 
    Document   : index
    Created on : Dec 13, 2019, 10:08:46 AM
    Author     : Dell
--%>
<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %>
<style>
  .show-read-more{
    display: inline-block;
    width: 12em;
    white-space: nowrap;
    overflow: hidden !important;
    text-overflow: ellipsis;
  }
</style>
<div id="body" class="container">
  <div class="banner">&nbsp;</div>
  <div id="content" class="row">
    <div class="content col-8 col-xm-4">
      <ul>
        <c:forEach items="${Articles}" var="article" >
          <li> <a href="UserController?action=petguides"><img src="PetGuideImage/${article.imageName}" width="114" height="160" alt="${article.imageName}"></a>
            <h2>${article.title}</h2>
            <p class="show-read-more">${article.content}</p>
          </li>
        </c:forEach>        
      </ul>
    </div>
    <div id="sidebar" class="col-4 col-xm-8">
      <%@include file="../templates-Client/formSearch.jsp" %>
      <div class="section">
        <ul class="navigation">
          <li class="active"><a href="#">Categories</a></li>
        </ul>
        <div class="aside">
          <div>
            <div>
              <ul>
                <c:forEach items="${Categories}" var="item">
                  <li><a href="UserController?action=petmart&category=${item.cateId}">${item.name}</a></li>
                  </c:forEach>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<%@include file="../templates-Client/footer.jsp" %>