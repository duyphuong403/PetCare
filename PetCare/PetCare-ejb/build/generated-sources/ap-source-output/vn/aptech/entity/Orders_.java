package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Accounts;
import vn.aptech.entity.OrderDetails;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-12T20:52:22")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Date> dateCreated;
    public static volatile SingularAttribute<Orders, Integer> orderId;
    public static volatile CollectionAttribute<Orders, OrderDetails> orderDetailsCollection;
    public static volatile SingularAttribute<Orders, Accounts> accId;

}