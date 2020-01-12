/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import vn.aptech.entity.PetGuides;

/**
 *
 * @author ngodu
 */
@Stateless
public class PetGuidesFacade extends AbstractFacade<PetGuides> implements PetGuidesFacadeLocal {

    @PersistenceContext(unitName = "PetCare-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PetGuidesFacade() {
        super(PetGuides.class);
    }
    
}
