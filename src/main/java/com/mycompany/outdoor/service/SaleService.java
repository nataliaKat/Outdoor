
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.SaleDao;
import com.mycompany.outdoor.model.Sale;
import com.mycompany.outdoor.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("saleService")
public class SaleService {
    
    @Autowired
    private SaleDao dao;
    
    
    public List<Sale> findAllSales() {
        return dao.findAllSales();
    }
    
    public void save(Sale sale) {
        dao.save(sale);
    }
    
    public List<Sale> getUserHistory(User user) {
        return dao.getUserHistory(user);
    }
}
