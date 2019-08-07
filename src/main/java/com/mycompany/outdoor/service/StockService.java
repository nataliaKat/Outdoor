
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.StockDao;
import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.model.Stock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    
    public void reduceQuantity(Product product, int boughtQuantity) {
        int oldQuantity = dao.getQuantityPerProduct(product);
        dao.updateStock(product, oldQuantity - boughtQuantity);
    }
    
    public int getQuantityPerProduct(Product p) {
        return dao.getQuantityPerProduct(p);
    }
            
}
