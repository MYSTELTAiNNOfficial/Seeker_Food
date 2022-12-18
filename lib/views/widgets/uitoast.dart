part of 'widgets.dart';

class UiToast {
  BuildContext? context;

  UiToast(BuildContext ctx) {
    context = ctx;
  }

  static void toastOk(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red[300],
        textColor: Colors.black,
        fontSize: 14);
  }

  static void toastErr(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.yellow,
        textColor: Colors.black,
        fontSize: 14);
  }

  static void toastWarning(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.yellow,
        textColor: Colors.black,
        fontSize: 14);
  }
}
