import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sabpaisa/helpers/enums.dart';
import 'package:sabpaisa/models/sabpaisa_payload.dart';
import 'package:sabpaisa/sabpaisa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _sabpaisaPlugin = Sabpaisa();

  String? status;
  String? txnId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sabpaisa example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  // DUMMY CARD DETAILS - https://sabpaisa.in/wp-content/uploads/2023/07/Flutter-Mobile-SDK-Integration-documentSabpaisa.pdf.pdf

                  // The payment is likely to fail as the credentials below are fake

                  final payload = SabPaisaPayload(
                    customerFirstName: "John",
                    customerLastName: "Doe",
                    customerEmail: "johndoe@gmail.com",
                    customerPhone: "8989898989",
                    checkoutAmount: "1",
                    clientCode: "TM001",
                    aesApiIv: "YN2v8qQcU3rGfA1y",
                    aesApiKey: "kaY9AIhuJZNvKGp2",
                    transUserName: "rajiv.moti_336",
                    transUserPassword: "RIADA_SP336",
                  );
                  final response = await _sabpaisaPlugin.initiateTransaction(
                      payload: payload);

                  if (response == null) {
                    setState(() {
                      status = "Failed";
                    });
                    log("Payment Failed");
                    return;
                  } else {
                    setState(() {
                      status = response.status.toString();
                      txnId = response.transactionId;
                    });

                    switch (response.status) {
                      case TransactionStatus.success:
                        log("Payment Success");
                        break;
                      case TransactionStatus.aborted:
                        log("Payment Aborted by user");
                        break;
                      case TransactionStatus.failed:
                        log("Payment Failed");
                        break;
                      case TransactionStatus.unknown:
                        log("Something went wrong!");
                        break;
                    }
                  }
                },
                child: const Text('Launch Payment of 1 INR'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Payment Status - $status"),
              Text("Payment Txn ID - $txnId"),
            ],
          ),
        ),
      ),
    );
  }
}
