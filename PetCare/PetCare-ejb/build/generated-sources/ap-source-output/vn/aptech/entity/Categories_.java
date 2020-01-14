package vn.aptech.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Products;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-14T20:44:54")
@StaticMetamodel(Categories.class)
public class Categories_ { 

    public static volatile CollectionAttribute<Categories, Products> productsCollection;
    public static volatile SingularAttribute<Categories, Integer> cateId;
    public static volatile SingularAttribute<Categories, String> name;
    public static volatile SingularAttribute<Categories, String> description;

}