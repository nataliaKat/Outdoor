/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.Brand;
import com.mycompany.outdoor.model.Category;
import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.model.User;
import com.mycompany.outdoor.model.UserProfile;
import com.mycompany.outdoor.service.BrandService;
import com.mycompany.outdoor.service.CategoryService;
import com.mycompany.outdoor.service.ProductService;
import com.mycompany.outdoor.service.StockService;
import com.mycompany.outdoor.service.UserProfileService;
import com.mycompany.outdoor.service.UserService;
import java.util.Iterator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author �������
 */
@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    UserService userService;

    @Autowired
    BrandService brandService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    UserProfileService userProfileService;

    @Autowired
    ProductService productService;

    @Autowired
    StockService stockService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

    @Autowired
    AuthenticationTrustResolver authenticationTrustResolver;

    @RequestMapping(method = RequestMethod.GET)
    public String getProductsPerRole() {
        if (isCurrentAuthenticationAnonymous()) {
            return "customerproducts";
        } else {
            User user = userService.findBySSO(getPrincipal());
            Iterator<UserProfile> iterator = user.getUserProfiles().iterator();
            Integer userProfile = iterator.next().getId();
            if (userProfile == 1) {
                return "customerproducts";
            } else {
                return "test";
            }
        }
    }

    //       -- INSERT FORM --
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
        if (result.hasErrors()) {
            return "redirect:/products/new";
        }
        Brand foundBrand = brandService.findById(brandsId);
        product.setBrand(foundBrand);
        Category foundCategory = categoryService.findById(categoryId);
        product.setCategory(foundCategory);
        productService.saveProduct(product);
        stockService.newProduct(product, quantity);
        return "redirect:/products";
    }

    //   -- DELETE --
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteProductById(ModelMap model, @PathVariable("id") Integer id) {
        productService.deleteProductById(id);
        return "redirect:/products";
    }

    //        DETAILS FORM
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String updateOrShowDetails(ModelMap model, @PathVariable("id") Integer id) {
        if (isCurrentAuthenticationAnonymous()) {
            Product p = productService.findById(id);

            model.addAttribute("quantity", stockService.getQuantityPerProduct(p));
            model.addAttribute("id", id);
            return "details";
        } else {
            User user = userService.findBySSO(getPrincipal());
            Iterator<UserProfile> iterator = user.getUserProfiles().iterator();
            Integer userProfile = iterator.next().getId();
            if (userProfile == 1) {
                Product p = productService.findById(id);

                model.addAttribute("id", id);
                model.addAttribute("quantity", stockService.getQuantityPerProduct(p));

                return "details";
            } else {
                Product p = productService.findById(id);

                model.addAttribute("quantity", stockService.getQuantityPerProduct(p));
                model.addAttribute("product", p);
                model.addAttribute("pBrand", p.getBrand());
                model.addAttribute("pCategory", p.getCategory());
                model.addAttribute("brands", brandService.findAllBrands());
                model.addAttribute("categories", categoryService.findAllCategories());

                return "admineditproducts";
            }
        }

    }

    @RequestMapping(value = "/{id}", method = RequestMethod.POST)
    public String updateProduct(@PathVariable("id") Integer pid, @RequestParam("quantity") int quantity, @RequestParam("brandsId") Integer brandsId,
            @RequestParam("categoryId") Integer categoryId, @Valid Product product, BindingResult result, ModelMap model) {

        Brand foundBrand = brandService.findById(brandsId);
        product.setBrand(foundBrand);
        Category foundCategory = categoryService.findById(categoryId);
        product.setCategory(foundCategory);

        productService.updateProduct(product);

        stockService.updateStock(product, quantity);

        if (result.hasErrors()) {
            return "redirect:/products/{" + product.getProductsId() + "}";
        }

        return "redirect:/products";
    }

    /**
     * This method returns the principal[user-name] of logged-in user.
     */
    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof UserDetails) {
            userName = ((UserDetails) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    /**
     * This method returns true if users is already authenticated [logged-in],
     * else false.
     */
    private boolean isCurrentAuthenticationAnonymous() {
        final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authenticationTrustResolver.isAnonymous(authentication);
    }

}
