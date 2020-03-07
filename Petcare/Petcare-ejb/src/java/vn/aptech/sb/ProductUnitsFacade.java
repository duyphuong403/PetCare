/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
  public boolean FindUnitByName(String name) {
    try {
      TypedQuery query = em.createQuery("SELECT * FROM PruductUnits WHERE Name = :name", ProductUnits.class);
      query.setParameter("name", name);
      System.out.println(query.getResultList().size());
      return query.getResultList().size() > 0;
    } catch (Exception e) {
      System.out.println(e);
      return false;
    }
  }

}
