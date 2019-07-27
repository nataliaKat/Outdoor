/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author kat26
 */
@RestController
public class RestProductController {
    
    @Autowired 
    ProductService productService;
    
    @RequestMapping(value = "/json", method = RequestMethod.GET)
    public ResponseEntity<List<Product>> listAllProduct() {
        List<Product> products = productService.findAllProducts();
        System.out.println(products);
        if(products.isEmpty()){
            return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Product>>(products, HttpStatus.OK);
    }
    
}
