package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Accounts;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-09T11:51:21")
@StaticMetamodel(Articles.class)
public class Articles_ { 

    public static volatile SingularAttribute<Articles, Integer> artId;
    public static volatile SingularAttribute<Articles, String> imageName;
    public static volatile SingularAttribute<Articles, Date> dateCreated;
    public static volatile SingularAttribute<Articles, String> name;
    public static volatile SingularAttribute<Articles, Accounts> accId;
    public static volatile SingularAttribute<Articles, Boolean> isNew;
    public static volatile SingularAttribute<Articles, String> content;

}