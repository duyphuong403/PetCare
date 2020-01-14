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
@Table(name = "Contact", catalog = "PetcareDB", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Contact.findAll", query = "SELECT c FROM Contact c")
    , @NamedQuery(name = "Contact.findByFeedbacktId", query = "SELECT c FROM Contact c WHERE c.feedbacktId = :feedbacktId")
    , @NamedQuery(name = "Contact.findByAddress", query = "SELECT c FROM Contact c WHERE c.address = :address")
    , @NamedQuery(name = "Contact.findByPhone", query = "SELECT c FROM Contact c WHERE c.phone = :phone")
    , @NamedQuery(name = "Contact.findByEmbededMap", query = "SELECT c FROM Contact c WHERE c.embededMap = :embededMap")
    , @NamedQuery(name = "Contact.findByIsRead", query = "SELECT c FROM Contact c WHERE c.isRead = :isRead")
    , @NamedQuery(name = "Contact.findByDateChanged", query = "SELECT c FROM Contact c WHERE c.dateChanged = :dateChanged")
    , @NamedQuery(name = "Contact.findByAccId", query = "SELECT c FROM Contact c WHERE c.accId = :accId")})
public class Contact implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "FeedbacktId")
    private Integer feedbacktId;
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
    @Column(name = "IsRead")
    private boolean isRead;
    @Basic(optional = false)
    @NotNull
    @Column(name = "DateChanged")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateChanged;
    @Basic(optional = false)
    @NotNull
    @Column(name = "AccId")
    private int accId;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "contact1")
    private Contact contact;
    @JoinColumn(name = "FeedbacktId", referencedColumnName = "FeedbacktId", insertable = false, updatable = false)
    @OneToOne(optional = false)
    private Contact contact1;

    public Contact() {
    }

    public Contact(Integer feedbacktId) {
        this.feedbacktId = feedbacktId;
    }

    public Contact(Integer feedbacktId, String address, boolean isRead, Date dateChanged, int accId) {
        this.feedbacktId = feedbacktId;
        this.address = address;
        this.isRead = isRead;
        this.dateChanged = dateChanged;
        this.accId = accId;
    }

    public Integer getFeedbacktId() {
        return feedbacktId;
    }

    public void setFeedbacktId(Integer feedbacktId) {
        this.feedbacktId = feedbacktId;
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

    public boolean getIsRead() {
        return isRead;
    }

    public void setIsRead(boolean isRead) {
        this.isRead = isRead;
    }

    public Date getDateChanged() {
        return dateChanged;
    }

    public void setDateChanged(Date dateChanged) {
        this.dateChanged = dateChanged;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public Contact getContact1() {
        return contact1;
    }

    public void setContact1(Contact contact1) {
        this.contact1 = contact1;
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
        if (!(object instanceof Contact)) {
            return false;
        }
        Contact other = (Contact) object;
        if ((this.feedbacktId == null && other.feedbacktId != null) || (this.feedbacktId != null && !this.feedbacktId.equals(other.feedbacktId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.aptech.entity.Contact[ feedbacktId=" + feedbacktId + " ]";
    }
    
}
