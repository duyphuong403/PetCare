<%-- 
    Document   : petguide
    Created on : Dec 13, 2019, 11:02:50 AM
    Author     : Dell
--%>




   
    
    <%@include file="../templates-Client/header.jsp" %>
    
    <%@include file="../templates-Client/navbar.jsp" %> 

    <div id="body">
  <div id="content">
    <div class="content">
      <h2>Pet Guide</h2>
      <div>
        <p> Here are some useful pet quide tips for your pets. Easy and convenient for you to learn more on how to understand them. basic intructions to useful information not just for your pet but also for other animals. </p>
      </div>
      <c:forEach items="${petgui}" var="item">
               
        
      <ul class="section">
        <li>
            <p>${item.imageName} </p>
          <h2>${item.title} </h2>
          <p></p>
          <p> ${item.content}</p>
          

        </li>
        
        
        
      </ul>     
    </c:forEach>
    </div>
  </div>
  

<%@include file="../templates-Client/footer.jsp" %>
