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
    
//    @Override
//    public boolean createCate(Categories cate){
//        return em.createQuery("insert into Categories (Name, Description) values (?, ?)", Categories.class).setParameter(1, cate.getName()).setParameter(2, cate.getDescription()).executeUpdate() > 0;
//    }
    
    @Override
    public Categories findCate(String cate){
        try {
            return em.createQuery("select Name from Categories where Name = :name", Categories.class).setParameter("name", cate).getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
