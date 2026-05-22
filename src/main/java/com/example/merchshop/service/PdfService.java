package com.example.merchshop.service;

import com.example.merchshop.entity.Order;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.UnitValue;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;

@Service
public class PdfService {

    private final ObjectMapper objectMapper = new ObjectMapper();

    public byte[] generateOrderPdf(Order order) {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            PdfWriter writer = new PdfWriter(baos);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            // 1. NẠP FONT TIẾNG VIỆT TỪ THƯ MỤC RESOURCES
            ClassPathResource resource = new ClassPathResource("fonts/arial.ttf");
            InputStream inputStream = resource.getInputStream();
            byte[] fontBytes = StreamUtils.copyToByteArray(inputStream);

            // IDENTITY_H là chuẩn mã hóa hỗ trợ Unicode/Tiếng Việt
            PdfFont vietnameseFont = PdfFontFactory.createFont(fontBytes, PdfEncodings.IDENTITY_H);

            // Set font mặc định cho toàn bộ tài liệu PDF
            document.setFont(vietnameseFont);

            // 2. NỘI DUNG HÓA ĐƠN
            document.add(new Paragraph("HÓA ĐƠN BÁN HÀNG").setBold().setFontSize(20));
            document.add(new Paragraph("Mã đơn hàng: #" + order.getId()));
            document.add(new Paragraph("Khách hàng: " + order.getCustomerName()));
            document.add(new Paragraph("Số điện thoại: " + order.getPhone()));
            document.add(new Paragraph("Địa chỉ: " + order.getAddress()));
            document.add(new Paragraph("Ngày đặt: " + order.getCreatedAt()));
            document.add(new Paragraph("\n"));

            // 3. BẢNG DANH SÁCH SẢN PHẨM
            float[] columnWidths = {4, 2, 1, 2};
            Table table = new Table(UnitValue.createPointArray(columnWidths));
            table.setWidth(UnitValue.createPercentValue(100));

            table.addHeaderCell(new Paragraph("Tên sản phẩm").setBold());
            table.addHeaderCell(new Paragraph("Đơn giá").setBold());
            table.addHeaderCell(new Paragraph("SL").setBold());
            table.addHeaderCell(new Paragraph("Thành tiền").setBold());

            // Đọc JSON items
            JsonNode itemsArray = objectMapper.readTree(order.getItems());
            for (JsonNode item : itemsArray) {
                table.addCell(item.get("name").asText());
                table.addCell(String.format("%,.0f đ", item.get("price").asDouble()));
                table.addCell(item.get("quantity").asText());
                double total = item.get("price").asDouble() * item.get("quantity").asInt();
                table.addCell(String.format("%,.0f đ", total));
            }

            document.add(table);
            document.add(new Paragraph("\n"));

            // TỔNG CỘNG
            document.add(new Paragraph("TỔNG CỘNG: " + String.format("%,.0f VNĐ", order.getTotal()))
                    .setBold()
                    .setFontSize(14));

            document.close();
            return baos.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // doanh thu
    public byte[] generateStatisticPdf(String periodTitle, double cat1, double cat2, double cat3) {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            PdfWriter writer = new PdfWriter(baos);
            PdfDocument pdf = new PdfDocument(writer);
            Document document = new Document(pdf);

            // Nạp font tiếng Việt (đã tạo ở bước trước)
            ClassPathResource resource = new ClassPathResource("fonts/arial.ttf");
            byte[] fontBytes = StreamUtils.copyToByteArray(resource.getInputStream());
            PdfFont vietnameseFont = PdfFontFactory.createFont(fontBytes, PdfEncodings.IDENTITY_H);
            document.setFont(vietnameseFont);

            document.add(new Paragraph("BÁO CÁO DOANH THU").setBold().setFontSize(20));
            document.add(new Paragraph("Kỳ báo cáo: " + periodTitle));
            document.add(new Paragraph("\n"));

            float[] columnWidths = {3, 3};
            Table table = new Table(UnitValue.createPointArray(columnWidths));
            table.setWidth(UnitValue.createPercentValue(100));

            table.addHeaderCell(new Paragraph("Danh mục").setBold());
            table.addHeaderCell(new Paragraph("Doanh thu").setBold());

            table.addCell("Figure Anime"); table.addCell(String.format("%,.0f VNĐ", cat1));
            table.addCell("Gundam (Gunpla)"); table.addCell(String.format("%,.0f VNĐ", cat2));
            table.addCell("Merchandise"); table.addCell(String.format("%,.0f VNĐ", cat3));
            document.add(table);

            double total = cat1 + cat2 + cat3;
            document.add(new Paragraph("\n"));
            document.add(new Paragraph("TỔNG DOANH THU: " + String.format("%,.0f VNĐ", total)).setBold().setFontSize(16));

            document.close();
            return baos.toByteArray();
        } catch (Exception e) { e.printStackTrace(); return null; }
    }
}