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
public class BrandEntity {
        private Integer brandsId;
    private String brandname;

    public BrandEntity() {
    }

    public BrandEntity(Integer brandsId, String brandname) {
        this.brandsId = brandsId;
        this.brandname = brandname;
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

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 23 * hash + Objects.hashCode(this.brandsId);
        hash = 23 * hash + Objects.hashCode(this.brandname);
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
        final BrandEntity other = (BrandEntity) obj;
        if (!Objects.equals(this.brandname, other.brandname)) {
            return false;
        }
        if (!Objects.equals(this.brandsId, other.brandsId)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "BrandEntity{" + "brandsId=" + brandsId + ", brandname=" + brandname + '}';
    }

}
