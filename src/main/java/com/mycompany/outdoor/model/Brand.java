/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.model;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author kat26
 */
   


@Entity
@Table(name = "brands", catalog = "outdoor", schema = "")
//@Transactional
//@Component
@NamedQueries({
    @NamedQuery(name = "Brand.findAll", query = "SELECT b FROM Brand b")
    , @NamedQuery(name = "Brand.findByBrandsId", query = "SELECT b FROM Brand b WHERE b.brandsId = :brandsId")
    , @NamedQuery(name = "Brand.findByBrandname", query = "SELECT b FROM Brand b WHERE b.brandname = :brandname")})
public class Brand implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "brands_id", nullable = false)
    private Integer brandsId;
    
    @Size(max = 40)
    @Column(length = 40)
    private String brandname;
            @LazyCollection(LazyCollectionOption.FALSE)

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "brand")
    
    private List<Product> products;
    
    public Brand() {
    }

    public Brand(Integer brandsId, String brandname) {
        this.brandsId = brandsId;
        this.brandname = brandname;
    }
    
    public Brand(Integer brandsId, String brandname, List<Product> products) {
        this.brandsId = brandsId;
        this.brandname = brandname;
//        this.products = products;
    }

    public Integer getBrandsId() {
        return brandsId;
    }

    public void setBrandsId(Integer brandsId) {
        this.brandsId = brandsId;
    }

    public String getBrandname() {
        return brandname;
    }

    public void setBrandname(String brandname) {
        this.brandname = brandname;
    }

    public List<Product> getProducts() {
        return products;
    }
    
    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + Objects.hashCode(this.brandsId);
        hash = 97 * hash + Objects.hashCode(this.brandname);
        hash = 97 * hash + Objects.hashCode(this.products);
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
        final Brand other = (Brand) obj;
        if (!Objects.equals(this.brandname, other.brandname)) {
            return false;
        }
        if (!Objects.equals(this.brandsId, other.brandsId)) {
            return false;
        }
        if (!Objects.equals(this.products, other.products)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Brand{" + "brandsId=" + brandsId + ", brandname=" + brandname +  '}';
    }

   

   
    
}
