/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.aptech.sb;

import java.util.List;
import javax.ejb.Local;
import vn.aptech.entity.Accounts;

/**
 *
 * @author ngodu
 */
@Local
public interface AccountsFacadeLocal {

    void create(Accounts accounts);

    void edit(Accounts accounts);

    void remove(Accounts accounts);

    Accounts find(Object id);

    List<Accounts> findAll();

    List<Accounts> findRange(int[] range);

    int count();
    
    Accounts checkLogin(String user, String pwd); 

  

    List<Accounts> filterEmployee();

    List<Accounts> filterAdmin();
    
}
