/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.dao.ProductDao;
import com.mycompany.outdoor.model.Brand;
import com.mycompany.outdoor.model.Category;
import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.service.BrandService;
import com.mycompany.outdoor.service.CategoryService;
import com.mycompany.outdoor.service.ProductService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
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

    @Autowired
    ProductDao productDao;

    @Autowired
    BrandService brandService;
    
    @Autowired
    CategoryService categoryService;

    @RequestMapping(value = "/json/price", method = RequestMethod.GET)
    public ResponseEntity<List<Product>> filterPrice() {
        List<Product> products = productService.findProductsByPrice(50, 400);

//        List<ProductView> productviews = transform(products);
//          bean.utils copyproperties
        System.out.println(products);

        if (products.isEmpty()) {
            return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Product>>(products, HttpStatus.OK);
    }


    @RequestMapping(value = "/json/brands", method = RequestMethod.GET)
    public ResponseEntity<List<Brand>> listAllBrands() {
        List<Brand> brands = brandService.findAllBrands();
        if (brands.isEmpty()) {
            return new ResponseEntity<List<Brand>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Brand>>(brands, HttpStatus.OK);
    }

    //ALL PRODUCTS
    @RequestMapping(value = "/json", method = RequestMethod.GET)
    public ResponseEntity< List<Product>> getAllProducts() {
        List<Product> products = productService.findAllProducts();
        System.out.println(products);

        if (products.isEmpty()) {
            return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Product>>(products, HttpStatus.OK);
    }

    @RequestMapping(value = "/json/{id}", method = RequestMethod.GET)
    public ResponseEntity<Product> getSingleProduct(@PathVariable("id") Integer id) {
        Product product = productService.findById(id);
        if (product == null) {
            return new ResponseEntity<Product>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<Product>(product, HttpStatus.OK);
    }

    @RequestMapping(value = "/json/brands/{brandId}", method = RequestMethod.GET)
    public ResponseEntity<List<Product>> getProductsByBrand(@PathVariable("brandId") Integer id) {
        Brand foundBrand = brandService.findById(id);
        List<Product> products = productService.findProductsByBrand(foundBrand);
        if (products == null) {
            return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Product>>(products, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/json/categories/{categoryId}", method = RequestMethod.GET)
    public ResponseEntity<List<Product>> getProductsByCategory(@PathVariable("categoryId") Integer id) {
        Category foundCategory = categoryService.findById(id);
        List<Product> products = productService.findProductsByCategory(foundCategory);
        if (products == null) {
            return new ResponseEntity<List<Product>>(HttpStatus.NO_CONTENT);
        }
        return new ResponseEntity<List<Product>>(products, HttpStatus.OK);
    }

}
