/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.Category;
import com.mycompany.outdoor.service.CategoryService;
import com.mycompany.outdoor.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author kat26
 */
@Controller
@RequestMapping("/cat")
public class CategoryController {
    
    @Autowired
    ProductService productService;
    
    @Autowired
    CategoryService categoryService;
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getProductsByCategory(ModelMap model, @PathVariable("id") Integer id) {
        model.addAttribute("catcat", id);
        model.addAttribute("minimumPrice", productService.getMinPrice());
        model.addAttribute("maximumPrice", productService.getMaxPrice());
        return "welcome";
    }
    
}
