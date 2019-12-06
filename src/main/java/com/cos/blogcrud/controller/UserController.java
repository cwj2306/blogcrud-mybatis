package com.cos.blogcrud.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cos.blogcrud.model.User;
import com.cos.blogcrud.repository.UserRepository;
import com.cos.blogcrud.utils.Script;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserRepository userRepo;
	
	@Value("${file.path}")
	private String resourcePath;
	
	
	
	@GetMapping("/joinForm")
	public String userJoinForm() {
		return "user/joinForm";
	}
	
	@PostMapping("/join")
	public @ResponseBody String userJoin(User user) {
		try {
			userRepo.join(user);
		} catch (Exception e) {
			e.printStackTrace();
			return Script.back("가입 실패");
		}
		
		return Script.href("/user/loginForm");
	}
	
	
	
	@GetMapping("/loginForm")
	public String userLoginForm() {
		return "user/loginForm";
	}
	
	@PostMapping("/login")
	public @ResponseBody String userLogin(User user, HttpSession session) {
		try {
			User u = userRepo.findByUsernameAndPassword(user);
			
			//로그인 성공하면 세션등록
			if(u != null) {
				session.setAttribute("user", u);
			}else {
				return Script.back("로그인 실패");				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return Script.back("로그인 실패");
		}
		
		return Script.href("/home");
	}
	
	@GetMapping("/logout")
	public String userLogout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/home";
	}
	
	
	@GetMapping("/profileForm")
	public String userProfileForm() {
		return "user/profileForm";
	}
	
	
	@PostMapping("/profileUpload")
	public String userProfileUpload(@RequestParam("userProfile") MultipartFile file, HttpSession session) {
		UUID uuid = UUID.randomUUID();
		String uuidFileName = uuid+"_"+file.getOriginalFilename();
		
		Path filePath = Paths.get(resourcePath+uuidFileName);
		try {
			Files.write(filePath, file.getBytes());
			
			//세션 수정
			User user = (User)session.getAttribute("user");
			user.setUserProfile(uuidFileName);
			
			//DB수정
			userRepo.profileUpload(user);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/home";
	}
	
}
