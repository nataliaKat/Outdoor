/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.model.Sale;
import com.mycompany.outdoor.model.User;
import com.mycompany.outdoor.service.ProductService;
import com.mycompany.outdoor.service.SaleService;
import com.mycompany.outdoor.service.StockService;
import com.mycompany.outdoor.service.UserProfileService;
import com.mycompany.outdoor.service.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.event.TransactionalEventListener;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author kat26
 */
@Controller
@RequestMapping("/products/{id}/buy")
@SessionAttributes("roles")
public class UserBuyController {

    @Autowired
    UserService userService;

    @Autowired
    UserProfileService userProfileService;

    @Autowired
    ProductService productService;

    @Autowired
    StockService stockService;

    @Autowired
    SaleService saleService;

    @Autowired
    MessageSource messageSource;

    @Autowired
    PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

    @Autowired
    AuthenticationTrustResolver authenticationTrustResolver;

    @RequestMapping(method = RequestMethod.GET)
    public String buy(@PathVariable("id") Integer id, ModelMap model) {
        Product p = productService.findById(id);
        model.addAttribute("product", p);
        model.addAttribute("sale", new Sale());
        model.addAttribute("user", new User());

        model.addAttribute("quantity", stockService.getQuantityPerProduct(p));
        return "buy";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String saveBuy(@RequestParam("productId") Integer id, @RequestParam("quantity") int quantity, @RequestParam("first") String fname,
            @RequestParam("last") String lname, @RequestParam("email") String email,
            @Valid Sale sale, @Valid User user, BindingResult result, ModelMap model) {
        user.setFirstName(fname);
        user.setLastName(lname);
        user.setEmail(email);

        System.out.println(" prin to if Userrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr" + user);
        System.out.println("auth anonymoushsfukjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj" + isCurrentAuthenticationAnonymous());

        if (isCurrentAuthenticationAnonymous()) {
            System.out.println(isCurrentAuthenticationAnonymous());
            sale.setAppUser(user);

            userService.saveUser(user);
//            System.out.println("Userrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr" + user);
            System.out.println(result.getAllErrors());

        } else {
            User loggedIn = userService.findBySSO(getPrincipal());
            System.out.println(loggedIn);
            sale.setAppUser(loggedIn);
            System.out.println(result.getAllErrors());

        }
        System.out.println("addresssssssssssssssssssssss" + sale.getAddress());
        System.out.println("heyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy sale's user " + sale.getAppUser());
        Product boughtProduct = productService.findById(id);
        sale.setProduct(boughtProduct);
        System.out.println("prooooooooooooooooooooooduct" + sale.getProduct());
        persistSale(sale);
        stockService.reduceQuantity(boughtProduct, quantity);
        System.out.println(result.getAllErrors());
        if (result.hasErrors()) {
            return "buy";
        }
        return "redirect:/";
    }

    @TransactionalEventListener
    private void persistSale(Sale sale) {
        System.out.println("Entered sale functionnnnnnnnnnnnnnnnnnnnnn");
        saleService.save(sale);
    }

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
