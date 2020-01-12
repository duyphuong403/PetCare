/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.entity;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
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
@Table(name = "Feedback", catalog = "PetcareDB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Feedback.findAll", query = "SELECT f FROM Feedback f")
    , @NamedQuery(name = "Feedback.findByFeedbackId", query = "SELECT f FROM Feedback f WHERE f.feedbackId = :feedbackId")
    , @NamedQuery(name = "Feedback.findByAddress", query = "SELECT f FROM Feedback f WHERE f.address = :address")
    , @NamedQuery(name = "Feedback.findByPhone", query = "SELECT f FROM Feedback f WHERE f.phone = :phone")
    , @NamedQuery(name = "Feedback.findByEmbededMap", query = "SELECT f FROM Feedback f WHERE f.embededMap = :embededMap")
    , @NamedQuery(name = "Feedback.findByDateCreated", query = "SELECT f FROM Feedback f WHERE f.dateCreated = :dateCreated")})
public class Feedback implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "FeedbackId")
    private Integer feedbackId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Address")
    private String address;
    @Column(name = "Phone")
    private Short phone;
    @Size(max = 500)
    @Column(name = "EmbededMap")
    private String embededMap;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DateCreated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "feedback1")
    private Feedback feedback;
    @JoinColumn(name = "FeedbackId", referencedColumnName = "FeedbackId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Feedback feedback1;

    public Feedback() {
    }

    public Feedback(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

    public Feedback(Integer feedbackId, String address, Date dateCreated) {
        this.feedbackId = feedbackId;
        this.address = address;
        this.dateCreated = dateCreated;
    }

    public Integer getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(Integer feedbackId) {
        this.feedbackId = feedbackId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Short getPhone() {
        return phone;
    }

    public void setPhone(Short phone) {
        this.phone = phone;
    }

    public String getEmbededMap() {
        return embededMap;
    }

    public void setEmbededMap(String embededMap) {
        this.embededMap = embededMap;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Feedback getFeedback() {
        return feedback;
    }

    public void setFeedback(Feedback feedback) {
        this.feedback = feedback;
    }

    public Feedback getFeedback1() {
        return feedback1;
    }

    public void setFeedback1(Feedback feedback1) {
        this.feedback1 = feedback1;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (feedbackId != null ? feedbackId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedback)) {
            return false;
        }
        Feedback other = (Feedback) object;
        if ((this.feedbackId == null && other.feedbackId != null) || (this.feedbackId != null && !this.feedbackId.equals(other.feedbackId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.aptech.entity.Feedback[ feedbackId=" + feedbackId + " ]";
    }
    
}
