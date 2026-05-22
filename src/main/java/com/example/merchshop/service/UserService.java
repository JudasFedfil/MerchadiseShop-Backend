package com.example.merchshop.service;

import com.example.merchshop.entity.User;
import com.example.merchshop.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(Integer id) {
        return userRepository.findById(id).orElse(null);
    }

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public User updateUser(Integer id, User userDetails) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            userDetails.setId(id);
            return userRepository.save(userDetails);
        }
        return null;
    }

    public void deleteUser(Integer id) {
        userRepository.deleteById(id);
    }

    public User login(String username, String password) {
        // Tìm user có khớp username và password trong DB không
        return userRepository.findByUsernameAndPassword(username, password).orElse(null);
    }
}