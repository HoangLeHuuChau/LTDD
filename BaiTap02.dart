//BaiTap02.dart
//Giai pt bac 2: ax^2 + bx + c = 0
import 'dart:math';
import 'dart:io';

void main() {
  //Hàm xử lý nhập số từ người dùng
  double inputNumber(String message, {bool allowZero = true}) {
    while (true) {
      stdout.write(message);
      String? input = stdin.readLineSync();
      double? number = double.tryParse(input ?? '');
      if (number == null) {
        print('Vui lòng nhập một số hợp lệ.');
      } else if (!allowZero && number == 0) {
        print('Số nhập vào phải khác 0.');
      } else {
        return number;
      }
    }
  }

  // Nhập hệ số a (a != 0)
  double a = inputNumber('Nhập hệ số a (a != 0): ', allowZero: false);

  // Nhập hệ số b
  double b = inputNumber('Nhập hệ số b: ');

  // Nhập hệ số c
  double c = inputNumber('Nhập hệ số c: ');

  // Tính delta
  double delta = b * b - 4 * a * c;

  // Giải phương trình và hiển thị kết quả
  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);
    print('Phương trình có hai nghiệm phân biệt:');
    print('x1 = $x1');
    print('x2 = $x2');
  } else if (delta == 0) {
    double x = -b / (2 * a);
    print('Phương trình có nghiệm kép: x = $x');
  } else {
    print('Phương trình vô nghiệm (delta < 0).');
  }
}
