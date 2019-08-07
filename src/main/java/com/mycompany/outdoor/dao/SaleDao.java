
package com.mycompany.outdoor.dao;

import com.mycompany.outdoor.model.Sale;
import com.mycompany.outdoor.model.User;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("saleDao")
@Transactional
public class SaleDao extends AbstractDao<Integer, Sale> {

    @SuppressWarnings("unchecked")
    public List<Sale> findAllSales() {
        Criteria criteria = createEntityCriteria();
        return (List<Sale>) criteria.list();
    }

    public void save(Sale sale) {
        persist(sale);
    }

    public List<Sale> getUserHistory(User user) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("appUser", user));
        return criteria.list();
    }

}
