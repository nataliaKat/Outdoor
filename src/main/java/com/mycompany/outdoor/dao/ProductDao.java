
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Brand;
import com.mycompany.outdoor.model.Category;
import com.mycompany.outdoor.model.Product;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

    public List<Product> findProductsByPrice(double lowPrice, double highPrice) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.ge("price", lowPrice));
        criteria.add(Restrictions.le("price", highPrice));
        return criteria.list();

    }

    public List<Product> findProductsByBrand(Brand brand) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("brand", brand));
        return criteria.list();
    }

    public List<Product> findProductsByCategory(Category category) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("category", category));
        return criteria.list();
    }

    public List<Product> findProductsByCategoryAndBrand(Category category, Brand brand) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("category", category));
        criteria.add(Restrictions.eq("brand", brand));
        return criteria.list();
    }

}
