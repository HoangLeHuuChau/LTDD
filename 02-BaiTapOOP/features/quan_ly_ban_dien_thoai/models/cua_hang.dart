import 'dien_thoai.dart';
import 'hoa_don.dart';

class CuaHang {
  //Thuộc tính
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  //Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  //Getter
  String get tenCuaHang => _tenCuaHang;
  String get diaChi => _diaChi;

  //Setter
  set tenCuaHang(String value) => _tenCuaHang = value;
  set diaChi(String value) => _diaChi = value;

  //Phương thức quản lý điện thoại
    //Thêm điện thoại mới
  void themDienThoai(DienThoai dienThoai) {
    if (_danhSachDienThoai.any((dt) => dt.maDienThoai == dienThoai.maDienThoai)) {
      throw Exception('Điện thoại với mã ${dienThoai.maDienThoai} đã tồn tại.');
    }
    _danhSachDienThoai.add(dienThoai);
    print('Đã thêm điện thoại: ${dienThoai.tenDienThoai}');
  }

    //Cập nhật thông tin điện thoại
  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    var index = _danhSachDienThoai.indexWhere((dt) => dt.maDienThoai == maDienThoai);
    if (index == -1) {
      throw Exception('Không tìm thấy điện thoại với mã $maDienThoai.');
    }
    _danhSachDienThoai[index] = dienThoaiMoi;
    print('Đã cập nhật điện thoại với mã $maDienThoai.');
  }

    //Ngừng kinh doanh điện thoại
  void ngungKinhDoanhDienThoai(String maDienThoai) {
    var dienThoai = _danhSachDienThoai.firstWhere((dt) => dt.maDienThoai == maDienThoai, orElse: () => throw Exception('Không tìm thấy điện thoại.'));
    dienThoai.trangThai = false;
    print('Điện thoại ${dienThoai.tenDienThoai} đã ngừng kinh doanh.');
  }

    //Tìm kiếm điện thoại(theo mã, tên, hãng)
  List<DienThoai> timKiemDienThoai({String? ma, String? ten, String? hang}) {
    return _danhSachDienThoai.where((dt) {
      return (ma == null || dt.maDienThoai.contains(ma)) &&
          (ten == null || dt.tenDienThoai.contains(ten)) &&
          (hang == null || dt.hangSanXuat.contains(hang));
    }).toList();
  }

    //Hiển thị danh sách điện thoại
  void hienThiDanhSachDienThoai() {
    if (_danhSachDienThoai.isEmpty) {
      print('Danh sách điện thoại trống.');
      return;
    }
    print('--- Danh sách điện thoại ---');
    _danhSachDienThoai.forEach((dt) => dt.hienThiThongTin());
  }

  //Phương pháp quản lý hóa đơn
    //Tạo hóa đơn mới(tự động cập nhật tồn kho)
  void taoHoaDon(HoaDon hoaDon) {
    if (!hoaDon.dienThoai.coTheBan()) {
      throw Exception('Điện thoại không khả dụng để bán.');
    }
    _danhSachHoaDon.add(hoaDon);
    hoaDon.dienThoai.soLuongTon -= hoaDon.soLuongMua;
    print('Đã tạo hóa đơn mới cho khách hàng: ${hoaDon.tenKhachHang}');
  }

    //Tìm kiếm hóa đơn (theo mã, ngày, khách hàng)
  List<HoaDon> timKiemHoaDon({String? ma, DateTime? ngay, String? khachHang}) {
    return _danhSachHoaDon.where((hd) {
      return (ma == null || hd.maHoaDon.contains(ma)) &&
          (ngay == null || hd.ngayBan == ngay) &&
          (khachHang == null || hd.tenKhachHang.contains(khachHang));
    }).toList();
  }

    //Hiển thị danh sách hóa đơn
  void hienThiDanhSachHoaDon() {
    if (_danhSachHoaDon.isEmpty) {
      print('Danh sách hóa đơn trống.');
      return;
    }
    print('--- Danh sách hóa đơn ---');
    _danhSachHoaDon.forEach((hd) => hd.hienThiThongTin());
  }

  //Thống kê
    //Tính tổng doanh thu theo khoảng thời gian
  double tinhTongDoanhThu(DateTime from, DateTime to) {
    return _danhSachHoaDon.where((hd) => hd.ngayBan.isAfter(from) && hd.ngayBan.isBefore(to))
      .fold(0, (sum, hd) => sum + hd.tinhTongTien());
  }

    //Tính tổng lợi nhuận theo khoảng thời gian
  double tinhTongLoiNhuan(DateTime from, DateTime to) {
    return _danhSachHoaDon.where((hd) => hd.ngayBan.isAfter(from) && hd.ngayBan.isBefore(to))
        .fold(0, (sum, hd) => sum + hd.tinhLoiNhuanThucTe());
  }

    //Thống kê top điện thoại bán chạy
  List<DienThoai> thongKeTopBanChay(int top) {
    var soLuongBanMap = <DienThoai, int>{};
    for (var dt in _danhSachDienThoai) {
      var soLuongBan = _danhSachHoaDon
          .where((hd) => hd.dienThoai == dt)
          .fold(0, (sum, hd) => sum + hd.soLuongMua);
      soLuongBanMap[dt] = soLuongBan;
    }
    var sortedList = soLuongBanMap.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return sortedList.take(top).map((e) => e.key).toList();
  }

    //Thống kê tồn kho
    void thongKeTonKho() {
      var sanPhamTon = _danhSachDienThoai.where((dt) => dt.soLuongTon > 0).toList();
      if (sanPhamTon.isEmpty) {
        print('Không có sản phẩm tồn kho.');
        return;
      }
      sanPhamTon.forEach((dt) {
        print('${dt.tenDienThoai} (${dt.maDienThoai}): ${dt.soLuongTon} chiếc');
      });
    }
}