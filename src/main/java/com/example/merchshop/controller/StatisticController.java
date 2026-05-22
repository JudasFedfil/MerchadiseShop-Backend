package com.example.merchshop.controller;

import com.example.merchshop.entity.Order;
import com.example.merchshop.repository.OrderRepository;
import com.example.merchshop.service.PdfService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/statistics")
@CrossOrigin(origins = "http://localhost:8081", allowCredentials = "true") // Nhớ đổi port cho khớp Vue của bạn
public class StatisticController {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private PdfService pdfService;

    private final ObjectMapper objectMapper = new ObjectMapper();

    // Hàm xử lý logic tính tiền theo thời gian
    private Map<String, Double> calculateRevenue(String type, int month, int quarter, int year) {
        List<Order> orders = orderRepository.findAll();
        double cat1 = 0, cat2 = 0, cat3 = 0;

        for (Order o : orders) {
            if (!"completed".equals(o.getStatus())) continue; // Chỉ tính hóa đơn đã hoàn thành

            try {
                // Ngày trong DB đang lưu dạng "dd/MM/yyyy"
                String[] dateParts = o.getCreatedAt().split("/");
                if (dateParts.length == 3) {
                    int oMonth = Integer.parseInt(dateParts[1]);
                    int oYear = Integer.parseInt(dateParts[2]);
                    int oQuarter = (oMonth - 1) / 3 + 1; // Công thức tính quý

                    boolean match = false;
                    if ("month".equals(type) && oMonth == month && oYear == year) match = true;
                    else if ("quarter".equals(type) && oQuarter == quarter && oYear == year) match = true;
                    else if ("year".equals(type) && oYear == year) match = true;

                    if (match) {
                        JsonNode items = objectMapper.readTree(o.getItems());
                        for (JsonNode item : items) {
                            int catId = item.has("categoryId") ? item.get("categoryId").asInt() : 1;
                            double lineTotal = item.get("price").asDouble() * item.get("quantity").asInt();
                            if (catId == 1) cat1 += lineTotal;
                            else if (catId == 2) cat2 += lineTotal;
                            else if (catId == 3) cat3 += lineTotal;
                        }
                    }
                }
            } catch (Exception e) { e.printStackTrace(); }
        }

        Map<String, Double> result = new HashMap<>();
        result.put("cat1", cat1); result.put("cat2", cat2); result.put("cat3", cat3);
        return result;
    }

    // Trả về dữ liệu vẽ Chart
    @GetMapping("/revenue")
    public Map<String, Double> getRevenue(@RequestParam String type, @RequestParam(defaultValue = "0") int value, @RequestParam int year) {
        int month = type.equals("month") ? value : 0;
        int quarter = type.equals("quarter") ? value : 0;
        return calculateRevenue(type, month, quarter, year);
    }

    // Trả về file PDF
    @GetMapping("/export-pdf")
    public ResponseEntity<byte[]> exportStatisticPdf(@RequestParam String type, @RequestParam(defaultValue = "0") int value, @RequestParam int year) {
        int month = type.equals("month") ? value : 0;
        int quarter = type.equals("quarter") ? value : 0;
        Map<String, Double> data = calculateRevenue(type, month, quarter, year);

        String title = "Năm " + year;
        if (type.equals("month")) title = "Tháng " + month + " / " + year;
        if (type.equals("quarter")) title = "Quý " + quarter + " / " + year;

        byte[] pdfBytes = pdfService.generateStatisticPdf(title, data.get("cat1"), data.get("cat2"), data.get("cat3"));

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=baocao_doanhthu_" + year + ".pdf")
                .contentType(MediaType.APPLICATION_PDF)
                .body(pdfBytes);
    }
}