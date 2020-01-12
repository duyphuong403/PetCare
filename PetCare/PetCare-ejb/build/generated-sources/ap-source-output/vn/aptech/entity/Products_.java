package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Accounts;
import vn.aptech.entity.Categories;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-12T19:28:57")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, String> unitPrice;
    public static volatile SingularAttribute<Products, Short> quantity;
    public static volatile SingularAttribute<Products, Date> dateCreated;
    public static volatile SingularAttribute<Products, Categories> cateId;
    public static volatile SingularAttribute<Products, String> name;
    public static volatile SingularAttribute<Products, Accounts> accId;
    public static volatile SingularAttribute<Products, Integer> prodId;
    public static volatile SingularAttribute<Products, Boolean> isNew;

}