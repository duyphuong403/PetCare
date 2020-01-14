/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.aptech.entity.Accounts;

/**
 *
 * @author ngodu
 */
@Stateless
public class AccountsFacade extends AbstractFacade<Accounts> implements AccountsFacadeLocal {

    @PersistenceContext(unitName = "PetCare-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public AccountsFacade() {
        super(Accounts.class);
    }
    
    @Override
    public Accounts checkLogin(String user, String pwd){
        try {
            return em.createQuery("select a from Accounts a where a.username = :email and a.password = :pwd", Accounts.class).setParameter("email", user).setParameter("pwd", pwd).getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
