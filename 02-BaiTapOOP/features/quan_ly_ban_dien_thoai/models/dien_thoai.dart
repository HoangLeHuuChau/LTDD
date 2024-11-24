class DienThoai {
  //Thuộc tính
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTon;
  bool _trangThai;

  @override
  String toString() {
    return '$_tenDienThoai ($_maDienThoai) - ${_hangSanXuat}, Giá bán: $_giaBan, Số lượng tồn: $_soLuongTon';
  }

  //Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat, this._giaNhap, this._giaBan, this._soLuongTon, this._trangThai);

  //Getter
  String get maDienThoai => _maDienThoai;
  String get tenDienThoai => _tenDienThoai;
  String get hangSanXuat => _hangSanXuat;
  double get giaNhap => _giaNhap;
  double get giaBan => _giaBan;
  int get soLuongTon => _soLuongTon;
  bool get trangThai => _trangThai;

  //Setter
  set maDienThoai(String value){
    if (!RegExp(r'^DT-\w+$').hasMatch(value) || value.isEmpty) {
      throw ArgumentError('Mã điện thoại phải định dạng "DT-XXX" và không rỗng.');
    }
    _maDienThoai = value;
  }
  set tenDienThoai(String value){
    if (value.isEmpty) {
      throw ArgumentError('Tên điện thoại không được rỗng.');
    }
    _tenDienThoai = value;
  }
  set hangSanXuat(String value) {
    if (value.isEmpty) {
      throw ArgumentError('Hãng sản xuất không được rỗng.');
    }
    _hangSanXuat = value;
  }
  set giaNhap(double value) {
    if (value <= 0) {
      throw ArgumentError('Giá nhập phải lớn hơn 0.');
    }
    _giaNhap = value;
  }
  set giaBan(double value) {
    if (value <= 0 || value <= _giaNhap) {
      throw ArgumentError('Giá bán phải lớn hơn giá nhập và > 0.');
    }
    _giaBan = value;
  }
  set soLuongTon(int value) {
    if (value < 0) {
      throw ArgumentError('Số lượng tồn phải >= 0.');
    }
    _soLuongTon = value;
  }
  set trangThai(bool value) => _trangThai = value;

  //Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() {
    return (_giaBan - _giaNhap) * _soLuongTon;
  }

  //Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print('Mã: $_maDienThoai, Tên: $_tenDienThoai, Hãng: $_hangSanXuat');
    print('Giá nhập: $_giaNhap, Giá bán: $_giaBan, Số lượng tồn: $_soLuongTon');
    print('Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}');
  }

  //Phương thức kiểm tra có thể bán không(còn hàng và đang kinh doanh)
  bool coTheBan() {
    return _soLuongTon > 0 && _trangThai;
  }
}