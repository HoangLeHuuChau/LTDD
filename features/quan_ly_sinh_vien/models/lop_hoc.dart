import '../models/sinh_vien.dart';

class LopHoc{
  String _tenLop;
  List<SinhVien> _danhSachSV = [];

  LopHoc(this._tenLop);

  //Getter
  String get tenLop => _tenLop;
  List<SinhVien> get danhSachSV => _danhSachSV;

  //Setter
  set tenLop (String tenLop){
    if(tenLop.trim().isNotEmpty)
    {
      _tenLop = tenLop;
    }
  }

  //Thêm sinh viên
  void themSinhVien(SinhVien sv){
    _danhSachSV.add(sv);
  }

  void hienThiDanhSachSV(){
    print('Danh sach sinh vien lop $_tenLop');
    for(var sv in _danhSachSV)
    {
      sv.hienThiThongTin();
      print('\nXep loai ${sv.xepLoai()}\n\n');
    }
  }
}