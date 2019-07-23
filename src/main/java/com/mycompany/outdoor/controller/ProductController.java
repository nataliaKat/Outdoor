/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.service.BrandService;
import com.mycompany.outdoor.service.ProductService;
import java.io.IOException;
import java.util.List;
import static jdk.nashorn.internal.objects.Global.println;
import org.hibernate.Hibernate;
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
//@Qualifier(value = "products")
@Controller
@RequestMapping("/admin/products")
public class ProductController {

    @Autowired
    ProductService productService;

    @Autowired
    BrandService brandService;

    @RequestMapping(method = RequestMethod.GET)
    public String findAllProducts(ModelMap model) {
        List<Product> products = productService.findAllProducts();
        model.addAttribute("products", products);
        ObjectMapper Obj = new ObjectMapper();
        try {

            // get Oraganisation object as a json string 
            String maria = Obj.writeValueAsString(products);
            System.out.println(maria);
            System.out.println("before");

            model.addAttribute("jsonProd", maria);
            System.out.println("after");

//        model.addAttribute("productsJson", products);
            // Displaying JSON String 
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "adminproducts";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String findById(ModelMap model, @PathVariable("id") Integer id) {
        Product p = productService.findById(id);
        if (p != null) {
            Hibernate.initialize(p.getBrand());
//            Hibernate.initialize(p.getSaleList());

        }
        model.addAttribute("product", p);
        model.addAttribute("brands", brandService.findAllBrands());
        return "admineditproducts";
    }
//
//    @RequestMapping(value = "/insert", method = RequestMethod.GET)
//    public String insertForm(ModelMap model) {
//      
//        Brand product = new Brand();
//        
//        model.addAttribute("product", product);
//        
//        return "addBrand";
//    }
//
//    @RequestMapping(value = "/insert", method = RequestMethod.POST)
//    public String saveBrand(@Valid Brand product, BindingResult result, ModelMap model) {
//        service.saveBrand(product);
//        if (result.hasErrors()) {
//            return "insert";
//        }
//        return "";
//    }
//
//    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
//    public String deleteBrandById(ModelMap model, @PathVariable("id") int id) {
//        service.deleteBrandById(id);
//
//        return "success";
//    }
//    
//
//    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
//    public String updateById(ModelMap model, @PathVariable("id") int id) {
//        System.setProperty("https.protocols", "TLSv1.1");
//
////System.setProperty("https.protocols", "TLSv1.1");
//
//
//        model.addAttribute("product", productService.findById(id));
//        return "adminupdateproduct";
//    }
//    
//    @RequestMapping(value = "/update", method = RequestMethod.POST)
//    public String updateBrand(@Valid Brand product, BindingResult result, ModelMap model) {
//        service.updateBrand(product);
//        if(result.hasErrors()) {
//            int id = product.getBrandsId();
//            return "update/{" + id + "}";
//        }
//        return "success";
//    }

}
