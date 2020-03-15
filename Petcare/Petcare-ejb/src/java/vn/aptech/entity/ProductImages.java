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
 * @author ngodu
 */
@Entity
@Table(name = "ProductImages")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductImages.findAll", query = "SELECT p FROM ProductImages p")
    , @NamedQuery(name = "ProductImages.findByImageId", query = "SELECT p FROM ProductImages p WHERE p.imageId = :imageId")
    , @NamedQuery(name = "ProductImages.findByImageName", query = "SELECT p FROM ProductImages p WHERE p.imageName = :imageName")
    , @NamedQuery(name = "ProductImages.findByDesciption", query = "SELECT p FROM ProductImages p WHERE p.desciption = :desciption")})
public class ProductImages implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ImageId")
    private Integer imageId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "ImageName")
    private String imageName;
    @Size(max = 300)
    @Column(name = "Desciption")
    private String desciption;
    @JoinColumn(name = "ProdId", referencedColumnName = "ProdId")
    @ManyToOne(optional = false)
    private Products prodId;

    public ProductImages() {
    }

    public ProductImages(Integer imageId) {
        this.imageId = imageId;
    }

    public ProductImages(Integer imageId, String imageName) {
        this.imageId = imageId;
        this.imageName = imageName;
    }

    public Integer getImageId() {
        return imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getDesciption() {
        return desciption;
    }

    public void setDesciption(String desciption) {
        this.desciption = desciption;
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
        hash += (imageId != null ? imageId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductImages)) {
            return false;
        }
        ProductImages other = (ProductImages) object;
        if ((this.imageId == null && other.imageId != null) || (this.imageId != null && !this.imageId.equals(other.imageId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.aptech.entity.ProductImages[ imageId=" + imageId + " ]";
    }
    
}
