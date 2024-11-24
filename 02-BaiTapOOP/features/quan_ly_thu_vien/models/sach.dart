class Sach {
  String _maSach;
  String _tenSach;
  String _tacGia;
  bool _trangThaiMuon = false;

  Sach(this._maSach, this._tenSach, this._tacGia);

  //Getter
  String get maSach => _maSach;
  String get tenSach => _tenSach;
  String get tacGia => _tacGia;
  bool get trangThaiMuon => _trangThaiMuon;

  //Setter
  set maSach(String value){
    if(value.trim().isNotEmpty){
      _maSach = value;
    }
  }
  set tenSach(String value){
    if(value.trim().isNotEmpty){
      _tenSach = value;
    }
  }
  set tacGia(String value){
    if(value.trim().isNotEmpty){
      _tacGia = value;
    }
  }
  set trangThaiMuon(bool value){
      _trangThaiMuon = value;
  }

  void hienThiThongTin() {
    print('Mã sách: $_maSach');
    print('Tên sách: $_tenSach');
    print('Tác giả: $_tacGia');
    print('Trạng thái mượn: ${_trangThaiMuon ? 'Đã mượn' : 'Chưa mượn'}\n\n\n');
  }
}