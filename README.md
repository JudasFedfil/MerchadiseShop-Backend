# MerchadiseShop - Backend (Spring Boot API)

Hệ thống cung cấp dịch vụ RESTful API phục vụ cho ứng dụng thương mại điện tử bán mô hình, trang phục anime và Gunpla. Dự án được xây dựng dựa trên kiến trúc Spring Ecosystem giúp tối ưu hiệu năng và quản lý dữ liệu chặt chẽ.

## 🛠️ Công Nghệ & Thư Viện Sử Dụng

* **Ngôn ngữ:** Java 17+
* **Framework chính:** Spring Boot 3.x
* **Quản lý dữ liệu & Database:** * Spring Data JPA (Quản lý thực thể và truy vấn cơ sở dữ liệu)
  * MySQL / PostgreSQL (Hệ quản trị cơ sở dữ liệu)
* **Tiện ích:** Lombok (Giảm thiểu boilerplate code như getters/setters)
* **Quản lý dự án:** Maven

## 📂 Cấu Trúc Mã Nguồn Chính

Cấu trúc các package trong `src/main/java/.../` được tổ chức theo kiến trúc phân lớp chuẩn:

* `config/`: Cấu hình hệ thống (CORS, Security, Bean Definitions).
* `controllers/`: Nơi tiếp nhận các request từ phía Front-end (Vue.js), xử lý định tuyến REST API.
* `models/` (hoặc `entities/`): Định nghĩa cấu trúc các bảng trong Database (Product, User, Order, Cart...).
* `repositories/`: Giao tiếp trực tiếp với cơ sở dữ liệu bằng cách kế thừa `JpaRepository`, hỗ trợ phân trang chuẩn xác thông qua `Pageable`.
* `services/`: Nơi xử lý toàn bộ logic nghiệp vụ của hệ thống (Tính toán giỏ hàng, xử lý đặt hàng, kiểm tra tồn kho).
* `utils/`: Thư mục chứa các class tiện ích, cấu trúc bổ trợ dùng chung cho toàn dự án.

## ⚙️ Hướng Dẫn Khởi Chạy Local

Để chạy dự án Backend này trên máy tính của bạn, hãy thực hiện theo các bước sau:

### 1. Cấu hình Cơ Sở Dữ Liệu
Mở file `src/main/resources/application.properties` (hoặc `application.yml`) và cập nhật lại thông tin kết nối database của bạn:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/db_merchshop?createDatabaseIfNotExist=true&useSSL=false&serverTimezone=UTC
spring.datasource.username=your_username
spring.datasource.password=your_password

# Tự động đồng bộ cấu trúc class Java thành bảng trong DB
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
