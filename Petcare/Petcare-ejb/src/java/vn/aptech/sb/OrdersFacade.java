/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import vn.aptech.entity.Accounts;
import vn.aptech.entity.Orders;
import vn.aptech.entity.Products;

/**
 *
 * @author ngodu
 */
@Stateless
public class OrdersFacade extends AbstractFacade<Orders> implements OrdersFacadeLocal {

  @PersistenceContext(unitName = "Petcare-ejbPU")
  private EntityManager em;

  @Override
  protected EntityManager getEntityManager() {
    return em;
  }

  public OrdersFacade() {
    super(Orders.class);
  }

  @Override
  public Orders getOrderLastest(Accounts curAcc) {
    try {
      return em.createQuery("select a from Orders a where a.accId = :id order by a.dateCreated desc", Orders.class).setParameter("id", curAcc).setMaxResults(1).getSingleResult();
    } catch (NoResultException nre) {
      System.out.println(nre);
      return null;
    }
  }
  
  @Override
  public List<Orders> getRecordsPagination(int currentPage, int recordsPerPage) {
    try {
      return em.createQuery("select e from Orders e", Orders.class).setFirstResult(currentPage * recordsPerPage - recordsPerPage).setMaxResults(recordsPerPage).getResultList();
    } catch (Exception ex) {
      System.out.println(ex);
      return null;
    }
  }
  
  @Override
  public List<Orders> searchWithPagination(int txtSearch, int currentPage, int recordsPerPage) {
    try {
      return em.createQuery("select e from Orders e where e.orderId = :txtSearch", Orders.class).setParameter("txtSearch", txtSearch).setFirstResult(currentPage * recordsPerPage - recordsPerPage).setMaxResults(recordsPerPage).getResultList();
    } catch (Exception ex) {
      System.out.println(ex);
      return null;
    }
  }

}
