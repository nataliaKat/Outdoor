package com.mycompany.outdoor.dao;

import java.util.List;

import com.mycompany.outdoor.model.UserProfile;


public interface UserProfileDao {

	List<UserProfile> findAll();
	
	UserProfile findByType(String type);
	
	UserProfile findById(int id);
}
