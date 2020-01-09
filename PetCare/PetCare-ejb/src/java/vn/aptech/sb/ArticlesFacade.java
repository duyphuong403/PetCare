/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.aptech.entity.Articles;

/**
 *
 * @author Dell
 */
@Stateless
public class ArticlesFacade extends AbstractFacade<Articles> implements ArticlesFacadeLocal {

    @PersistenceContext(unitName = "PetCare-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ArticlesFacade() {
        super(Articles.class);
    }
    
}
