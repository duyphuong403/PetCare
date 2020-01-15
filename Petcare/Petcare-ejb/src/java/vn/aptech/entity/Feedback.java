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
@Table(name = "Feedback")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Feedback.findAll", query = "SELECT f FROM Feedback f")
    , @NamedQuery(name = "Feedback.findByFeedbacktId", query = "SELECT f FROM Feedback f WHERE f.feedbacktId = :feedbacktId")
    , @NamedQuery(name = "Feedback.findByFullname", query = "SELECT f FROM Feedback f WHERE f.fullname = :fullname")
    , @NamedQuery(name = "Feedback.findByEmail", query = "SELECT f FROM Feedback f WHERE f.email = :email")
    , @NamedQuery(name = "Feedback.findByPhone", query = "SELECT f FROM Feedback f WHERE f.phone = :phone")
    , @NamedQuery(name = "Feedback.findByContent", query = "SELECT f FROM Feedback f WHERE f.content = :content")
    , @NamedQuery(name = "Feedback.findByIsRead", query = "SELECT f FROM Feedback f WHERE f.isRead = :isRead")
    , @NamedQuery(name = "Feedback.findByDateCreated", query = "SELECT f FROM Feedback f WHERE f.dateCreated = :dateCreated")})
public class Feedback implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "FeedbacktId")
    private Integer feedbacktId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Fullname")
    private String fullname;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 200)
    @Column(name = "Email")
    private String email;
    @Column(name = "Phone")
    private Integer phone;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 2000)
    @Column(name = "Content")
    private String content;
    @Column(name = "IsRead")
    private Boolean isRead;
    @Column(name = "DateCreated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateCreated;
    @JoinColumn(name = "AccId", referencedColumnName = "AccId")
    @ManyToOne
    private Accounts accId;

    public Feedback() {
    }

    public Feedback(Integer feedbacktId) {
        this.feedbacktId = feedbacktId;
    }

    public Feedback(Integer feedbacktId, String fullname, String email, String content) {
        this.feedbacktId = feedbacktId;
        this.fullname = fullname;
        this.email = email;
        this.content = content;
    }

    public Integer getFeedbacktId() {
        return feedbacktId;
    }

    public void setFeedbacktId(Integer feedbacktId) {
        this.feedbacktId = feedbacktId;
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

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getIsRead() {
        return isRead;
    }

    public void setIsRead(Boolean isRead) {
        this.isRead = isRead;
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
        hash += (feedbacktId != null ? feedbacktId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Feedback)) {
            return false;
        }
        Feedback other = (Feedback) object;
        if ((this.feedbacktId == null && other.feedbacktId != null) || (this.feedbacktId != null && !this.feedbacktId.equals(other.feedbacktId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.aptech.entity.Feedback[ feedbacktId=" + feedbacktId + " ]";
    }
    
}
