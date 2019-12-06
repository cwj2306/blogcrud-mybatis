package com.cos.blogcrud.repository;

import com.cos.blogcrud.model.User;

public interface UserRepository {
	 User findById(int id);
	 void join(User user);
	 User findByUsernameAndPassword(User user);
	 void profileUpload(User user);
}