/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.service.BrandService;
import com.mycompany.outdoor.service.CategoryService;
import com.mycompany.outdoor.service.ProductService;
import com.mycompany.outdoor.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Ανδρέας
 */
public class CustomerController {

    @Controller
    @RequestMapping("/customer/products")
    public class CustomerProductsController {

        @Autowired
        ProductService productService;

        @Autowired
        BrandService brandService;

        @Autowired
        CategoryService categoryService;

        @Autowired
        StockService stockService;
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String findAllProducts(ModelMap model) {
        return "test";
    }
}
