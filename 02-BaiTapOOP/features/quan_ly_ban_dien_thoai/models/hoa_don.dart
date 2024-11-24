import 'dien_thoai.dart';

class HoaDon {
  //Thuộc tính
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  //Constructor
  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua, this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);

  //Getter
  String get maHoaDon => _maHoaDon;
  DateTime get ngayBan => _ngayBan;
  DienThoai get dienThoai => _dienThoai;
  int get soLuongMua => _soLuongMua;
  double get giaBanThucTe => _giaBanThucTe;
  String get tenKhachHang => _tenKhachHang;
  String get soDienThoaiKhach => _soDienThoaiKhach;

  //Setter
  set maHoaDon(String value){
    if (!RegExp(r'^HD-\w+$').hasMatch(value) || value.isEmpty){
      throw ArgumentError('Mã hóa đơn phải định dạng "HD-XXX" và không rỗng.');
    }
    _maHoaDon = value;
  }
  set ngayBan(DateTime value){
    if(value.isAfter(DateTime.now())){
      throw ArgumentError('Ngày bán không sau ngày hiện tại.');
    }
    _ngayBan = value;
  }
  set dienThoai(DienThoai value){
    if (!value.coTheBan()) {
      throw Exception('Điện thoại không khả dụng để bán.');
    }
    _dienThoai = value;
  } 
  set soLuongMua(int value){
    if(value <= 0 || value > _dienThoai.soLuongTon){
      throw ArgumentError('Số lượng mua phải > 0 và <= số lượng tồn.');
    }
    _soLuongMua = value;
  }
  set giaBanThucTe (double value){
    if(value <= 0){
      throw ArgumentError('Giá bán thực tế > 0.');
    }
    _giaBanThucTe = value;
  }
  set tenKhachHang(String value){
    if(value.isEmpty){
      throw ArgumentError('Tên khách hàng không được rỗng.');
    }
  }
  set soDienThoaiKhach(String value){
    if (!RegExp(r'^\d{10}$').hasMatch(value)){
      throw ArgumentError('Số điện thoại không đúng định dạng.');
    }
    _soDienThoaiKhach = value;
  }

  //Phương thức tính tổng tiền
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  //Phương thức tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() => _soLuongMua * (_giaBanThucTe - _dienThoai.giaNhap);

  //Phương thức hiển thị thông tin hóa đơn
  void hienThiThongTin() {
    print('Mã hóa đơn: $_maHoaDon');
    print('Ngày bán: $_ngayBan');
    print('Khách hàng: $_tenKhachHang, SĐT: $_soDienThoaiKhach');
    print('Điện thoại: ${_dienThoai.tenDienThoai}');
    print('Số lượng: $_soLuongMua, Giá bán: $_giaBanThucTe');
    print('Tổng tiền: ${tinhTongTien()}');
  }

}