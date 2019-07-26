/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.StockDao;
import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.model.Stock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kat26
 */
@Service("stockService")
public class StockService {
    
    @Autowired
    StockDao dao;
    
    public void newProduct(Product product, int quantity) {
        dao.newProduct(new Stock(quantity, product));
    }
    
    public void updateStock(Product product, int quantity) {
        dao.updateStock(product, quantity);
    }
    
    public int getQuantityPerProduct(Product p) {
        return dao.getQuantityPerProduct(p);
    }
            
}
