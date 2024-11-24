import '../models/cua_hang.dart';
import '../models/dien_thoai.dart';
import '../models/hoa_don.dart';

void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang('Cửa Hàng Điện Thoại ABC', '123 Đường ABC, Thành phố XYZ');

  // Thêm điện thoại mới
  print('--- Thêm điện thoại mới ---');
  try {
    cuaHang.themDienThoai(DienThoai( 'DT-001', 'iPhone 13', 'Apple', 20000000, 25000000, 10, true));
    cuaHang.themDienThoai(DienThoai( 'DT-002', 'Samsung Galaxy S22', 'Samsung', 18000000, 23000000, 15, true));
    cuaHang.themDienThoai(DienThoai( 'DT-003', 'Xiaomi Mi 12', 'Xiaomi', 12000000, 15000000, 20, true));
    print('Thêm điện thoại thành công!');
  } catch (e) {
    print('Lỗi khi thêm điện thoại: $e');
  }
  cuaHang.hienThiDanhSachDienThoai();

  // Cập nhật thông tin điện thoại
  print('\n--- Cập nhật thông tin điện thoại ---');
  try{
    cuaHang.capNhatDienThoai('DT-002', DienThoai('DT-002', 'Samsung Galaxy S22 Ultra', 'Samsung', 20000000, 27000000, 10, true));
    print('Cập nhật điện thoại thành công!');
  } catch (e) {
    print('Lỗi khi cập nhật điện thoại: $e');
  }
  cuaHang.hienThiDanhSachDienThoai();

  // Ngừng kinh doanh
  print('--- Ngừng kinh doanh ---');
  cuaHang.ngungKinhDoanhDienThoai('DT-003');
  cuaHang.hienThiDanhSachDienThoai();

  // Tạo hóa đơn
  try {
    cuaHang.taoHoaDon(
      HoaDon( 'HD-001', DateTime.now(), 
            DienThoai( 'DT-001', 'iPhone 13', 'Apple', 20000000, 25000000, 10, true), 2, 25000000, 'Nguyen Van A', '0123456789'));
    cuaHang.taoHoaDon(
      HoaDon( 'HD-002', DateTime.now(), 
          DienThoai('DT-002', 'Samsung Galaxy S22 Ultra', 'Samsung', 20000000, 27000000, 10, true),  3, 27000000, 'Tran Thi B', '0987654321'),
    );
    print('Tạo hóa đơn thành công!');
  } catch (e) {
    print('Lỗi khi tạo hóa đơn: $e');
  }
  cuaHang.hienThiDanhSachHoaDon();

  // Thống kê doanh thu và lợi nhuận
  print('--- Thống kê doanh thu và lợi nhuận ---');
  DateTime tuNgay = DateTime.now().subtract(Duration(days: 7));
  DateTime denNgay = DateTime.now();
  print('${cuaHang.tinhTongDoanhThu(tuNgay, denNgay)}');
  print('${cuaHang.tinhTongLoiNhuan(tuNgay, denNgay)}');

  // Thống kê top bán chạy
  print('--- Thống kê top bán chạy ---');
  var topBanChay = cuaHang.thongKeTopBanChay(2);
  for (var i = 0; i < topBanChay.length; i++) {
    print('${i + 1}. ${topBanChay[i]}');
  }

  // Thống kê tồn kho
  print('--- Thống kê tồn kho ---');
  cuaHang.thongKeTonKho();
}