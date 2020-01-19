<%-- 
    Document   : sidebar
    Created on : Jan 18, 2020, 8:36:35 AM
    Author     : ngodu
--%>

<div class="sidebar" data-color="azure" data-background-color="white" data-image="lib/img/sidebar-1.jpg">
    <!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"
    
      Tip 2: you can also add an image using data-image tag
    -->
    <div class="logo">
        <a href="UserController" class="simple-text logo-normal">
            PETCARE
        </a>
    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li class="nav-item active  ">
                <a class="nav-link" href="EmployeeController">
                    <i class="material-icons">dashboard</i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="EmployeeController?action=accounts">
                    <i class="material-icons">person</i>
                    <p>Accounts</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="EmployeeController?action=orders">
                    <i class="material-icons">shopping_cart</i>
                    <p>Orders</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="EmployeeController?action=petguides">
                    <i class="material-icons">content_paste</i>
                    <p>PetGuides</p>
                </a>
            </li>
            <!-- <li class="nav-item ">
                <a class="nav-link" href="EmployeeController?action=products">
                    <i class="material-icons">bubble_chart</i>
                    <p>Products</p>
                </a>
            </li>-->
            <li class="nav-item ">
                <a class="nav-link" href="EmployeeController?action=aboutus">
                    <i class="material-icons">location_ons</i>
                    <p>About Us</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="EmployeeController?action=feedbacks">
                    <i class="material-icons">feedback</i>
                    <p>Feedbacks</p>
                </a>
            </li>
        </ul>
    </div>
</div>
