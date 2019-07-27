/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Category;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */
@Repository("categoryDao")
@Transactional
public class CategoryDao extends AbstractDao<Integer, Category> {

    @SuppressWarnings("unchecked")
    public List<Category> findAllCategories() {
        Criteria criteria = createEntityCriteria();

        return (List<Category>) criteria.list();
    }
    
    public Category findById(Integer id) {
        System.out.println("Category Dao !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
       return getByKey(id);
    }
    
 

}
