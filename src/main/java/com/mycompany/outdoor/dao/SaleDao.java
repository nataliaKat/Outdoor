/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Sale;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */
@Repository("saleDao")
@Transactional
public class SaleDao extends AbstractDao<Integer, Sale>{
    
    @SuppressWarnings("unchecked")
    public List<Sale> findAllSales() {
        Criteria criteria = createEntityCriteria();
        return (List<Sale>) criteria.list();
    }
    
    public void save(Sale sale) {
        persist(sale);
    }
    
}
