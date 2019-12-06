package com.cos.blogcrud.repository;

import java.util.List;

import com.cos.blogcrud.model.Board;

public interface BoardRepository {
	Board findById(int id);
	int findAll();
	List<Board> findByPage(int firstRecode);
	void save(Board board);
	void update(Board board);
	void delete(int id);
}
