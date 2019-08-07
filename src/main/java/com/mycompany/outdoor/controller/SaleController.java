
package com.mycompany.outdoor.controller;

import com.mycompany.outdoor.model.Sale;
import com.mycompany.outdoor.model.User;
import com.mycompany.outdoor.service.SaleService;
import com.mycompany.outdoor.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class SaleController {

    @Autowired
    SaleService saleService;

    @Autowired
    UserService userService;

    @RequestMapping(value = "/sales", method = RequestMethod.GET)
    public String findAllProducts(ModelMap model) {
        List<Sale> sales = saleService.findAllSales();

        model.addAttribute("sales", sales);

        return "salesadmin";
    }

    @RequestMapping(value = "/history", method = RequestMethod.GET)
    public String getUserHistory(ModelMap model) {
        User foundUser = userService.findBySSO(getPrincipal());
        List<Sale> sales = saleService.getUserHistory(foundUser);
        model.addAttribute("history", saleService.getUserHistory(foundUser));
        return "userhistory";
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

 

}
