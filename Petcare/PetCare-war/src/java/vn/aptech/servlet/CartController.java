/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.servlet;

import vn.aptech.classes.CartBean;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Lonely
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

  public void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String iAction = request.getParameter("action");

    if (iAction != null && !iAction.equals("")) {
      switch (iAction) {
        case "addToCart":
          addToCart(request);
          break;
        case "Update":
          updateCart(request);
          break;
        case "Delete":
          deleteCart(request);
          break;
        default:
          break;
      }
    }
    response.sendRedirect(request.getHeader("referer"));
  }

  protected void deleteCart(HttpServletRequest request) {
    HttpSession session = request.getSession();

    String iSTT = request.getParameter("stt");
    CartBean cartBean = null;

    Object iObject = session.getAttribute("cart");
    if (iObject != null) {
      cartBean = (CartBean) iObject;
    } else {
      cartBean = new CartBean();
    }
    cartBean.deleteCart(iSTT);
  }

  protected void updateCart(HttpServletRequest request) {
    HttpSession session = request.getSession();

    String iQuantity = request.getParameter("quantity");
    String iSTT = request.getParameter("stt");

    CartBean cartBean = null;

    if (session.getAttribute("cart") != null) {
      cartBean = (CartBean) session.getAttribute("cart");
    } else {
      cartBean = new CartBean();
    }
    cartBean.updateCart(iSTT, iQuantity);
  }

  protected void addToCart(HttpServletRequest request) {
    HttpSession session = request.getSession();
    session.setMaxInactiveInterval(3600);
    String imageName = request.getParameter("imageName");
    String iName = request.getParameter("name");
    String iUnit = request.getParameter("unit");
    String iPrice = request.getParameter("price");
    String iQuantity = request.getParameter("quantity");

    CartBean cartBean = null;

    if (session.getAttribute("cart") != null) {
      cartBean = (CartBean) session.getAttribute("cart");
    } else {
      cartBean = new CartBean();
      session.setAttribute("cart", cartBean);
    }

    cartBean.addCart(imageName, iUnit, iName, iPrice, iQuantity);
  }

}
