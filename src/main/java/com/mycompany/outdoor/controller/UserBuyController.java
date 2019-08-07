
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.Product;
import com.mycompany.outdoor.model.Sale;
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
        model.addAttribute("quantity", stockService.getQuantityPerProduct(p));
        return "buy";
    }

    @RequestMapping(method = RequestMethod.POST)
    public String saveBuy(@RequestParam("productId") Integer id, @RequestParam("quantity") int quantity, 
            @Valid Sale sale, BindingResult result, ModelMap model) {
        sale.setAppUser(userService.findBySSO(getPrincipal()));
        Product boughtProduct = productService.findById(id);
        sale.setProduct(boughtProduct);
        saleService.save(sale);
        stockService.reduceQuantity(boughtProduct, quantity);
        if (result.hasErrors()) return "buy";
        return "redirect:/";
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
