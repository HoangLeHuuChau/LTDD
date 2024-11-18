class SinhVien {
  String _hoTen;
  int _tuoi;
  String _maSv;
  double _diemTB;

  //constructor
  SinhVien(this._hoTen, this._tuoi, this._maSv, this._diemTB);


  //Getter
  String get hoTen => _hoTen;
  int get tuoi => _tuoi;
  String get maSV => _maSv;
  double get diemTB => _diemTB;

  //Setter
  set hoTen(String hoTen){
    if(hoTen.trim().isNotEmpty){
      _hoTen = hoTen;
    }
  }
  set tuoi(int value){
    if(value > 0){
      _tuoi = value;
    }
    //_tuoi = (value > 0)? value: _tuoi;
  }
  set maSv(String value){
    if(value.trim().isNotEmpty){
      _maSv = value;
    }
  }
  set diemTB(double value){
    if(value >= 0 && value <= 10){
      _diemTB = value;
    }
  }

  void hienThiThongTin() {
    print("Họ tên: $_hoTen, Tuổi: $_tuoi, Mã SV: $_maSv, Điểm TB: $_diemTB");
  }

  String xepLoai() {
    /*if (_diemTB >= 8.0) {
      return "Giỏi";
    } else if (_diemTB >= 6.5) {
      return "Khá";
    } else if (_diemTB >= 5.0) {
      return "Trung bình";
    } else {
      return "Yếu";
    }
  }*/
  return _diemTB >= 8.0 ? 'Giỏi' :
        _diemTB >= 6.5 ? 'Khá' :
        _diemTB >= 5.0 ? 'Trung bình' : 'Yếu';     
  }
}