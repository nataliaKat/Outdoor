
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Brand;
import java.util.List;
import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository("brandDao")
@Transactional
public class BrandDao extends AbstractDao<Integer, Brand>{

    @SuppressWarnings("unchecked")
    public List<Brand> findAllBrands() {
       Criteria criteria = createEntityCriteria();
        
       return (List<Brand>) criteria.list();
    }

    public Brand findById(Integer id) {
       return getByKey(id);
    }
}

