package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Accounts;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-09T11:51:21")
@StaticMetamodel(Contact.class)
public class Contact_ { 

    public static volatile SingularAttribute<Contact, Date> dateChanged;
    public static volatile SingularAttribute<Contact, String> address;
    public static volatile SingularAttribute<Contact, String> embededMap;
    public static volatile SingularAttribute<Contact, Integer> contactId;
    public static volatile SingularAttribute<Contact, Short> phone;
    public static volatile SingularAttribute<Contact, Accounts> accId;

}