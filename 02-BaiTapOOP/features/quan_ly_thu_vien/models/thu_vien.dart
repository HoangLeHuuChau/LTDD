import '../models/doc_gia.dart';
import '../models/sach.dart';

class ThuVien {
  List<Sach> _danhSachSach = [];
  List<DocGia> _danhSachDocGia = [];

  // Phương thức thêm sách
  void themSach(Sach sach) {
    _danhSachSach.add(sach);
  }

  // Phương thức thêm độc giả
  void themDocGia(DocGia docGia) {
    _danhSachDocGia.add(docGia);
  }

  // Phương thức hiển thị danh sách sách
  void hienThiDanhSachSach() {
    print("\nDanh sách sách trong thư viện:");
    for (var sach in _danhSachSach) {
      sach.hienThiThongTin();
    }
  }
}