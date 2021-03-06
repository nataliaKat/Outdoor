
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.ProductDao;
import com.mycompany.outdoor.model.Brand;
import com.mycompany.outdoor.model.Category;
import com.mycompany.outdoor.model.Product;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("productService")
public class ProductService {

    @Autowired
    private ProductDao dao;

    public Product findById(Integer id) {
        return dao.findById(id);
    }

    public void saveProduct(Product product) {
        dao.saveProduct(product);
    }

    public void updateProduct(Product product) {
        dao.updateProduct(product);
    }

    public List<Product> findAllProducts() {
        List<Product> products = dao.findAllProducts();
        return products;
    }

    public List<Product> findProductsByPrice(double lowPrice, double highPrice) {
        List<Product> priceProducts = dao.findProductsByPrice(lowPrice, highPrice);
        return priceProducts;
    }

    public List<Product> findProductsByBrand(Brand brand) {
        return dao.findProductsByBrand(brand);
    }

    public List<Product> findProductsByCategory(Category category) {
        return dao.findProductsByCategory(category);
    }

    public void deleteProductById(Integer id) {
        dao.deleteProductById(id);
    }

    public List<Product> findProductsByCategoryAndBrand(Category category, Brand brand) {
        return dao.findProductsByCategoryAndBrand(category, brand);
    }

    public double getMinPrice() {
        List<Product> products = findAllProducts();
        double min = products.get(0).getPrice();
        for (Product p : products) {
            if (p.getPrice() < min) {
                min = p.getPrice();
            }
        }
        return min;
    }

    public double getMaxPrice() {
        List<Product> products = findAllProducts();
        double max = products.get(0).getPrice();
        for (Product p : products) {
            if (p.getPrice() > max) {
                max = p.getPrice();
            }
        }
        return max;
    }

}
