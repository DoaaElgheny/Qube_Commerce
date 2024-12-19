// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JoinDealModel {
  final int? campaignId;
  final dynamic amount;
  final String? walletId;
  JoinDealModel({
    this.campaignId,
    this.amount,
    this.walletId,
  });

  JoinDealModel copyWith({
    int? campaignId,
    dynamic amount,
    String? walletId,
  }) {
    return JoinDealModel(
      campaignId: campaignId ?? this.campaignId,
      amount: amount ?? this.amount,
      walletId: walletId ?? this.walletId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'campaignId': campaignId,
      'amount': amount,
      'walletId': walletId,
    };
  }

  factory JoinDealModel.fromMap(Map<String, dynamic> map) {
    return JoinDealModel(
      campaignId: map['campaignId'] != null ? map['campaignId'] as int : null,
      amount: map['amount'] != null ? map['amount'] as dynamic : null,
      walletId: map['walletId'] != null ? map['walletId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JoinDealModel.fromJson(String source) =>
      JoinDealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'JoinDealModel(campaignId: $campaignId, amount: $amount, walletId: $walletId)';

  @override
  bool operator ==(covariant JoinDealModel other) {
    if (identical(this, other)) return true;

    return other.campaignId == campaignId &&
        other.amount == amount &&
        other.walletId == walletId;
  }

  @override
  int get hashCode => campaignId.hashCode ^ amount.hashCode ^ walletId.hashCode;
}
