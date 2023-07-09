// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:sabpaisa/helpers/enums.dart';

class SabpaisaResponse {
  final TransactionStatus status;
  final String transactionId;
  SabpaisaResponse({
    required this.status,
    required this.transactionId,
  });

  SabpaisaResponse copyWith({
    TransactionStatus? status,
    String? transactionId,
  }) {
    return SabpaisaResponse(
      status: status ?? this.status,
      transactionId: transactionId ?? this.transactionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status.toString(),
      'transactionId': transactionId,
    };
  }

  factory SabpaisaResponse.fromMap(Map<String, dynamic> map) {
    return SabpaisaResponse(
      status: _getTransactionStatusEnum(map['status'] as String),
      transactionId: map['transactionId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SabpaisaResponse.fromJson(String source) =>
      SabpaisaResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SabpaisaResponse(status: $status, transactionId: $transactionId)';

  @override
  bool operator ==(covariant SabpaisaResponse other) {
    if (identical(this, other)) return true;

    return other.status == status && other.transactionId == transactionId;
  }

  @override
  int get hashCode => status.hashCode ^ transactionId.hashCode;

  static TransactionStatus _getTransactionStatusEnum(String status) {
    switch (status.toLowerCase()) {
      case "aborted":
        return TransactionStatus.aborted;
      case "success":
        return TransactionStatus.success;
      case "failed":
        return TransactionStatus.failed;
      default:
        return TransactionStatus.unknown;
    }
  }
}
