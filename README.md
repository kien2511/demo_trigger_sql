# demo_trigger_sql
Bài tập số 5 của sinh viên:K225480106032 - Nguyễn Trung Kiên - Môn hệ quản trị cơ sở dữ liệu
SUBJECT: Trigger on mssql

# A. Trình bày lại đầu bài của đồ án PT&TKHT:
1. Mô tả bài toán của đồ án PT&TKHT, 
   đưa ra yêu cầu của bài toán đó
2. Cơ sở dữ liệu của Đồ án PT&TKHT :
   Có database với các bảng dữ liệu cần thiết (3nf),
   Các bảng này đã có PK, FK, CK cần thiết
 
# B. Nội dung Bài tập 05:
1. Dựa trên cơ sở là csdl của Đồ án
2. Tìm cách bổ xung thêm 1 (hoặc vài) trường phi chuẩn
   (là trường tính toán đc, nhưng thêm vào thì ok hơn,
    ok hơn theo 1 logic nào đó, vd ok hơn về speed)
   => Nêu rõ logic này!
3. Viết trigger cho 1 bảng nào đó, 
   mà có sử dụng trường phi chuẩn này,
   nhằm đạt được 1 vài mục tiêu nào đó.
   => Nêu rõ các mục tiêu 
4. Nhập dữ liệu có kiểm soát, 
   nhằm để test sự hiệu quả của việc trigger auto run.
5. Kết luận về Trigger đã giúp gì cho đồ án của em.
# ----------------------------------------------------------
bài làm 

#  A. Trình bày lại đầu bài của đồ án PT&TKHT:
1. Mô tả bài toán của đồ án PT&TKHT, 
   đưa ra yêu cầu của bài toán đó
2. Cơ sở dữ liệu của Đồ án PT&TKHT :
   Có database với các bảng dữ liệu cần thiết (3nf),
   Các bảng này đã có PK, FK, CK cần thiết


1 mô tả bài toán và đưa ra yêu cầu của bài toán
Trong các trường đại học, việc quản lý đồ án tốt nghiệp của sinh viên là một công việc quan trọng nhưng phức tạp, bao gồm nhiều đối tượng như sinh viên, giảng viên hướng dẫn, hội đồng chấm đồ án, cũng như các quá trình như đăng ký đề tài, phê duyệt, thực hiện, báo cáo tiến độ, chấm điểm và lưu trữ kết quả.

Tuy nhiên, việc quản lý này hiện nay còn thực hiện thủ công hoặc qua các file rời rạc, gây khó khăn trong việc theo dõi, tổng hợp thông tin, và báo cáo. Do đó, cần thiết phải xây dựng một hệ thống quản lý đồ án sinh viên hỗ trợ tự động hóa các quy trình trên, giúp quản lý hiệu quả hơn, giảm thiểu sai sót, và tiết kiệm thời gian.



    Yêu cầu của bài toán
2.1. Chức năng chính của hệ thống
Quản lý sinh viên: Thêm/sửa/xóa/thống kê thông tin sinh viên tham gia đồ án.

Quản lý giảng viên: Quản lý thông tin giảng viên hướng dẫn và phản biện.

Quản lý đề tài đồ án: Tạo mới, duyệt đề tài, phân công đề tài cho sinh viên.

Phân công hướng dẫn: Gán giảng viên hướng dẫn cho từng đề tài của sinh viên.

Quản lý tiến độ và báo cáo: Cập nhật tiến độ làm đồ án, nộp báo cáo theo đợt.

Phản hồi và đánh giá: Giảng viên phản hồi, góp ý và cho điểm đồ án.

Quản lý điểm: Nhập điểm từ các giảng viên, tổng hợp điểm và xuất kết quả.

Thống kê và báo cáo: Xuất các báo cáo thống kê theo lớp, giảng viên, năm học,...

2. Cơ sở dữ liệu của Đồ án PT&TKHT :
   Có database với các bảng dữ liệu cần thiết (3nf),
   Các bảng này đã có PK, FK, CK cần thiết

   bảng sinh viên
   ![image](https://github.com/user-attachments/assets/6f3e2f56-b30a-432c-8686-2bf0a7a27caa)

   bảng giảng viên
   ![image](https://github.com/user-attachments/assets/6b03e7f6-6957-4610-a53e-7edc312fc00b)

   bảng quản trị viên
   ![image](https://github.com/user-attachments/assets/85a2b84f-35d6-4096-97b2-47494b50d068)

   bảng đề tài
   ![image](https://github.com/user-attachments/assets/a3d34d72-446e-4e70-a9c3-bd02e7b0a17a)

   bảng báo cáo
   ![image](https://github.com/user-attachments/assets/25a50a5e-6428-4477-8e62-0dddd17c1e7d)

   bảng phản hồi
   ![image](https://github.com/user-attachments/assets/22362c47-74c6-4a67-900c-5966ea12693d)

   bảng thời gian
   ![image](https://github.com/user-attachments/assets/f0423429-1705-420f-9dee-0ccd330a9e55)

   bảng thống kê
   ![image](https://github.com/user-attachments/assets/fbf060ec-90c1-4fb3-92ca-98a930f7c7c8)

   bảng điểm
   ![image](https://github.com/user-attachments/assets/fb03008a-e896-4173-8af9-fd4155979d5a)

   

# ----------------------------------------------------------------------------------------------

 
# B. Nội dung Bài tập 05:
1. Dựa trên cơ sở là csdl của Đồ án
2. Tìm cách bổ xung thêm 1 (hoặc vài) trường phi chuẩn
   (là trường tính toán đc, nhưng thêm vào thì ok hơn,
    ok hơn theo 1 logic nào đó, vd ok hơn về speed)
   => Nêu rõ logic này!
3. Viết trigger cho 1 bảng nào đó, 
   mà có sử dụng trường phi chuẩn này,
   nhằm đạt được 1 vài mục tiêu nào đó.
   => Nêu rõ các mục tiêu 
4. Nhập dữ liệu có kiểm soát, 
   nhằm để test sự hiệu quả của việc trigger auto run.
5. Kết luận về Trigger đã giúp gì cho đồ án của em.


2 bổ sung trường ohi chuẩn cập nhật điểm và số lần phản hồi
![image](https://github.com/user-attachments/assets/93ccbd77-0d32-4f02-b9d3-5813654f7a80)
Trường so_lan_phan_hoi là tổng số lần giảng viên đã phản hồi cho báo cáo đó (tức số bản ghi trong bảng phan_hoi ứng với ma_bao_cao).

Đây là trường tính toán được, nhưng nếu truy vấn nhiều lần thì tốn tài nguyên (JOIN hoặc COUNT(*)) => nên denormalize để cải thiện tốc độ truy xuất.

Ví dụ khi admin hoặc giảng viên cần thống kê hoặc tìm các báo cáo "bị phản hồi nhiều lần" thì sẽ nhanh hơn nhiều nếu có sẵn trường này.

CREATE OR ALTER TRIGGER trg_CapNhat_SoLanPhanHoi
ON phan_hoi
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật tất cả các báo cáo liên quan đến các phản hồi mới được thêm vào
    UPDATE bc
    SET so_lan_phan_hoi = (
        SELECT COUNT(*) 
        FROM phan_hoi ph
        WHERE ph.ma_bao_cao = bc.ma_bao_cao
    )
    FROM bao_cao bc
    WHERE bc.ma_bao_cao IN (
        SELECT DISTINCT ma_bao_cao FROM inserted
    );
END;

![image](https://github.com/user-attachments/assets/e67661a4-b6b8-45ea-8a8b-1926addce065)

kết quả 
![image](https://github.com/user-attachments/assets/2b34abd9-d892-4923-8789-d6718a30ecfb)

kêt luận 
Trigger giúp hệ thống của em chủ động và tự động cập nhật dữ liệu phụ (phi chuẩn) để tăng tốc độ truy vấn. Ví dụ như khi giảng viên phản hồi, hệ thống sẽ tự động đếm số lần phản hồi và lưu lại trong bảng bao_cao, giúp giảm thời gian xử lý khi thống kê hoặc lọc các báo cáo nhiều lỗi. Trigger cũng làm hệ thống nhất quán và tránh lỗi do quên cập nhật thủ công."








 
