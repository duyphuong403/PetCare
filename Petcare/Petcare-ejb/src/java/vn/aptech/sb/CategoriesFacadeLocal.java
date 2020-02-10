/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import java.util.List;
import javax.ejb.Local;
import vn.aptech.entity.Categories;

/**
 *
 * @author ngodu
 */
@Local
public interface CategoriesFacadeLocal {

    void create(Categories categories);
    
//    boolean createCate(Categories cate);

    void edit(Categories categories);

    void remove(Categories categories);

    Categories find(Object id);

    List<Categories> findAll();

    List<Categories> findRange(int[] range);

    int count();

    Categories findCate(String cate);

}
