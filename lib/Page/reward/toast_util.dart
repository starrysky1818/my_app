import 'package:toast/toast.dart';

class ToastUtil {
  static showToast(String message) {
    Toast.show(message, gravity:  Toast.center);
  }
}
