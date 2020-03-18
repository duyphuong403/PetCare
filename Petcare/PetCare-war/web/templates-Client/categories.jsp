<%-- 
    Document   : categories
    Created on : Mar 15, 2020, 2:54:51 PM
    Author     : Dell
--%>
<style>
  li>a {
    font-size: 20px;
  }
</style>
<h3 class="widget_title">Categories</h3>
<hr/>
<ul>
  <li><a href="UserController?action=petmart">All</a></li>
  <c:forEach items="${Categories}" var="item">
    <li><a href="UserController?action=petmart&category=${item.cateId}">${item.name}</a></li>
  </c:forEach>
</ul>
