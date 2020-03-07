/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.aptech.entity.Products;

/**
 *
 * @author Dell
 */
@Stateless
public class ProductsFacade extends AbstractFacade<Products> implements ProductsFacadeLocal {

  @PersistenceContext(unitName = "Petcare-ejbPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public ProductsFacade() {
    super(Products.class);
  }

  @Override
  public boolean Delete(int prodId) {
    try {
      return em.createQuery("delete from Products where CateId = :prodId", Products.class).setParameter("prodId", prodId).executeUpdate() > 0;
    } catch (Exception e) {
      System.out.println(e.getMessage());
      return false;
    }
  }

  @Override
  public List<Products> getProductPagination(int currentPage, int recordsPerPage) {
    try {
      return em.createQuery("select e from Products e", Products.class).setFirstResult(currentPage * recordsPerPage - recordsPerPage).setMaxResults(recordsPerPage).getResultList();
    } catch (Exception ex) {
      System.out.println(ex);
      return null;
    }
  }
  
  @Override
  public List<Products> findByName(String txtSearch) {
    try {
      return em.createQuery("select e from Products e where e.name like :txtSearch", Products.class).setParameter("txtSearch", "%" + txtSearch+ "%").getResultList();
    } catch (Exception ex) {
      System.out.println(ex);
      return null;
    }
  }
  
  @Override
  public List<Products> searchWithPagination(String txtSearch, int currentPage, int recordsPerPage) {
    try {
      return em.createQuery("select e from Products e where e.name = :txtSearch", Products.class).setParameter("txtSearch", "%" + txtSearch + "%").setFirstResult(currentPage * recordsPerPage - recordsPerPage).setMaxResults(recordsPerPage).getResultList();
    } catch (Exception ex) {
      System.out.println(ex);
      return null;
    }
  }

}
