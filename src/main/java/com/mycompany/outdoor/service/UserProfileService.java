package com.mycompany.outdoor.service;

import java.util.List;

import com.mycompany.outdoor.model.UserProfile;


public interface UserProfileService {

	UserProfile findById(int id);

	UserProfile findByType(String type);
	
	List<UserProfile> findAll();
	
}
