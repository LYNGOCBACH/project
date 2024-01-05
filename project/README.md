# TO DO APP ❤️ Made with Flutter

# Giới thiệu:
ToDoFlutter là một ứng dụng danh sách việc cần làm đơn giản được xây dựng bằng Flutter và Firebase. Nó cho phép người dùng tạo, chỉnh sửa, xóa các tác vụ và đánh dấu chúng là đã hoàn thành. Ứng dụng sử dụng Firebase để xác thực và lưu trữ đám mây.

# Điều kiện tiêu quyết:
Trước khi bắt đầu, hãy đảm bảo bạn đã cài đặt các phần sau:

- Flutter
- Firebase

# Cấu trúc thư mục: 
- lib: Chứa mã nguồn của ứng dụng.
- data: Chứa các lớp và logic liên quan đến dữ liệu.
- database.dart: Lớp ToDoDataBase quản lý danh sách công việc và cung cấp các phương thức để thao tác dữ liệu.
- todo_task.dart: Định nghĩa lớp ToDoTask để biểu diễn một công việc.
- screens: Chứa các màn hình của ứng dụng.
- login_screen.dart: Màn hình đăng nhập.
- signup_screen.dart: Màn hình đăng ký.
- welcome.dart: Màn hình chào mừng và điều hướng đến các màn hình khác.
- home_page.dart: Màn hình chính hiển thị danh sách công việc và các chức năng quản lý.
- edit_task_screen.dart: Màn hình để sửa tên công việc.
- util: Chứa các widget và hàm tiện ích.
- dialog_box.dart: Widget hiển thị hộp thoại cho việc thêm công việc mới.
- my_button.dart: Widget nút được sử dụng trong các hộp thoại.
- todo_tile.dart: Widget hiển thị một công việc trong danh sách.
- main.dart: Nơi chính để khởi tạo ứng dụng và xác định các màn hình cơ bản.
- screenshots: Chứa ảnh màn hình của ứng dụng.
-firebase_options.dart: Định nghĩa các tùy chọn Firebase cho từng nền tảng.
-firebase_options.g.dart: Tệp được tạo ra bởi build_runner để chứa tùy chọn Firebase.

# Các thư viện sử dụng:
- flutter_slidable: Chức năng Cung cấp các widget giúp tạo ra các thành phần có thể trượt để mở các tùy chọn khác nhau. Trong ToDoFlutter, nó được sử dụng để tạo các hành động trượt cho từng mục công việc trong danh sách.
- hive: Chức năng Hive là một thư viện cơ sở dữ liệu NoSQL dựa trên key-value, linh hoạt và hiệu suất cao. Trong ToDoFlutter, Hive được sử dụng để lưu trữ các công việc (tasks) dưới dạng danh sách key-value, giúp giữ cho dữ liệu địa phương.
- hive_flutter: Chức năng Hive Flutter là phiên bản tương thích với Flutter của Hive. Nó cung cấp tích hợp Hive với Flutter để quản lý dữ liệu địa phương một cách hiệu quả. Được sử dụng trong ToDoFlutter để khởi tạo và quản lý hộp Hive.
- cupertino_icons: Chức năng Cung cấp một bộ biểu tượng cho ứng dụng Flutter trong kiểu thiết kế Cupertino (dành cho iOS). Trong ToDoFlutter, được sử dụng để thêm biểu tượng cho các nút và tiêu đề.
- firebase_auth: Chức năng Firebase Authentication là dịch vụ xác thực người dùng của Firebase. Trong ToDoFlutter, được sử dụng để đăng nhập và đăng ký người dùng.
- firebase_core: Chức năng Firebase Core là thư viện cơ bản để khởi tạo và cấu hình Firebase trong ứng dụng Flutter. Trong ToDoFlutter, được sử dụng để khởi tạo Firebase.
- cloud_firestore: Chức năng Firebase Cloud Firestore là một cơ sở dữ liệu NoSQL thời gian thực của Firebase. Trong ToDoFlutter, được sử dụng để lưu trữ và đồng bộ dữ liệu công việc giữa các thiết bị.
- hive_generator và build_runner: Chức năng Hive Generator và Build Runner là các công cụ hỗ trợ cho việc tạo mã và tạo mã chạy (code generation) cho Hive. Được sử dụng trong ToDoFlutter để tạo mã chạy khi mô hình Hive thay đổi.

# Các bước quan trọng:
- Xác Thực Người Dùng: Sử dụng Firebase Auth để đăng nhập và đăng ký người dùng.
- Lưu Trữ Dữ Liệu: Sử dụng Hive để lưu trữ danh sách công việc cục bộ và sử dụng Cloud Firestore để lưu trữ trên đám mây.
- Cập Nhật Giao Diện Người Dùng: Sử dụng StreamBuilder để theo dõi thay đổi trong danh sách công việc và cập nhật giao diện người dùng một cách tự động.
- Sửa Tên Công Việc: Cho phép người dùng sửa tên công việc và đồng bộ ngay lập tức với Cloud Firestore.
- Xóa Công Việc: Cho phép người dùng xóa công việc và đồng bộ ngay lập tức với Cloud Firestore.

# Chi tiết các bước:
* Tạo Giao Diện Người Dùng (UI)
Màn Hình Đăng Nhập và Đăng Ký:
- Tạo các trang login_screen.dart và signup_screen.dart.
- Sử dụng TextFormField để nhập email và mật khẩu.
- Sử dụng Firebase Auth để xác thực người dùng khi họ đăng nhập hoặc đăng ký.
Màn Hình Chính:
- Tạo home_page.dart để hiển thị danh sách công việc và các chức năng quản lý.
- Sử dụng StreamBuilder để theo dõi thay đổi trong danh sách công việc và cập nhật giao diện tự động.
- Sử dụng flutter_slidable để thêm hiệu ứng vuốt cho việc xóa công việc.
Màn Hình Sửa Công Việc:
- Tạo edit_task_screen.dart để cho phép người dùng sửa tên công việc.
- Sử dụng TextField để nhập tên mới và cập nhật dữ liệu ngay lập tức.
Các Widget Tiện Ích:
- Tạo dialog_box.dart để hiển thị hộp thoại cho việc thêm công việc mới.
- Tạo my_button.dart là một widget nút được sử dụng trong các hộp thoại.
- Tạo todo_tile.dart là một widget hiển thị một công việc trong danh sách.
* Lưu Trữ Dữ Liệu
Sử Dụng Hive:
- Tích hợp hive và hive_flutter để lưu trữ danh sách công việc cục bộ.
- Tạo lớp ToDoDataBase để quản lý các phương thức thêm, sửa, xóa và lấy danh sách công việc từ Hive.
Sử Dụng Firebase:
- Sử dụng Firebase Core để khởi tạo Firebase trong ứng dụng.
- Sử dụng Cloud Firestore để lưu trữ và đồng bộ dữ liệu công việc trên đám mây.
- Xác định các phương thức để đồng bộ dữ liệu giữa Hive và Cloud Firestore.
* Xử Lý Logic Ứng Dụng:
- Tạo lớp ToDoTask để biểu diễn một công việc.
- Tích hợp logic xử lý công việc như thêm, sửa và xóa trong ToDoDataBase.
- Sử dụng StreamController để theo dõi thay đổi trong danh sách công việc và thông báo cho StreamBuilder cập nhật giao diện.
* Xử Lý Xác Thực Người Dùng
- Sử dụng Firebase Auth để xác thực người dùng.
- Tạo các phương thức đăng nhập, đăng ký và đăng xuất.
- Hiển thị các màn hình tương ứng dựa trên trạng thái xác thực.

# Người khác có thể mở rộng:
- Thêm Ưu Đãi Khác: Mở rộng ứng dụng bằng cách thêm các tính năng như ưu đãi, hạn chế thời gian, hoặc độ ưu tiên công việc.
- Nhóm Công Việc: Cho phép người dùng nhóm công việc theo danh mục hoặc ưu tiên.
- Nhắc Nhở: Thêm tính năng nhắc nhở cho các công việc sắp tới.
- Chia Sẻ Công Việc: Cho phép người dùng chia sẻ công việc với người khác.
- Thiết Lập Ưu Tiên: Cho phép người dùng đặt ưu tiên cho công việc quan trọng.
- Tích Hợp Nhiều Người Dùng: Thêm tính năng để nhiều người dùng có thể sử dụng ứng dụng trên cùng một danh sách công việc.

# Cách cài đặt và chạy ứng dụng:

B1: Mở visual studio code

B2: clone code về

B3: Chạy terminal "flutter run --no-sound-null-safety"

B4: Run chạy code trên web

# Cách sử dụng:
1. Khởi chạy ứng dụng trên trình mô phỏng hoặc thiết bị vật lý.
2. Đăng ký tài khoản mới hoặc đăng nhập bằng tài khoản hiện có.
3. Thêm, chỉnh sửa hoặc xóa nhiệm vụ bằng giao diện ứng dụng.
4. Đánh dấu các nhiệm vụ đã hoàn thành bằng cách chuyển đổi hộp kiểm.
5. Đăng xuất bằng cách sử dụng tùy chọn menu.


![image](https://github.com/LYNGOCBACH/project/assets/125987097/29592b80-97c1-4f24-a75d-64f920a49b89)
![image](https://github.com/LYNGOCBACH/project/assets/125987097/dd0dd4cf-06cb-498d-9c07-4e0d13363538)
![image](https://github.com/LYNGOCBACH/project/assets/125987097/414104a4-cc61-4244-82ec-9f0c6463b3fe)

![image](https://github.com/LYNGOCBACH/project/assets/125987097/760156db-f1d0-4e56-9071-ef31ce575166)
![image](https://github.com/LYNGOCBACH/project/assets/125987097/bd8cf3f2-b818-43b9-ac67-e61bd7e65bdd)

![image](https://github.com/LYNGOCBACH/project/assets/125987097/5dbe135a-cd9b-4910-9f6d-f4ae33a67412)

![image](https://github.com/LYNGOCBACH/project/assets/125987097/b292b3bf-981a-4aae-8d51-a02f39f1db03)


