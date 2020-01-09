package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Articles;
import vn.aptech.entity.Contact;
import vn.aptech.entity.Orders;
import vn.aptech.entity.Products;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-09T11:51:21")
@StaticMetamodel(Accounts.class)
public class Accounts_ { 

    public static volatile SingularAttribute<Accounts, String> address;
    public static volatile SingularAttribute<Accounts, Short> role;
    public static volatile CollectionAttribute<Accounts, Contact> contactCollection;
    public static volatile CollectionAttribute<Accounts, Orders> ordersCollection;
    public static volatile SingularAttribute<Accounts, String> password;
    public static volatile SingularAttribute<Accounts, Date> dateCreated;
    public static volatile CollectionAttribute<Accounts, Articles> articlesCollection;
    public static volatile SingularAttribute<Accounts, Integer> phone;
    public static volatile CollectionAttribute<Accounts, Products> productsCollection;
    public static volatile SingularAttribute<Accounts, Integer> accId;
    public static volatile SingularAttribute<Accounts, String> fullname;
    public static volatile SingularAttribute<Accounts, String> email;
    public static volatile SingularAttribute<Accounts, String> username;

}