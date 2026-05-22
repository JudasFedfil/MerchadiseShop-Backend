package com.example.merchshop.service;

import com.example.merchshop.entity.Product;
import com.example.merchshop.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    // Lấy tất cả sản phẩm
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    // Lấy 1 sản phẩm theo ID
    public Product getProductById(Integer id) {
        return productRepository.findById(id).orElse(null);
    }

    // Lấy danh sách sản phẩm HOT cho Trang chủ
    public List<Product> getHotProductsForHome() {
        List<Product> allProducts = productRepository.findAll();

        // 1. Tìm ID của 10 sản phẩm bán chạy nhất
        List<Integer> top10SoldIds = allProducts.stream()
                .sorted((p1, p2) -> Integer.compare(
                        p2.getSold() != null ? p2.getSold() : 0,
                        p1.getSold() != null ? p1.getSold() : 0))
                .limit(10)
                .map(Product::getId)
                .collect(Collectors.toList());

        // 2. Lọc danh sách
        return allProducts.stream()
                .filter(p -> (p.getHot() != null && p.getHot()) || top10SoldIds.contains(p.getId()))                .sorted((p1, p2) -> Integer.compare(
                        p2.getSold() != null ? p2.getSold() : 0,
                        p1.getSold() != null ? p1.getSold() : 0))
                .limit(10)
                .collect(Collectors.toList());
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public Product updateProduct(Integer id, Product productDetails) {
        Product existingProduct = productRepository.findById(id).orElse(null);
        if (existingProduct != null) {
            productDetails.setId(id);
            return productRepository.save(productDetails);
        }
        return null;
    }

    public void deleteProduct(Integer id) {
        productRepository.deleteById(id);
    }
}