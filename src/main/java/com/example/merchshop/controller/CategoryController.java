package com.example.merchshop.controller;
import com.example.merchshop.entity.Category;
import com.example.merchshop.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/categories")
public class CategoryController {
    @Autowired private CategoryService categoryService;
    @GetMapping
    public List<Category> getAll() { return categoryService.getAllCategories(); }
    @PostMapping
    public Category create(@RequestBody Category category) { return categoryService.saveCategory(category); }
}