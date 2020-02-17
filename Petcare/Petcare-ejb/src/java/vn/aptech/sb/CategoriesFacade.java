/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.aptech.entity.Categories;
import vn.aptech.entity.Products;

/**
 *
 * @author ngodu
 */
@Stateless
public class CategoriesFacade extends AbstractFacade<Categories> implements CategoriesFacadeLocal {

    @PersistenceContext(unitName = "Petcare-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public CategoriesFacade() {
        super(Categories.class);
    }

    @Override
    public boolean Delete(int cateId) {
        try {
            return em.createQuery("delete from Categories where CateId = :cateId", Categories.class).setParameter("cateId", cateId).executeUpdate() > 0;
        } catch (Exception e) {
            return false;
        }
    }
}
