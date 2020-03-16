<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %> 

<style>

  #body #content .content h2 {
    margin: 0px;
     
}
h2 {
    font-family: cursive;
   font-weight: bolder;
    
}
#body #content .content div p {
    margin: 10px 0 0 30px;
    padding:0 15px 0 0;
    font-family: "Myriad Pro";
    font-size:16px;
    line-height:25px;
color: black
}
  
</style>

<div id="body">
    <div id="content">
        <div class="content">
            <h2 style="margin-top: 50px">Pet Guide</h2>
            <div>
                <p> Here are some useful pet quide tips for your pets. Easy and convenient for you to learn more on how to understand them. basic intructions to useful information not just for your pet but also for other animals. </p>
            </div>
            <br>
            <c:forEach items="${petgui}" var="item">

<div class="product">
                <ul class="pagination">
                    <li class="col-md-10">
                        <span class="product-image">
                            <img src="PetGuideImage/${item.imageName}" alt="Image" class="img-fluid" style="height: 250px;">
                        </span>
                          </li>
                        <br>
                        
                        <h2 >${item.title} </h2>
                        <br>
                        
                        <p> ${item.content}</p>
                  

                </ul>  
                        </div>
            </c:forEach>
        </div>
    </div>


    <%@include file="../templates-Client/footer.jsp" %>