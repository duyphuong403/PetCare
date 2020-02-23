/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import java.util.List;
import javax.ejb.Local;
import vn.aptech.entity.ProductUnits;

/**
 *
 * @author Dell
 */
@Local
public interface ProductUnitsFacadeLocal {

  void create(ProductUnits productUnits);

  void edit(ProductUnits productUnits);

  void remove(ProductUnits productUnits);

  ProductUnits find(Object id);

  List<ProductUnits> findAll();

  List<ProductUnits> findRange(int[] range);

  int count();
  
  boolean Delete(int unitId);
  
  boolean FindUnitByName(String name);
  
}
