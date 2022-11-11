import 'dart:io';

import 'package:flutter/material.dart';

class NetworkConnection {
  NetworkConnection._();
  static final _instance = NetworkConnection._();
  static NetworkConnection get instance => _instance;
  Future<bool> checkConnection() async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    debugPrint('connection state isOnline:$isOnline');
    return isOnline;
  }
}
