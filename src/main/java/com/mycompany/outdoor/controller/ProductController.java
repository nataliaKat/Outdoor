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
//@Qualifier(value = "products")
@Controller
@RequestMapping("/admin/products")
public class ProductController {

    @Autowired
    ProductService productService;

    @Autowired
    BrandService brandService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    StockService stockService;

    public String getProductsJSON(List<Product> products) {
        List<ProductEntity> prodPojo = new ArrayList();
        for (Product p : products) {
            BrandEntity tempBrand = new BrandEntity(p.getBrand().getBrandsId(), p.getBrand().getBrandname());
            CategoryEntity tempCategory = new CategoryEntity(p.getCategory().getCategoryId(), p.getCategory().getCategoryName());
            ProductEntity tempProduct = new ProductEntity(p.getProductsId(), p.getPrice(), p.getImageUrl(), p.getDescription(), p.getName(), tempBrand, tempCategory);
            prodPojo.add(tempProduct);
        }
        Gson gson = new Gson();
        return gson.toJson(prodPojo);
    }

    @RequestMapping(method = RequestMethod.GET)
    public String findAllProducts(ModelMap model) {
//        List<Product> products = productService.findAllProducts();
//        model.addAttribute("products", products);
//        model.addAttribute("jsonList", getProductsJSON(products));
        return "adminproducts";
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String updateForm(ModelMap model, @PathVariable("id") Integer id) {
        Product p = productService.findById(id);
        model.addAttribute("quantity", stockService.getQuantityPerProduct(p));
        model.addAttribute("product", p);
        model.addAttribute("pBrand", p.getBrand());
        model.addAttribute("pCategory", p.getCategory());
        model.addAttribute("brands", brandService.findAllBrands());
        model.addAttribute("categories", categoryService.findAllCategories());
        return "admineditproducts";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.GET)
    public String insertForm(ModelMap model) {

        Product product = new Product();
        model.addAttribute("product", product);
        model.addAttribute("brands", brandService.findAllBrands());
        model.addAttribute("categories", categoryService.findAllCategories());

        return "admininsertproduct";
    }

    @RequestMapping(value = {"/new"}, method = RequestMethod.POST)
    public String saveProduct(@RequestParam("brandsId") Integer brandsId, @RequestParam("categoryId") Integer categoryId, @RequestParam("quantity") int quantity, @Valid Product product, BindingResult result, ModelMap model) {
        Brand foundBrand = brandService.findById(brandsId);
        product.setBrand(foundBrand);
        Category foundCategory = categoryService.findById(categoryId);
        product.setCategory(foundCategory);
        productService.saveProduct(product);
        stockService.newProduct(product, quantity);
        return "redirect:/admin/products";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteProductById(ModelMap model, @PathVariable("id") Integer id) {
        productService.deleteProductById(id);
        return "redirect:/admin/products";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String updateProduct(@RequestParam("quantity") int quantity, @RequestParam("brandsId") Integer brandsId, @RequestParam("categoryId") Integer categoryId, @Valid Product product, BindingResult result, ModelMap model) {

        Brand foundBrand = brandService.findById(brandsId);
        product.setBrand(foundBrand);
        Category foundCategory = categoryService.findById(brandsId);
        product.setCategory(foundCategory);
        productService.updateProduct(product);
        stockService.updateStock(product, quantity);

//        System.out.println(result.hasErrors());
//        if (result.hasErrors()) {
//            Product p = productService.findById(product.getProductsId());
//            model.addAttribute("brands", brandService.findAllBrands());
//            model.addAttribute("categories", categoryService.findAllCategories());
//            model.addAttribute("product", p);
//            return "admineditproducts";
//        }        
        return "redirect:/admin/products";
    }
}
