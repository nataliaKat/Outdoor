/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Stock;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */
@Repository("stockDao")
@Transactional
public class StockDao extends AbstractDao<Integer, Stock>{
 
   public void newProduct(Stock st) {
       persist(st);
   }
    
}
