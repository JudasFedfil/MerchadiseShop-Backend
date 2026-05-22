package com.example.merchshop.repository;

import com.example.merchshop.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    // Tự động tạo câu SQL: SELECT * FROM users WHERE username = ? AND password = ?
    Optional<User> findByUsernameAndPassword(String username, String password);
}