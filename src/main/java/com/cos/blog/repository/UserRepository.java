package com.cos.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.cos.blog.model.User;

//DAO
//자동으로  bean등록이 된다.
//@Repository 생략가능
public interface UserRepository extends JpaRepository<User, Integer>{

	User findByEmail(String email);
	// select * from user where username =? AND password =?
	User findByUsernameAndPassword(String username, String password);
	
}

	// JPA Naming 전략
	// select * from user where username =? AND password =?
	//User findByUsernameAndPassword(String username, String password);
	
	//	@Query(value = "SELECT * FROM user WHRERE username=? AND password = >2", nativeQuery = true)
	//	User login(String username, String password);

	//	@Query(value = "SELECT * FROM user WHRERE username=:username AND password = :password", nativeQuery = true)
	//	User login(String username, String password);

