<%-- 
    Document   : sidebar
    Created on : Jan 18, 2020, 8:36:35 AM
    Author     : ngodu
--%>

<div class="sidebar" data-color="orange" data-background-color="white" data-image="lib/img/sidebar-1.jpg">
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
                <a class="nav-link" href="AdminController">
                    <i class="material-icons">dashboard</i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="AdminController?action=accounts">
                    <i class="material-icons">person</i>
                    <p>Accounts</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="AdminController?action=orders">
                    <i class="material-icons">shopping_cart</i>
                    <p>Orders</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="AdminController?action=petguides">
                    <i class="material-icons">content_paste</i>
                    <p>PetGuides</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="AdminController?action=aboutus">
                    <i class="material-icons">location_ons</i>
                    <p>About Us</p>
                </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="AdminController?action=feedbacks">
                    <i class="material-icons">feedback</i>
                    <p>Feedbacks</p>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="material-icons">account_box</i>
                    <p>Welcome, <b>${curAcc.fullname}</b></p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                    <a class="dropdown-item" href="AdminController?action=profile">Profile</a>
                    <!--<a class="dropdown-item" href="#">Settings</a>-->
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="AdminController?action=logout">Log out</a>
                </div>
            </li>
        </ul>
    </div>
</div>
