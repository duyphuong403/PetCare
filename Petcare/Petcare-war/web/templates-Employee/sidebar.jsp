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
        <ul class="nav" id="nav">
            <li class="nav-item ${order}">
                <a class="nav-link" href="EmployeeController">
                    <i class="material-icons">shopping_cart</i>
                    <p>Orders</p>
                </a>
            </li>
            <li class="nav-item ${category}">
                <a class="nav-link" href="EmployeeController?action=category">
                    <i class="material-icons">category</i>
                    <p>Categories</p>
                </a>
            </li>
            <li class="nav-item ${product}">
                <a class="nav-link" href="EmployeeController?action=product">
                    <i class="material-icons">local_mall</i>
                    <p>Products</p>
                </a>
            </li>
             <li class="nav-item ${unit}">
                <a class="nav-link" href="EmployeeController?action=unit">
                    <i class="material-icons">list_alt</i>
                    <p>Units</p>
                </a>
            </li>
            <li class="nav-item ${account}">
                <a class="nav-link" href="EmployeeController?action=account">
                    <i class="material-icons">person</i>
                    <p>Accounts</p>
                </a>
            </li>
            <li class="nav-item ${petguide}">
                <a class="nav-link" href="EmployeeController?action=petguide">
                    <i class="material-icons">content_paste</i>
                    <p>PetGuides</p>
                </a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link" href="#pablo" id="navbarDropdownProfile" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="material-icons">account_box</i>
                    <p>Welcome, <b>${curAcc.fullname}</b></p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownProfile">
                    <a class="dropdown-item ${profile}" href="UserController?action=profile">Profile</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="AdminController?action=logout">Log out</a>
                </div>
            </li>
        </ul>
    </div>
</div>

