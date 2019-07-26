/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Product;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */
@Repository("productDao")
@Transactional
public class ProductDao extends AbstractDao<Integer, Product> {

    @SuppressWarnings("unchecked")
    public List<Product> findAllProducts() {
        Criteria criteria = createEntityCriteria();
        return (List<Product>) criteria.list();
    }

    public Product findById(int id) {
        return getByKey(id);
    }

    public void updateProduct(Product product) {
        Product entity = findById(product.getProductsId());

        if (entity != null) {
            entity.setName(product.getName());
            entity.setDescription(product.getDescription());
            entity.setBrand(product.getBrand());
            entity.setCategory(product.getCategory());
            entity.setImageUrl(product.getImageUrl());
            entity.setPrice(product.getPrice());
        }

    }

    public void saveProduct(Product p) {
        persist(p);
    }

    public void deleteProductById(Integer id) {
       delete(findById(id));
    }

}
