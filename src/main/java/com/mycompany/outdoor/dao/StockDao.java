/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.model.Stock;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */
@Repository("stockDao")
@Transactional
public class StockDao extends AbstractDao<Integer, Stock> {
    
    public void newProduct(Stock st) {
        persist(st);
    }
    
    public void updateStock(Product p, int quantity) {
        Criteria crit = createEntityCriteria();
        
        crit.add(Restrictions.eq("product", p));
        Stock stock = (Stock) crit.uniqueResult();
        if (stock != null) {
            stock.setQuantity(quantity);
        }
        
    }
    
    public int getQuantityPerProduct(Product p) {
         Criteria crit = createEntityCriteria();
        
        crit.add(Restrictions.eq("product", p));
        Stock stock = (Stock) crit.uniqueResult();
        if (stock != null) {
            return stock.getQuantity();
        }
        return 0;
    }
    
}
