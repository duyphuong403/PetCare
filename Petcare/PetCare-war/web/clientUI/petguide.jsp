<%@include file="../templates-Client/header.jsp" %>
<%@include file="../templates-Client/navbar.jsp" %> 
<div id="body">
    <div id="content">
        <div class="content">
            <h2>Pet Guide</h2>
            <div>
                <p> Here are some useful pet quide tips for your pets. Easy and convenient for you to learn more on how to understand them. basic intructions to useful information not just for your pet but also for other animals. </p>
            </div>
            <br>
            <c:forEach items="${petgui}" var="item">


                <ul class="col-md-6 col-lg-4">
                    <li class="article">
                        <span class="product-image">
                            <img src="PetGuideImage/${item.imageName}" alt="Image" class="img-fluid" style="height: 250px;">
                        </span><p> </p>
                        <h2>${item.title} </h2>
                        <p></p>
                        <p> ${item.content}</p>


                    </li>

                </ul>     
            </c:forEach>
        </div>
    </div>


    <%@include file="../templates-Client/footer.jsp" %>