import 'package:shared_preferences/shared_preferences.dart';
import 'toast.dart';

class LocalStroage {
  setItem(dynamic key, var value) async {
    SharedPreferences localStroage = await SharedPreferences.getInstance();
    if (value is String) {
      localStroage.setString(key, value);
    } else if (value is int) {
      localStroage.setInt(key, value);
    } else if (value is double) {
      localStroage.setDouble(key, value);
    } else if (value is List<String>) {
      localStroage.setStringList(key, value);
    } else if (value is bool) {
      print('bool');
      localStroage.setBool(key, value);
    } else {
      toast('数据类型有误，仅支持int、 double、 List<String>、 bool、 String');
    }
  }

  getItem(dynamic key) async {
    SharedPreferences localStroage = await SharedPreferences.getInstance();
    dynamic future = await localStroage.get(key);
    return future;
  }

  clear() async {
    SharedPreferences localStroage = await SharedPreferences.getInstance();
    localStroage.clear();
  }
}
