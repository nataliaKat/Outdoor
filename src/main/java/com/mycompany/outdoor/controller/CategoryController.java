/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.User;
import com.mycompany.outdoor.model.UserProfile;
import com.mycompany.outdoor.service.CategoryService;
import com.mycompany.outdoor.service.ProductService;
import com.mycompany.outdoor.service.UserService;
import java.util.Iterator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author kat26
 */
@Controller
@RequestMapping("/cat")
public class CategoryController {

    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;
    
    @Autowired
    AuthenticationTrustResolver authenticationTrustResolver;
    
    @Autowired 
    UserService userService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String getProductsByCategory(ModelMap model, @PathVariable("id") Integer id) {
        model.addAttribute("catcat", id);
        model.addAttribute("minimumPrice", productService.getMinPrice());
        model.addAttribute("maximumPrice", productService.getMaxPrice());
        
        if (isCurrentAuthenticationAnonymous()) {
            return "welcome";
        } else {
            User user = userService.findBySSO(getPrincipal());
            Iterator<UserProfile> iterator = user.getUserProfiles().iterator();
            Integer userProfile = iterator.next().getId();
            if (userProfile == 1) {
                return "customerproducts";
            } else {
                return "adminproducts";
            }
        }
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
