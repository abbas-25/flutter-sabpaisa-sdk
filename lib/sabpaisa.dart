import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sabpaisa/models/sabpaisa_payload.dart';
import 'package:sabpaisa/models/sabpaisa_response.dart';

class Sabpaisa {
  static const MethodChannel _channel = MethodChannel("dev.abbasali.sabpaisa");

  Future<SabpaisaResponse?> initiateTransaction(
      {required SabPaisaPayload payload}) async {
    if (Platform.isIOS) {
      log("Sabpaisa SDK - Not implemented for iOS");
      return null;
    }

    log("Sabpaisa SDK - Initiating Transaction with payload -> ${payload.getTransactionDetails}");
    try {
      final List<Object?> response =
          await _channel.invokeMethod('callSabPaisaSdk', [
        payload.customerFirstName,
        payload.customerLastName,
        payload.customerEmail,
        payload.customerPhone,
        payload.checkoutAmount,
        payload.clientCode,
        payload.aesApiIv,
        payload.aesApiKey,
        payload.transUserName,
        payload.transUserPassword,
      ]);

      log("Sabpaisa SDK - Transaction Completed with response -> $response");
      return SabpaisaResponse.fromMap(
          {"status": response.first as String, "transactionId": response[1] as String});
    } on PlatformException {
      log("Sabpaisa SDK - Status Failed", error: "Platform Exception");
      return null;
    } catch (e) {
      log("Sabpaisa SDK - Error", error: e);
      return null;
    }
  }
}
