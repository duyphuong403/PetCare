/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.aptech.entity.ProductUnits;

/**
 *
 * @author Dell
 */
@Stateless
public class ProductUnitsFacade extends AbstractFacade<ProductUnits> implements ProductUnitsFacadeLocal {

  @PersistenceContext(unitName = "Petcare-ejbPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public ProductUnitsFacade() {
    super(ProductUnits.class);
  }
  
   @Override
    public boolean Delete(int unitId) {
        try {
            return em.createQuery("delete from ProductUnits where UnitId = :unitId", ProductUnits.class).setParameter("unitId", unitId).executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    @Override
    public boolean FindUnitByName(String name){
      try{
        return em.createQuery("select * from PruductUnits where Name = :name", ProductUnits.class).setParameter("name", name).getSingleResult() != null;
      } catch (Exception e){
        return false;
      }
    }
  
}
