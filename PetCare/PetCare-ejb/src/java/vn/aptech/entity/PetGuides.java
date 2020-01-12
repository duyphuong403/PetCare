/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.entity;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ngodu
 */
@Entity
@Table(name = "PetGuides")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PetGuides.findAll", query = "SELECT p FROM PetGuides p")
    , @NamedQuery(name = "PetGuides.findByPetGuideId", query = "SELECT p FROM PetGuides p WHERE p.petGuideId = :petGuideId")
    , @NamedQuery(name = "PetGuides.findByTitle", query = "SELECT p FROM PetGuides p WHERE p.title = :title")
    , @NamedQuery(name = "PetGuides.findByContent", query = "SELECT p FROM PetGuides p WHERE p.content = :content")
    , @NamedQuery(name = "PetGuides.findByImageName", query = "SELECT p FROM PetGuides p WHERE p.imageName = :imageName")
    , @NamedQuery(name = "PetGuides.findByIsNew", query = "SELECT p FROM PetGuides p WHERE p.isNew = :isNew")
    , @NamedQuery(name = "PetGuides.findByDateCreated", query = "SELECT p FROM PetGuides p WHERE p.dateCreated = :dateCreated")})
public class PetGuides implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "PetGuideId")
    private Integer petGuideId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Title")
    private String title;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2147483647)
    @Column(name = "Content")
    private String content;
    @Size(max = 200)
    @Column(name = "ImageName")
    private String imageName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IsNew")
    private boolean isNew;
    @Column(name = "DateCreated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    @JoinColumn(name = "AccId", referencedColumnName = "AccId")
    @ManyToOne(optional = false)
    private Accounts accId;

    public PetGuides() {
    }

    public PetGuides(Integer petGuideId) {
        this.petGuideId = petGuideId;
    }

    public PetGuides(Integer petGuideId, String title, String content, boolean isNew) {
        this.petGuideId = petGuideId;
        this.title = title;
        this.content = content;
        this.isNew = isNew;
    }

    public Integer getPetGuideId() {
        return petGuideId;
    }

    public void setPetGuideId(Integer petGuideId) {
        this.petGuideId = petGuideId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public boolean getIsNew() {
        return isNew;
    }

    public void setIsNew(boolean isNew) {
        this.isNew = isNew;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Accounts getAccId() {
        return accId;
    }

    public void setAccId(Accounts accId) {
        this.accId = accId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (petGuideId != null ? petGuideId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PetGuides)) {
            return false;
        }
        PetGuides other = (PetGuides) object;
        if ((this.petGuideId == null && other.petGuideId != null) || (this.petGuideId != null && !this.petGuideId.equals(other.petGuideId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.aptech.entity.PetGuides[ petGuideId=" + petGuideId + " ]";
    }
    
}
