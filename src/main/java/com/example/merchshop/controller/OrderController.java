package com.example.merchshop.controller;

import com.example.merchshop.entity.Order;
import com.example.merchshop.service.OrderService;
import com.example.merchshop.service.PdfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping
    public List<Order> getAllOrders() {
        return orderService.getAllOrders();
    }

    @GetMapping("/{id}")
    public Order getOrderById(@PathVariable Integer id) {
        return orderService.getOrderById(id);
    }

    @PostMapping
    public Order createOrder(@RequestBody Order order) {
        return orderService.placeNewOrder(order);
    }

    @PatchMapping("/{id}")
    public Order updateOrderStatus(@PathVariable Integer id, @RequestBody Map<String, Object> updates) {
        if (updates.containsKey("status")) {
            String newStatus = (String) updates.get("status");
            return orderService.updateOrderStatus(id, newStatus);
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public void deleteOrder(@PathVariable Integer id) {
        orderService.deleteOrder(id);
    }

    @Autowired
    private PdfService pdfService;

    @GetMapping("/{id}/export-pdf")
    public ResponseEntity<byte[]> exportPdf(@PathVariable Integer id) {
        Order order = orderService.getOrderById(id);
        if (order == null) return ResponseEntity.notFound().build();

        byte[] pdfBytes = pdfService.generateOrderPdf(order);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=hoadon_" + id + ".pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdfBytes);
    }
}