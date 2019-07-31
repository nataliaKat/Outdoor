/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.Sale;
import com.mycompany.outdoor.service.SaleService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author kat26
 */
@Controller
@RequestMapping("/sales")
public class SaleController {
    
    @Autowired
    SaleService saleService;
    
    @RequestMapping(method = RequestMethod.GET)
    public String findAllProducts(ModelMap model) {
        List<Sale> sales = saleService.findAllSales();
        
        model.addAttribute("sales", sales);
        
        return "salesadmin";
    }
    
}
