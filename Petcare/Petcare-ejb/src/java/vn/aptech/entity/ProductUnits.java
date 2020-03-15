/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.entity;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Dell
 */
@Entity
@Table(name = "ProductUnits")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "ProductUnits.findAll", query = "SELECT p FROM ProductUnits p")
  , @NamedQuery(name = "ProductUnits.findByUnitId", query = "SELECT p FROM ProductUnits p WHERE p.unitId = :unitId")
  , @NamedQuery(name = "ProductUnits.findByName", query = "SELECT p FROM ProductUnits p WHERE p.name = :name")
  , @NamedQuery(name = "ProductUnits.findByDescription", query = "SELECT p FROM ProductUnits p WHERE p.description = :description")
  , @NamedQuery(name = "ProductUnits.findByDateCreated", query = "SELECT p FROM ProductUnits p WHERE p.dateCreated = :dateCreated")
  , @NamedQuery(name = "ProductUnits.findByDateUpdated", query = "SELECT p FROM ProductUnits p WHERE p.dateUpdated = :dateUpdated")})
public class ProductUnits implements Serializable {

  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "UnitId")
  private Integer unitId;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1, max = 50)
  @Column(name = "Name")
  private String name;
  @Size(max = 200)
  @Column(name = "Description")
  private String description;
  @Column(name = "DateCreated")
  @Temporal(TemporalType.TIMESTAMP)
  private Date dateCreated;
  @Column(name = "DateUpdated")
  @Temporal(TemporalType.TIMESTAMP)
  private Date dateUpdated;
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "unitId")
  private Collection<Products> productsCollection;

  public ProductUnits() {
  }

  public ProductUnits(Integer unitId) {
    this.unitId = unitId;
  }

  public ProductUnits(Integer unitId, String name) {
    this.unitId = unitId;
    this.name = name;
  }

  public Integer getUnitId() {
    return unitId;
  }

  public void setUnitId(Integer unitId) {
    this.unitId = unitId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Date getDateCreated() {
    return dateCreated;
  }

  public void setDateCreated(Date dateCreated) {
    this.dateCreated = dateCreated;
  }

  public Date getDateUpdated() {
    return dateUpdated;
  }

  public void setDateUpdated(Date dateUpdated) {
    this.dateUpdated = dateUpdated;
  }

  @XmlTransient
  public Collection<Products> getProductsCollection() {
    return productsCollection;
  }

  public void setProductsCollection(Collection<Products> productsCollection) {
    this.productsCollection = productsCollection;
  }

  @Override
  public int hashCode() {
    int hash = 0;
    hash += (unitId != null ? unitId.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof ProductUnits)) {
      return false;
    }
    ProductUnits other = (ProductUnits) object;
    if ((this.unitId == null && other.unitId != null) || (this.unitId != null && !this.unitId.equals(other.unitId))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "vn.aptech.entity.ProductUnits[ unitId=" + unitId + " ]";
  }
  
}
