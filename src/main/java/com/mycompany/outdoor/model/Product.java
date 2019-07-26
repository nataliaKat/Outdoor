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
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author kat26
 */
@Entity
//@Transactional

@Table(name = "products", catalog = "outdoor", schema = "")
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
    , @NamedQuery(name = "Product.findByProductsId", query = "SELECT p FROM Product p WHERE p.productsId = :productsId")
    , @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price")
    , @NamedQuery(name = "Product.findByImageUrl", query = "SELECT p FROM Product p WHERE p.imageUrl = :imageUrl")
    , @NamedQuery(name = "Product.findByDescription", query = "SELECT p FROM Product p WHERE p.description = :description")
    , @NamedQuery(name = "Product.findByName", query = "SELECT p FROM Product p WHERE p.name = :name")})
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "products_id", nullable = false)
    private Integer productsId;

    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    
    @Column(precision = 22, scale = 0)
    private Double price;

    @Size(max = 200)
    @Column(name = "image_url", length = 200)
    private String imageUrl;

    @Size(max = 600)
    @Column(length = 600)
    private String description;

    @Size(max = 100)
    @Column(length = 100)
    private String name;

    
            @LazyCollection(LazyCollectionOption.FALSE)

    @OneToMany(mappedBy = "product")
    private List<Sale> saleList;

    @LazyCollection(LazyCollectionOption.FALSE)

    @ManyToOne
    @JoinColumn(name = "brands_id")
    private Brand brand;
    
//    @LazyCollection(LazyCollectionOption.FALSE)
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
    

    public Product() {
    }  
    
    public Product(Integer productsId, Double price, String imageUrl, String description, String name, Brand brand, Category category){
        this.productsId = productsId;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.name = name;
        this.brand = brand;
        this.category = category;
    }

    public Product(Integer productsId) {
        this.productsId = productsId;
    }

    public Integer getProductsId() {
        return productsId;
    }

    public void setProductsId(Integer productsId) {
        this.productsId = productsId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Brand getBrand() {
        return brand;
    }

    @Autowired
    public void setBrand(Brand brand) {
        this.brand = brand;
    }


//    public Stock getQuantity() {
//        return quantity;
//    }
//
//    public void setStockList(Stock quantity) {
//        this.quantity = quantity;
//    }

    public List<Sale> getSaleList() {
        return saleList;
    }

    public void setSaleList(List<Sale> saleList) {
        this.saleList = saleList;
    }
//
 
//
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 67 * hash + Objects.hashCode(this.productsId);
        hash = 67 * hash + Objects.hashCode(this.price);
        hash = 67 * hash + Objects.hashCode(this.imageUrl);
        hash = 67 * hash + Objects.hashCode(this.description);
        hash = 67 * hash + Objects.hashCode(this.name);
        hash = 67 * hash + Objects.hashCode(this.brand);
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
        final Product other = (Product) obj;
        if (!Objects.equals(this.imageUrl, other.imageUrl)) {
            return false;
        }
        if (!Objects.equals(this.description, other.description)) {
            return false;
        }
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.productsId, other.productsId)) {
            return false;
        }
        if (!Objects.equals(this.price, other.price)) {
            return false;
        }
        if (!Objects.equals(this.brand, other.brand)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Product{" + "productsId=" + productsId + ", price=" + price + ", imageUrl=" + imageUrl + ", description=" + description + brand + category + '}';
    }

    

   
    
   

    
  

}
