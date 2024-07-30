import 'package:connectivity_plus/connectivity_plus.dart';

/// class Conditional  abstract to validate network or internet connection

abstract class NetworkInfoRepository {
  //This methos validate the internet connection with  mobile data or wifi data
  Future<bool> get hasConnection;
}

/// Class to implement the validation network or internet connection

class NetworkInfoRepositoryImpl extends NetworkInfoRepository {
  @override
  Future<bool> get hasConnection async {
    var connectivityResult = await Connectivity().checkConnectivity();
    bool result = false;

    // This condition is for demo purposes only to explain every connection type.
// Use conditions which work for your requirements.
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      // Mobile network available.
      result = true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      // Wi-fi is available.
      // Note for Android:
      // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
      result = true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      // Ethernet connection available.
      result = true;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      // Vpn connection active.
      // Note for iOS and macOS:
      // There is no separate network interface type for [vpn].
      // It returns [other] on any device (also simulator)
      result = true;
    } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      // Bluetooth connection available.
      result = true;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      // Connected to a network which is not in the above mentioned networks.
      result = true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      // No available network types
      result = false;
    }

    return result;
  }
}
