/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.outdoor.entity;

import java.util.Objects;

/**
 *
 * @author kat26
 */
public class ProductEntity {
    
        private Integer productsId;
    private Double price;
    private String imageUrl;
    private String description;
    private String name;
    private BrandEntity brand;
    private CategoryEntity category;

    public ProductEntity() {
    }

    public ProductEntity(Integer productsId, Double price, String imageUrl, String description, String name, BrandEntity brand, CategoryEntity category) {
        this.productsId = productsId;
        this.price = price;
        this.imageUrl = imageUrl;
        this.description = description;
        this.name = name;
        this.brand = brand;
        this.category = category;
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

    public BrandEntity getBrand() {
        return brand;
    }

    public void setBrand(BrandEntity brand) {
        this.brand = brand;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 37 * hash + Objects.hashCode(this.productsId);
        hash = 37 * hash + Objects.hashCode(this.price);
        hash = 37 * hash + Objects.hashCode(this.imageUrl);
        hash = 37 * hash + Objects.hashCode(this.description);
        hash = 37 * hash + Objects.hashCode(this.name);
        hash = 37 * hash + Objects.hashCode(this.brand);
        hash = 37 * hash + Objects.hashCode(this.category);
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
        final ProductEntity other = (ProductEntity) obj;
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
        if (!Objects.equals(this.category, other.category)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ProductEntity{" + "productsId=" + productsId + ", price=" + price + ", imageUrl=" + imageUrl + ", description=" + description + ", name=" + name + ", brand=" + brand + ", category=" + category + '}';
    }

    
}
