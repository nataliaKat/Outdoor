/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.CategoryDao;
import com.mycompany.outdoor.model.Category;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */

@Service("categoryService")
@Transactional
public class CategoryService {
    
    @Autowired 
    private CategoryDao categoryDao;
    
    public List<Category> findAllCategories() {
        return categoryDao.findAllCategories();
    }
    
    public Category findById(Integer id) {
        return categoryDao.findById(id);
    }
    
}
