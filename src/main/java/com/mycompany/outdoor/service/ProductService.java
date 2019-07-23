/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.ProductDao;
import com.mycompany.outdoor.model.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author kat26
 */

@Service("productService")
public class ProductService {

    @Autowired
    private ProductDao dao;

    
    public Product findById(int id) {
        return dao.findById(id);
    }
//
//    public void saveProduct(Product product) {
//        dao.saveProduct(product);
//    }
//
//    public void updateProduct(Product product) {
//        Product entity = dao.findById(product.getProductsId());
//        if (entity != null) {
//            entity.setName(product.getName());
//            entity.setDescription(product.getDescription());
//        }
//        
//    }
//
//    public void deleteProductById(int id) {
//        dao.deleteProductById(id);
//    }
//
    public List<Product> findAllProducts() {
        List<Product> products = dao.findAllProducts();
        System.out.println(products);
        return products;

       //return dao.findAllProducts();
        
    }
   

  

}

