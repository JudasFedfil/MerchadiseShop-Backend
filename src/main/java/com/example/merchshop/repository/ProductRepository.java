package com.example.merchshop.repository;

import com.example.merchshop.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    // Chỉ cần để trống thế này, Spring Boot đã tự động viết sẵn cho bạn
    // các hàm: findAll(), findById(), save(), deleteById()...
}