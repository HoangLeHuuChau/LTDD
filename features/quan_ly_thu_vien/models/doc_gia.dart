import '../models/sach.dart';

class DocGia {
  String _maDocGia;
  String _hoTen;
  List<Sach> _sachDangMuon = [];

  DocGia(this._maDocGia, this._hoTen);

  //Getter
  String get maDocGia => _maDocGia;
  String get hoTen => _hoTen;
  List<Sach> get sachDangMuon => _sachDangMuon;

  //Setter
  set maDocGia (String value){
    if(value.trim().isNotEmpty)
    {
      _maDocGia = value;
    }
  }
  set hoTen (String value){
    if(value.trim().isNotEmpty)
    {
      _hoTen = value;
    }
  }

  // Phương thức mượn sách
  void muonSach(Sach sach) {
    if (sach.trangThaiMuon) {
      print("Sách '${sach.tenSach}' đã có người mượn.\n");
    } else {
      _sachDangMuon.add(sach);
      sach.trangThaiMuon = true;
      print("Độc giả $_hoTen đã mượn sách '${sach.tenSach}'.\n");
    }
  }

  // Phương thức trả sách
  void traSach(Sach sach) {
    if (_sachDangMuon.contains(sach)) {
      _sachDangMuon.remove(sach);
      sach.trangThaiMuon = false;
      print("Độc giả $_hoTen đã trả sách '${sach.tenSach}'.\n");
    } else {
      print("Sách '${sach.tenSach}' không có trong danh sách mượn.\n");
    }
  } 
}