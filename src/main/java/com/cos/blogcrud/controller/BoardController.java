package com.cos.blogcrud.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.cos.blogcrud.model.Board;
import com.cos.blogcrud.model.User;
import com.cos.blogcrud.repository.BoardRepository;

@Controller
public class BoardController {
	
	@Autowired
	private BoardRepository boardRepo;
	
	@GetMapping("/home")
	public String home() {
		return "redirect:/list/1";
	}
	
	@GetMapping("/list/{page}")
	public String list(@PathVariable int page, Model model) {
		
		int numOfBoards = boardRepo.findAll();
		
		int numOfPages = numOfBoards%4==0?numOfBoards/4:numOfBoards/4+1;
		if(numOfPages==0) {numOfPages = 1;}
		
		if(page<1) {
			page = 1;
		}else if(page>numOfPages){
			page = numOfPages;
		}
		
		List<Board> boards = boardRepo.findByPage((page-1)*4);
		model.addAttribute("boards", boards);
		
		int startNum=1;
		int endNum=5;

		if(page<=3) {
			startNum = 1;
			endNum = 5;
		}else if(page>numOfPages-3) {
			startNum = numOfPages-4; 
			endNum = numOfPages;
		}else {
			startNum = page-2; 
			endNum = page+2;
		}
		
		if(numOfPages<5) {
			startNum = 1;
			endNum = numOfPages;				
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startNum", startNum);
		model.addAttribute("endNum", endNum);
		
		return "index";
	}
	
	@GetMapping("/detail/{boardId}")
	public String detail(@PathVariable int boardId, Model model) {
		try {
			Board board = boardRepo.findById(boardId);
			//null 처리 해야함
			model.addAttribute("board", board);
			return "board/detail";				
			
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/home";
		}
		
	}
	
	//인터셉터 처리(로그인)
	@GetMapping("/writeForm")
	public String writeForm() {
		return "board/writeForm";
	}
	
	//인터셉터 처리(로그인)
	@PostMapping("/write")
	public String write(Board board, HttpSession session) {
		try {
			User user = (User)session.getAttribute("user");
			board.setUserId(user.getId());
			boardRepo.save(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/home";
	}
	
	//	인터셉터 처리(사용자=글작성자)
	@GetMapping("/updateForm/{boardId}")
	public String updateForm(@PathVariable int boardId, Model model) {
		Board board = boardRepo.findById(boardId);
		model.addAttribute("board",board);
		return "board/updateForm";
	}
	
	//	인터셉터 처리(사용자=글작성자)
	@PostMapping("/update")
	public String update(Board board) {
		try {
			boardRepo.update(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/detail/"+board.getId();
	}
	
	//	인터셉터 처리(사용자=글작성자)
	@GetMapping("/delete/{boardId}")
	public String delete(@PathVariable int boardId) {
		boardRepo.delete(boardId);
		return "redirect:/home";
	}
	
}
