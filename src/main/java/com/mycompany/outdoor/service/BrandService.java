
package com.mycompany.outdoor.service;

import com.mycompany.outdoor.dao.BrandDao;
import com.mycompany.outdoor.model.Brand;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service("brandService")
@Transactional
public class BrandService {

    @Autowired
    private BrandDao dao;
 
    public Brand findById(int id) {
        return dao.findById(id);
    }

    public List<Brand> findAllBrands() {
        List<Brand> brands = dao.findAllBrands();
        return brands;
    }



}

