package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Orders;
import vn.aptech.entity.Products;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-14T20:09:47")
@StaticMetamodel(OrderDetails.class)
public class OrderDetails_ { 

    public static volatile SingularAttribute<OrderDetails, Boolean> isDelivered;
    public static volatile SingularAttribute<OrderDetails, Integer> odId;
    public static volatile SingularAttribute<OrderDetails, Integer> quantity;
    public static volatile SingularAttribute<OrderDetails, Date> dateCreated;
    public static volatile SingularAttribute<OrderDetails, Orders> orderId;
    public static volatile SingularAttribute<OrderDetails, Integer> price;
    public static volatile SingularAttribute<OrderDetails, Products> prodId;

}