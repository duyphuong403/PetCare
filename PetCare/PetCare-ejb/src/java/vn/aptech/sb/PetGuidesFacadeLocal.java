/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import java.util.List;
import javax.ejb.Local;
import vn.aptech.entity.PetGuides;

/**
 *
 * @author ngodu
 */
@Local
public interface PetGuidesFacadeLocal {

    void create(PetGuides petGuides);

    void edit(PetGuides petGuides);

    void remove(PetGuides petGuides);

    PetGuides find(Object id);

    List<PetGuides> findAll();

    List<PetGuides> findRange(int[] range);

    int count();
    
}
