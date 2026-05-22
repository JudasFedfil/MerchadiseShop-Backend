package com.example.merchshop.service;

import com.example.merchshop.entity.Order;
import com.example.merchshop.entity.Product;
import com.example.merchshop.entity.ProductVariant;
import com.example.merchshop.repository.OrderRepository;
import com.example.merchshop.repository.ProductRepository;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    private final ObjectMapper objectMapper = new ObjectMapper();

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public Order getOrderById(Integer id) {
        return orderRepository.findById(id).orElse(null);
    }

    // --- NGHIỆP VỤ TẠO ĐƠN HÀNG (TRỪ KHO + CỘNG LƯỢT BÁN) ---
    @Transactional
    public Order placeNewOrder(Order order) {
        order.setStatus("pending");
        Order savedOrder = orderRepository.save(order);

        processInventory(savedOrder.getItems(), 1); // 1 = Đặt hàng

        return savedOrder;
    }

    // --- NGHIỆP VỤ CẬP NHẬT TRẠNG THÁI (HOÀN TRẢ KHO NẾU HỦY) ---
    @Transactional
    public Order updateOrderStatus(Integer id, String newStatus) {
        Order existingOrder = orderRepository.findById(id).orElse(null);
        if (existingOrder == null) return null;

        String oldStatus = existingOrder.getStatus();
        existingOrder.setStatus(newStatus);

        boolean wasCancelled = "cancelled".equals(oldStatus);
        boolean isNowCancelled = "cancelled".equals(newStatus);

        if (!wasCancelled && isNowCancelled) {
            // Đơn bị hủy -> Trả lại kho (-1)
            processInventory(existingOrder.getItems(), -1);
        } else if (wasCancelled && !isNowCancelled) {
            // Đơn được khôi phục -> Trừ kho lại (1)
            processInventory(existingOrder.getItems(), 1);
        }

        return orderRepository.save(existingOrder);
    }

    public void deleteOrder(Integer id) {
        orderRepository.deleteById(id);
    }

    // --- HÀM HỖ TRỢ ĐỌC JSON VÀ XỬ LÝ KHO ---
    private void processInventory(String itemsJson, int multiplier) {
        if (itemsJson == null || itemsJson.isEmpty()) return;

        try {
            JsonNode itemsArray = objectMapper.readTree(itemsJson);
            for (JsonNode item : itemsArray) {
                String itemIdStr = item.get("id").asText();
                int quantity = item.get("quantity").asInt();

                Integer productId;
                String variantName = null;

                // Xử lý ID có chứa biến thể từ Frontend (Ví dụ: "4-Màu đỏ")
                // Dùng split("-", 2) để tránh lỗi nếu tên biến thể vô tình có dấu gạch ngang
                if (itemIdStr.contains("-")) {
                    String[] parts = itemIdStr.split("-", 2);
                    productId = Integer.parseInt(parts[0]);
                    variantName = parts[1];
                } else {
                    productId = Integer.parseInt(itemIdStr);
                }

                // Cập nhật Database
                Product product = productRepository.findById(productId).orElse(null);
                if (product != null) {

                    // 1. Cập nhật tồn kho cho BIẾN THỂ (Nếu có)
                    if (variantName != null && product.getVariants() != null) {
                        for (ProductVariant variant : product.getVariants()) {
                            // Tìm đúng biến thể mà khách đã mua
                            if (variantName.equals(variant.getName())) {
                                int currentVariantStock = variant.getStock() != null ? variant.getStock() : 0;
                                variant.setStock(Math.max(0, currentVariantStock - (quantity * multiplier)));
                                break;
                            }
                        }
                    }

                    // 2. Cập nhật tồn kho tổng (Stock) của Sản phẩm
                    int currentStock = product.getStock() != null ? product.getStock() : 0;
                    product.setStock(Math.max(0, currentStock - (quantity * multiplier)));

                    // 3. Cập nhật lượt bán (Sold)
                    int currentSold = product.getSold() != null ? product.getSold() : 0;
                    product.setSold(Math.max(0, currentSold + (quantity * multiplier)));

                    productRepository.save(product);
                }
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi xử lý kho cho đơn hàng: " + e.getMessage());
        }
    }
}