package com.cos.blog.controller.api;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.cos.blog.dto.ResponseDto;
import com.cos.blog.model.Board;
import com.cos.blog.model.RoleType;
import com.cos.blog.model.User;
import com.cos.blog.service.UserService;

@RestController
public class BoardApiController {

	
	@PostMapping("/api/board")
	public ResponseDto<Integer> save(@RequestBody Board board) {
	
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
}
