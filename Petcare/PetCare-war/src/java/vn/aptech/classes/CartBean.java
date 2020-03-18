/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.classes;

/**
 *
 * @author Dell
 */
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class CartBean {

  public ArrayList list = new ArrayList();
  private double total;

  public ArrayList getList() {
    return list;
  }

  public void setList(ArrayList list) {
    this.list = list;
  }

  public double getTotal() {
    return total;
  }

  public void setTotal(double total) {
    this.total = total;
  }

  public int getLineItemCount() {
    return list.size();
  }

  public void deleteCart(String stt) {
    int iSTT = 0;
    try {
      iSTT = Integer.parseInt(stt);
      list.remove(iSTT - 1);
      calculateOrderTotal();
    } catch (NumberFormatException nfe) {
      System.out.println("Error while deleting cart item: " + nfe.getMessage());
      nfe.printStackTrace();
    }
  }

  public void updateCart(String stt, String quantity) {
    int iSTT = Integer.parseInt(stt);
    CartItemBean cartItem = (CartItemBean) list.get(iSTT - 1);
    int iPrice = cartItem.getPrice();
    int iQuantity = Integer.parseInt(quantity);
    try {
      if (iQuantity > 0) {
        cartItem.setQuantity(iQuantity);
        cartItem.setTotalCost(iPrice * iQuantity);
        calculateOrderTotal();
      }
    } catch (NumberFormatException nfe) {
      System.out.println("Error while updating cart: " + nfe.getMessage());
      nfe.printStackTrace();
    }

  }

  public void addCart(HttpServletRequest request, int prodId, String imageName, String unit, String name, String price, String quantity, int iMaxQuantity) {
    HttpSession session = request.getSession();
    boolean isNew = true;
    if (list.size() >= 10) {
      session.setAttribute("Error", "You cannot add more than 10 products in a same cart.");
    } else {

      if (list.size() > 0) {
        CartItemBean cartIB;
        for (int i = 0; i < list.size(); i++) {
          cartIB = (CartItemBean) list.get(i);
          // if name already exist
          if (cartIB.getName() == null ? name == null : cartIB.getName().equals(name)) {
            isNew = false;
            if (cartIB.getQuantity() >= cartIB.getMaxQuantity()) {
              session.setAttribute("Error", "Sorry! Product already in your cart. Quantity in stock not enough.");
            } else {
              cartIB.setQuantity(cartIB.getQuantity() + 1);
              cartIB.setTotalCost(cartIB.getPrice() * cartIB.getQuantity());
              calculateOrderTotal();
            }
          }
        }
      }
      if (isNew) {
        int iPrice = Integer.parseInt(price);
        int iQuantity = Integer.parseInt(quantity);
        CartItemBean cartItem = new CartItemBean();
        try {
          if (iQuantity > 0) {
            cartItem.setProdId(prodId);
            cartItem.setImageName(imageName);
            cartItem.setName(name);
            cartItem.setUnit(unit);
            cartItem.setPrice(iPrice);
            cartItem.setQuantity(iQuantity);
            cartItem.setMaxQuantity(iMaxQuantity);
            cartItem.setTotalCost(iPrice * iQuantity);
            list.add(cartItem);
            calculateOrderTotal();
          }
        } catch (NumberFormatException nfe) {
          System.out.println("Error while parsing from String to primitive types: " + nfe.getMessage());
          nfe.printStackTrace();
        }
      }
    }
  }

  protected void calculateOrderTotal() {
    double plus = 0;
    for (int i = 0; i < list.size(); i++) {
      CartItemBean cartItem = (CartItemBean) list.get(i);
      plus += cartItem.getTotalCost();

    }
    setTotal(plus);
  }
}
