import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:intl/intl.dart';

class Transversal {
  static final Transversal service = Transversal._internal();

  factory Transversal() {
    return service;
  }

  Transversal._internal();

  Future<bool> checkConnectivity() async {
    bool result = false;
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      result = true;
    }
    return result;
  }

  String fixJson(String json) {
    String jsonFixed = json.replaceAll(r'{\', '{');
    // jsonFixed = jsonFixed.replaceAll(r'}', '}');
    jsonFixed = jsonFixed.replaceAll(r'\', '');

    return jsonFixed;
  }

  Future<String> getDateNowFormatted() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now);

    return Future.value(formatted);
  }
}
