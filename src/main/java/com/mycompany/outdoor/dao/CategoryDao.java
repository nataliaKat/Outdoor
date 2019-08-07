
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Category;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository("categoryDao")
@Transactional
public class CategoryDao extends AbstractDao<Integer, Category> {

    @SuppressWarnings("unchecked")
    public List<Category> findAllCategories() {
        Criteria criteria = createEntityCriteria();

        return (List<Category>) criteria.list();
    }
    
    public Category findById(Integer id) {
       return getByKey(id);
    }
    
 

}
