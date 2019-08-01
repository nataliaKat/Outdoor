/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.google.gson.Gson;
import com.mycompany.outdoor.entity.BrandEntity;
import com.mycompany.outdoor.entity.CategoryEntity;
import com.mycompany.outdoor.entity.ProductEntity;
import com.mycompany.outdoor.model.Brand;
import com.mycompany.outdoor.model.Category;
import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.service.BrandService;
import com.mycompany.outdoor.service.CategoryService;
import com.mycompany.outdoor.service.ProductService;
import com.mycompany.outdoor.service.StockService;
import java.util.ArrayList;
import java.util.List;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author kat26
 */
@Controller
@RequestMapping("/admin/products")
public class AdminProductsController {

    @Autowired
    ProductService productService;

    @Autowired
    BrandService brandService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    StockService stockService;

//    public String getProductsJSON(List<Product> products) {
//        List<ProductEntity> prodPojo = new ArrayList();
//        for (Product p : products) {
//            BrandEntity tempBrand = new BrandEntity(p.getBrand().getBrandsId(), p.getBrand().getBrandname());
//            CategoryEntity tempCategory = new CategoryEntity(p.getCategory().getCategoryId(), p.getCategory().getCategoryName());
//            ProductEntity tempProduct = new ProductEntity(p.getProductsId(), p.getPrice(), p.getImageUrl(), p.getDescription(), p.getName(), tempBrand, tempCategory);
//            prodPojo.add(tempProduct);
//        }
//        Gson gson = new Gson();
//        return gson.toJson(prodPojo);
//    }
    
    
    @RequestMapping(method = RequestMethod.GET)
    public String findAllProducts(ModelMap model) {
//        List<Product> products = productService.findAllProducts();
//        model.addAttribute("products", products);
//        model.addAttribute("jsonList", getProductsJSON(products));
        return "test";
    }

   


}
