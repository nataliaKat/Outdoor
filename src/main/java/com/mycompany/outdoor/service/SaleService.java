/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.SaleDao;
import com.mycompany.outdoor.model.Sale;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kat26
 */
@Service("saleService")
public class SaleService {
    
    @Autowired
    private SaleDao dao;
    
    
    public List<Sale> findAllSales() {
        return dao.findAllSales();
    }
}
