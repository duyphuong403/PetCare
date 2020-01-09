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
 * @author Dell
 */
@Entity
@Table(name = "Articles")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Articles.findAll", query = "SELECT a FROM Articles a")
    , @NamedQuery(name = "Articles.findByArtId", query = "SELECT a FROM Articles a WHERE a.artId = :artId")
    , @NamedQuery(name = "Articles.findByName", query = "SELECT a FROM Articles a WHERE a.name = :name")
    , @NamedQuery(name = "Articles.findByContent", query = "SELECT a FROM Articles a WHERE a.content = :content")
    , @NamedQuery(name = "Articles.findByImageName", query = "SELECT a FROM Articles a WHERE a.imageName = :imageName")
    , @NamedQuery(name = "Articles.findByIsNew", query = "SELECT a FROM Articles a WHERE a.isNew = :isNew")
    , @NamedQuery(name = "Articles.findByDateCreated", query = "SELECT a FROM Articles a WHERE a.dateCreated = :dateCreated")})
public class Articles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "ArtId")
    private Integer artId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(name = "Name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2000)
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

    public Articles() {
    }

    public Articles(Integer artId) {
        this.artId = artId;
    }

    public Articles(Integer artId, String name, String content, boolean isNew) {
        this.artId = artId;
        this.name = name;
        this.content = content;
        this.isNew = isNew;
    }

    public Integer getArtId() {
        return artId;
    }

    public void setArtId(Integer artId) {
        this.artId = artId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
        hash += (artId != null ? artId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Articles)) {
            return false;
        }
        Articles other = (Articles) object;
        if ((this.artId == null && other.artId != null) || (this.artId != null && !this.artId.equals(other.artId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.aptech.entity.Articles[ artId=" + artId + " ]";
    }
    
}
