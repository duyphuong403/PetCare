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
public class CartItemBean {

  private String imageName;
  private String name;
  private int price;
  private int quantity;
  private double TotalCost;

  public String getImageName() {
    return imageName;
  }

  public void setImageName(String imageName) {
    this.imageName = imageName;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public double getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public double getTotalCost() {
    return TotalCost;
  }

  public void setTotalCost(double TotalCost) {
    this.TotalCost = TotalCost;
  }

}
