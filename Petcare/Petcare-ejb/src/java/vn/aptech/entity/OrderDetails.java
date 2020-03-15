/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "OrderDetails")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "OrderDetails.findAll", query = "SELECT o FROM OrderDetails o")
  , @NamedQuery(name = "OrderDetails.findByOdId", query = "SELECT o FROM OrderDetails o WHERE o.odId = :odId")
  , @NamedQuery(name = "OrderDetails.findByName", query = "SELECT o FROM OrderDetails o WHERE o.name = :name")
  , @NamedQuery(name = "OrderDetails.findByUnit", query = "SELECT o FROM OrderDetails o WHERE o.unit = :unit")
  , @NamedQuery(name = "OrderDetails.findByQuantity", query = "SELECT o FROM OrderDetails o WHERE o.quantity = :quantity")
  , @NamedQuery(name = "OrderDetails.findByPrice", query = "SELECT o FROM OrderDetails o WHERE o.price = :price")
  , @NamedQuery(name = "OrderDetails.findByTotal", query = "SELECT o FROM OrderDetails o WHERE o.total = :total")})
public class OrderDetails implements Serializable {

  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "OdId")
  private Integer odId;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1, max = 100)
  @Column(name = "Name")
  private String name;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1, max = 50)
  @Column(name = "Unit")
  private String unit;
  @Basic(optional = false)
  @NotNull
  @Column(name = "Quantity")
  private int quantity;
  @Basic(optional = false)
  @NotNull
  @Column(name = "Price")
  private int price;
  @Basic(optional = false)
  @NotNull
  @Column(name = "Total")
  private int total;
  @JoinColumn(name = "OrderId", referencedColumnName = "OrderId")
  @ManyToOne(optional = false)
  private Orders orderId;
  @JoinColumn(name = "ProdId", referencedColumnName = "ProdId")
  @ManyToOne(optional = false)
  private Products prodId;

  public OrderDetails() {
  }

  public OrderDetails(Integer odId) {
    this.odId = odId;
  }

  public OrderDetails(Integer odId, String name, String unit, int quantity, int price, int total) {
    this.odId = odId;
    this.name = name;
    this.unit = unit;
    this.quantity = quantity;
    this.price = price;
    this.total = total;
  }

  public Integer getOdId() {
    return odId;
  }

  public void setOdId(Integer odId) {
    this.odId = odId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getUnit() {
    return unit;
  }

  public void setUnit(String unit) {
    this.unit = unit;
  }

  public int getQuantity() {
    return quantity;
  }

  public void setQuantity(int quantity) {
    this.quantity = quantity;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public int getTotal() {
    return total;
  }

  public void setTotal(int total) {
    this.total = total;
  }

  public Orders getOrderId() {
    return orderId;
  }

  public void setOrderId(Orders orderId) {
    this.orderId = orderId;
  }

  public Products getProdId() {
    return prodId;
  }

  public void setProdId(Products prodId) {
    this.prodId = prodId;
  }

  @Override
  public int hashCode() {
    int hash = 0;
    hash += (odId != null ? odId.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof OrderDetails)) {
      return false;
    }
    OrderDetails other = (OrderDetails) object;
    if ((this.odId == null && other.odId != null) || (this.odId != null && !this.odId.equals(other.odId))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "vn.aptech.entity.OrderDetails[ odId=" + odId + " ]";
  }
  
}
