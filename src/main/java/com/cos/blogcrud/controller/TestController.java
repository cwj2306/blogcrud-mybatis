package com.cos.blogcrud.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cos.blogcrud.model.User;
import com.cos.blogcrud.repository.UserRepository;

@Controller
@RequestMapping("/test")
public class TestController {

	@Autowired
	private UserRepository userRepo;
	
	@GetMapping("")
	public String test(Model model) {
		return "testpage";
	}
	
	@GetMapping("/user/{id}")
	public String testUser(@PathVariable int id, Model model) {
		User user = userRepo.findById(id);
		model.addAttribute("user", user);
		return "index";
	}
	
	
}
