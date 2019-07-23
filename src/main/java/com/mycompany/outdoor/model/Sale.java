/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

/**
 *
 * @author kat26
 */
@Entity
@Table(name = "sales", catalog = "outdoor", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Sale.findAll", query = "SELECT s FROM Sale s")
    , @NamedQuery(name = "Sale.findBySalesId", query = "SELECT s FROM Sale s WHERE s.salesId = :salesId")
    , @NamedQuery(name = "Sale.findBySalesDate", query = "SELECT s FROM Sale s WHERE s.salesDate = :salesDate")
    , @NamedQuery(name = "Sale.findByTotal", query = "SELECT s FROM Sale s WHERE s.total = :total")})
public class Sale implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sales_id", nullable = false)
    private Integer salesId;
    @Column(name = "sales_date")
    @Temporal(TemporalType.DATE)
    private Date salesDate;
    private Integer total;
    @JoinColumn(name = "app_user_id", referencedColumnName = "id", nullable = false)
    @ManyToOne(optional = false)
    private User appUserId;
//        @LazyCollection(LazyCollectionOption.FALSE)

    @JoinColumn(name = "products_id", referencedColumnName = "products_id")
    @ManyToOne
    private Product product;

    public Sale() {
    }

    public Sale(Integer salesId) {
        this.salesId = salesId;
    }

    public Integer getSalesId() {
        return salesId;
    }

    public void setSalesId(Integer salesId) {
        this.salesId = salesId;
    }

    public Date getSalesDate() {
        return salesDate;
    }

    public void setSalesDate(Date salesDate) {
        this.salesDate = salesDate;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public User getAppUserId() {
        return appUserId;
    }

    public void setAppUserId(User appUserId) {
        this.appUserId = appUserId;
    }

//    public Product getProduct() {
//        return product;
//    }
//
//    public void setProduct(Product product) {
//        this.product = product;
//    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.salesId);
        hash = 29 * hash + Objects.hashCode(this.salesDate);
        hash = 29 * hash + Objects.hashCode(this.total);
        hash = 29 * hash + Objects.hashCode(this.appUserId);
//        hash = 29 * hash + Objects.hashCode(this.product);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Sale other = (Sale) obj;
        if (!Objects.equals(this.salesId, other.salesId)) {
            return false;
        }
        if (!Objects.equals(this.salesDate, other.salesDate)) {
            return false;
        }
        if (!Objects.equals(this.total, other.total)) {
            return false;
        }
        if (!Objects.equals(this.appUserId, other.appUserId)) {
            return false;
        }
//        if (!Objects.equals(this.product, other.product)) {
//            return false;
//        }
        return true;
    }

    @Override
    public String toString() {
        return "Sale{" + "salesId=" + salesId + ", salesDate=" + salesDate + ", total=" + total + ", appUserId=" + appUserId + '}';
    }

 
   
    
}
