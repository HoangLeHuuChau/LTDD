import '../models/doc_gia.dart';
import '../models/sach.dart';
import '../models/thu_vien.dart';
void main(){
  // Tạo sách
  Sach sach1 = Sach("S001", "Lập trình Dart", "Nguyen Van A");
  Sach sach2 = Sach("S002", "Học Flutter cơ bản", "Tran Thi B");

  // Tạo độc giả
  DocGia docGia = DocGia("DG001", "Nguyen Van C");

  // Tạo thư viện
  ThuVien thuVien = ThuVien();
  thuVien.themSach(sach1);
  thuVien.themSach(sach2);
  thuVien.themDocGia(docGia);

  // Hiển thị danh sách sách
  thuVien.hienThiDanhSachSach();

  // Mượn sách
  docGia.muonSach(sach1);
  docGia.muonSach(sach1); // Thử mượn lại sách đã mượn

  thuVien.hienThiDanhSachSach();
  // Trả sách
  docGia.traSach(sach1);

  // Hiển thị lại danh sách sách
  thuVien.hienThiDanhSachSach();
}