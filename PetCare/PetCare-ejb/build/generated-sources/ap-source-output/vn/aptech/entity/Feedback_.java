package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Feedback;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-12T20:52:22")
@StaticMetamodel(Feedback.class)
public class Feedback_ { 

    public static volatile SingularAttribute<Feedback, Feedback> feedback;
    public static volatile SingularAttribute<Feedback, String> address;
    public static volatile SingularAttribute<Feedback, String> embededMap;
    public static volatile SingularAttribute<Feedback, Date> dateCreated;
    public static volatile SingularAttribute<Feedback, Short> phone;
    public static volatile SingularAttribute<Feedback, Integer> feedbackId;
    public static volatile SingularAttribute<Feedback, Feedback> feedback1;

}