package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Contact;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-12T21:09:32")
@StaticMetamodel(Contact.class)
public class Contact_ { 

    public static volatile SingularAttribute<Contact, Date> dateChanged;
    public static volatile SingularAttribute<Contact, String> address;
    public static volatile SingularAttribute<Contact, String> embededMap;
    public static volatile SingularAttribute<Contact, Short> phone;
    public static volatile SingularAttribute<Contact, Integer> feedbacktId;
    public static volatile SingularAttribute<Contact, Contact> contact;
    public static volatile SingularAttribute<Contact, Boolean> isRead;
    public static volatile SingularAttribute<Contact, Integer> accId;
    public static volatile SingularAttribute<Contact, Contact> contact1;

}