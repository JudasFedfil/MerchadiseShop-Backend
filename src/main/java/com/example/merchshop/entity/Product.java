package com.example.merchshop.entity;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import java.util.List;
import java.time.LocalDateTime;
import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "categoryId")
    private Integer categoryId;

    private String name;
    private Double price;
    private String image;

    @Column(columnDefinition = "TEXT")
    private String description;

    private Integer stock;
    private Float rating;
    private Boolean isHot;
    private Integer sold;

    private Integer discount;
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime discountStartDate;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private LocalDateTime discountEndDate;


    // Tự động gom các biến thể có cùng productId thành 1 mảng JSON
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JsonManagedReference
    private List<ProductVariant> variants;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Float getRating() {
        return rating;
    }

    public void setRating(Float rating) {
        this.rating = rating;
    }

    public Boolean getHot() {
        return isHot;
    }

    public void setHot(Boolean hot) {
        isHot = hot;
    }

    public Integer getSold() {
        return sold;
    }

    public void setSold(Integer sold) {
        this.sold = sold;
    }

    public List<ProductVariant> getVariants() {
        return variants;
    }

    public void setVariants(List<ProductVariant> variants) {
        this.variants = variants;
    }

    public Integer getDiscount() {
        return discount;
    }

    public LocalDateTime getDiscountStartDate() { return discountStartDate; }
    public void setDiscountStartDate(LocalDateTime discountStartDate) { this.discountStartDate = discountStartDate; }
    public LocalDateTime getDiscountEndDate() { return discountEndDate; }
    public void setDiscountEndDate(LocalDateTime discountEndDate) { this.discountEndDate = discountEndDate; }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }


    // Tự động tính xem % giảm giá hiện tại là bao nhiêu (Nếu hết hạn thì trả về 0)
    public Double getActiveDiscount() {
        if (this.discount == null || this.discount <= 0) return 0.0;

        LocalDateTime now = LocalDateTime.now();
        if (this.discountStartDate != null && now.isBefore(this.discountStartDate)) return 0.0; // Chưa tới giờ
        if (this.discountEndDate != null && now.isAfter(this.discountEndDate)) return 0.0;   // Đã quá hạn

        return this.discount.doubleValue();
    }

    // Tính giá tiền dựa trên % giảm giá thực tế đang Active
    public Double getDiscountedPrice() {
        if (getActiveDiscount() <= 0) {
            return this.price; // Trả về giá gốc nếu không có sale
        }
        return this.price - (this.price * (getActiveDiscount() / 100.0));
    }

}