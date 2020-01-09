package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Orders;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-09T11:51:21")
@StaticMetamodel(OrderDetails.class)
public class OrderDetails_ { 

    public static volatile SingularAttribute<OrderDetails, Integer> odId;
    public static volatile SingularAttribute<OrderDetails, Short> quantity;
    public static volatile SingularAttribute<OrderDetails, Date> dateCreated;
    public static volatile SingularAttribute<OrderDetails, Orders> orderId;

}