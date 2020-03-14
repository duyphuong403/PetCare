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
@Table(name = "Accounts")
@XmlRootElement
@NamedQueries({
  @NamedQuery(name = "Accounts.findAll", query = "SELECT a FROM Accounts a")
  , @NamedQuery(name = "Accounts.findByAccId", query = "SELECT a FROM Accounts a WHERE a.accId = :accId")
  , @NamedQuery(name = "Accounts.findByUsername", query = "SELECT a FROM Accounts a WHERE a.username = :username")
  , @NamedQuery(name = "Accounts.findByPassword", query = "SELECT a FROM Accounts a WHERE a.password = :password")
  , @NamedQuery(name = "Accounts.findByFullname", query = "SELECT a FROM Accounts a WHERE a.fullname = :fullname")
  , @NamedQuery(name = "Accounts.findByEmail", query = "SELECT a FROM Accounts a WHERE a.email = :email")
  , @NamedQuery(name = "Accounts.findByPhone", query = "SELECT a FROM Accounts a WHERE a.phone = :phone")
  , @NamedQuery(name = "Accounts.findByAddress", query = "SELECT a FROM Accounts a WHERE a.address = :address")
  , @NamedQuery(name = "Accounts.findByRole", query = "SELECT a FROM Accounts a WHERE a.role = :role")
  , @NamedQuery(name = "Accounts.findByIsActive", query = "SELECT a FROM Accounts a WHERE a.isActive = :isActive")
  , @NamedQuery(name = "Accounts.findByDateCreated", query = "SELECT a FROM Accounts a WHERE a.dateCreated = :dateCreated")
  , @NamedQuery(name = "Accounts.findByReasonBanned", query = "SELECT a FROM Accounts a WHERE a.reasonBanned = :reasonBanned")})
public class Accounts implements Serializable {

  private static final long serialVersionUID = 1L;
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Basic(optional = false)
  @Column(name = "AccId")
  private Integer accId;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1, max = 200)
  @Column(name = "Username")
  private String username;
  @Basic(optional = false)
  @NotNull
  @Size(min = 1, max = 200)
  @Column(name = "Password")
  private String password;
  @Size(max = 200)
  @Column(name = "Fullname")
  private String fullname;
  // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
  @Size(max = 200)
  @Column(name = "Email")
  private String email;
  @Basic(optional = false)
  @NotNull
  @Column(name = "Phone")
  private int phone;
  @Size(max = 255)
  @Column(name = "Address")
  private String address;
  @Basic(optional = false)
  @NotNull
  @Column(name = "Role")
  private short role;
  @Basic(optional = false)
  @NotNull
  @Column(name = "IsActive")
  private boolean isActive;
  @Basic(optional = false)
  @NotNull
  @Column(name = "DateCreated")
  @Temporal(TemporalType.TIMESTAMP)
  private Date dateCreated;
  @Size(max = 1000)
  @Column(name = "ReasonBanned")
  private String reasonBanned;
  @OneToMany(cascade = CascadeType.ALL, mappedBy = "accId")
  private Collection<Products> productsCollection;

  public Accounts() {
  }

  public Accounts(Integer accId) {
    this.accId = accId;
  }

  public Accounts(Integer accId, String username, String password, int phone, short role, boolean isActive, Date dateCreated) {
    this.accId = accId;
    this.username = username;
    this.password = password;
    this.phone = phone;
    this.role = role;
    this.isActive = isActive;
    this.dateCreated = dateCreated;
  }

  public Integer getAccId() {
    return accId;
  }

  public void setAccId(Integer accId) {
    this.accId = accId;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getFullname() {
    return fullname;
  }

  public void setFullname(String fullname) {
    this.fullname = fullname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public int getPhone() {
    return phone;
  }

  public void setPhone(int phone) {
    this.phone = phone;
  }

  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }

  public short getRole() {
    return role;
  }

  public void setRole(short role) {
    this.role = role;
  }

  public boolean getIsActive() {
    return isActive;
  }

  public void setIsActive(boolean isActive) {
    this.isActive = isActive;
  }

  public Date getDateCreated() {
    return dateCreated;
  }

  public void setDateCreated(Date dateCreated) {
    this.dateCreated = dateCreated;
  }

  public String getReasonBanned() {
    return reasonBanned;
  }

  public void setReasonBanned(String reasonBanned) {
    this.reasonBanned = reasonBanned;
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
    hash += (accId != null ? accId.hashCode() : 0);
    return hash;
  }

  @Override
  public boolean equals(Object object) {
    // TODO: Warning - this method won't work in the case the id fields are not set
    if (!(object instanceof Accounts)) {
      return false;
    }
    Accounts other = (Accounts) object;
    if ((this.accId == null && other.accId != null) || (this.accId != null && !this.accId.equals(other.accId))) {
      return false;
    }
    return true;
  }

  @Override
  public String toString() {
    return "vn.aptech.entity.Accounts[ accId=" + accId + " ]";
  }
  
}
