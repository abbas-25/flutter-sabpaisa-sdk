// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SabPaisaPayload {
  final String customerFirstName;
  final String customerLastName;
  final String customerEmail;
  final String customerPhone;
  final String checkoutAmount;
  final String clientCode;
  final String aesApiIv;
  final String aesApiKey;
  final String transUserName;
  final String transUserPassword;
  SabPaisaPayload({
    required this.customerFirstName,
    required this.customerLastName,
    required this.customerEmail,
    required this.customerPhone,
    required this.checkoutAmount,
    required this.clientCode,
    required this.aesApiIv,
    required this.aesApiKey,
    required this.transUserName,
    required this.transUserPassword,
  });

  SabPaisaPayload copyWith({
    String? customerFirstName,
    String? customerLastName,
    String? customerEmail,
    String? customerPhone,
    String? checkoutAmount,
    String? clientCode,
    String? aesApiIv,
    String? aesApiKey,
    String? transUserName,
    String? transUserPassword,
  }) {
    return SabPaisaPayload(
      customerFirstName: customerFirstName ?? this.customerFirstName,
      customerLastName: customerLastName ?? this.customerLastName,
      customerEmail: customerEmail ?? this.customerEmail,
      customerPhone: customerPhone ?? this.customerPhone,
      checkoutAmount: checkoutAmount ?? this.checkoutAmount,
      clientCode: clientCode ?? this.clientCode,
      aesApiIv: aesApiIv ?? this.aesApiIv,
      aesApiKey: aesApiKey ?? this.aesApiKey,
      transUserName: transUserName ?? this.transUserName,
      transUserPassword: transUserPassword ?? this.transUserPassword,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerFirstName': customerFirstName,
      'customerLastName': customerLastName,
      'customerEmail': customerEmail,
      'customerPhone': customerPhone,
      'checkoutAmount': checkoutAmount,
      'clientCode': clientCode,
      'aesApiIv': aesApiIv,
      'aesApiKey': aesApiKey,
      'transUserName': transUserName,
      'transUserPassword': transUserPassword,
    };
  }

  factory SabPaisaPayload.fromMap(Map<String, dynamic> map) {
    return SabPaisaPayload(
      customerFirstName: map['customerFirstName'] as String,
      customerLastName: map['customerLastName'] as String,
      customerEmail: map['customerEmail'] as String,
      customerPhone: map['customerPhone'] as String,
      checkoutAmount: map['checkoutAmount'] as String,
      clientCode: map['clientCode'] as String,
      aesApiIv: map['aesApiIv'] as String,
      aesApiKey: map['aesApiKey'] as String,
      transUserName: map['transUserName'] as String,
      transUserPassword: map['transUserPassword'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SabPaisaPayload.fromJson(String source) => SabPaisaPayload.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SabPaisaPayload(customerFirstName: $customerFirstName, customerLastName: $customerLastName, customerEmail: $customerEmail, customerPhone: $customerPhone, checkoutAmount: $checkoutAmount, clientCode: $clientCode, aesApiIv: $aesApiIv, aesApiKey: $aesApiKey, transUserName: $transUserName, transUserPassword: $transUserPassword)';
  }
  
  String getTransactionDetails() {
    return 'SabPaisaPayload(customerFirstName: $customerFirstName, customerLastName: $customerLastName, customerEmail: $customerEmail, customerPhone: $customerPhone, checkoutAmount: $checkoutAmount)';
  }

  @override
  bool operator ==(covariant SabPaisaPayload other) {
    if (identical(this, other)) return true;
  
    return 
      other.customerFirstName == customerFirstName &&
      other.customerLastName == customerLastName &&
      other.customerEmail == customerEmail &&
      other.customerPhone == customerPhone &&
      other.checkoutAmount == checkoutAmount &&
      other.clientCode == clientCode &&
      other.aesApiIv == aesApiIv &&
      other.aesApiKey == aesApiKey &&
      other.transUserName == transUserName &&
      other.transUserPassword == transUserPassword;
  }

  @override
  int get hashCode {
    return customerFirstName.hashCode ^
      customerLastName.hashCode ^
      customerEmail.hashCode ^
      customerPhone.hashCode ^
      checkoutAmount.hashCode ^
      clientCode.hashCode ^
      aesApiIv.hashCode ^
      aesApiKey.hashCode ^
      transUserName.hashCode ^
      transUserPassword.hashCode;
  }
}
