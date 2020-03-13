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
import vn.aptech.entity.OrderDetails;
import vn.aptech.entity.Orders;

/**
 *
 * @author ngodu
 */
@Stateless
public class OrderDetailsFacade extends AbstractFacade<OrderDetails> implements OrderDetailsFacadeLocal {

    @PersistenceContext(unitName = "Petcare-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public OrderDetailsFacade() {
        super(OrderDetails.class);
    }
    
    @Override
    public List<OrderDetails> getListOrder(Orders id){
      try {
        return em.createQuery("select a from OrderDetails a where a.orderId = :id", OrderDetails.class).setParameter("id", id).getResultList();
      } catch (Exception e) {
        System.out.println("Error when get list Oreder: " +e);
        return null;
      }
    }
    
}
