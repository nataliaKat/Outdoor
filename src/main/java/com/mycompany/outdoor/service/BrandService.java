/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.BrandDao;
import com.mycompany.outdoor.model.Brand;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */

@Service("brandService")
@Transactional
public class BrandService {

    @Autowired
    private BrandDao dao;

//    
    public Brand findById(int id) {
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
    public List<Brand> findAllBrands() {
        List<Brand> brands = dao.findAllBrands();
        System.out.println(brands);
        return brands;
    }



}

