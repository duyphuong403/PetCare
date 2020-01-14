package vn.aptech.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.aptech.entity.Accounts;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-01-14T20:09:48")
@StaticMetamodel(PetGuides.class)
public class PetGuides_ { 

    public static volatile SingularAttribute<PetGuides, String> imageName;
    public static volatile SingularAttribute<PetGuides, Date> dateCreated;
    public static volatile SingularAttribute<PetGuides, Integer> petGuideId;
    public static volatile SingularAttribute<PetGuides, Accounts> accId;
    public static volatile SingularAttribute<PetGuides, Boolean> isNew;
    public static volatile SingularAttribute<PetGuides, String> title;
    public static volatile SingularAttribute<PetGuides, String> content;

}