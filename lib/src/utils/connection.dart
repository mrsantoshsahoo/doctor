import 'dart:io';

import 'package:flutter/foundation.dart';

class InterNet {
 static bool? isConnected;

static  Future<void> checkInternetConnection() async {
    try {
      final response = await InternetAddress.lookup('www.kindacode.com');
      if (response.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (err) {
      isConnected = false;

      if (kDebugMode) {
        print(err);
      }
    }
  }
}
