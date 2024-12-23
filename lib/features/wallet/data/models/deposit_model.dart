// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../wallet_export.dart';

class DepositModel {
  final int? amount;
  final int? paymentMethodId;
  final String? walletId;
  final List<MetaDataModel>? metaData;

  DepositModel({
    this.amount,
    this.paymentMethodId,
    this.walletId,
    this.metaData,
  });

  DepositModel copyWith({
    int? amount,
    int? paymentMethodId,
    String? walletId,
    List<MetaDataModel>? metaData,
  }) {
    return DepositModel(
      amount: amount ?? this.amount,
      paymentMethodId: paymentMethodId ?? this.paymentMethodId,
      walletId: walletId ?? this.walletId,
      metaData: metaData ?? this.metaData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'paymentMethodId': paymentMethodId,
      'walletId': walletId,
      'metaData': metaData?.map((x) => x.toMap()).toList(),
    };
  }

  factory DepositModel.fromMap(Map<String, dynamic> map) {
    return DepositModel(
      amount: map['amount'] != null ? map['amount'] as int : null,
      paymentMethodId:
          map['paymentMethodId'] != null ? map['paymentMethodId'] as int : null,
      walletId: map['walletId'] != null ? map['walletId'] as String : null,
      metaData: map['metaData'] != null
          ? List<MetaDataModel>.from(
              (map['metaData']).map<MetaDataModel?>(
                (x) => MetaDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DepositModel.fromJson(String source) =>
      DepositModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DepositModel(amount: $amount, paymentMethodId: $paymentMethodId, walletId: $walletId, metaData: $metaData)';
  }

  @override
  bool operator ==(covariant DepositModel other) {
    if (identical(this, other)) return true;

    return other.amount == amount &&
        other.paymentMethodId == paymentMethodId &&
        other.walletId == walletId &&
        listEquals(other.metaData, metaData);
  }

  @override
  int get hashCode {
    return amount.hashCode ^
        paymentMethodId.hashCode ^
        walletId.hashCode ^
        metaData.hashCode;
  }
}
