// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CampaignHistoriesModel {
  final int? id;
  final int? campaignId;
  final String? startDate;
  final int? totalOrders;
  final int? totalRevenues;
  final dynamic avarageProfit;
  CampaignHistoriesModel({
    this.id,
    this.campaignId,
    this.startDate,
    this.totalOrders,
    this.totalRevenues,
    this.avarageProfit,
  });

  CampaignHistoriesModel copyWith({
    int? id,
    int? campaignId,
    String? startDate,
    int? totalOrders,
    int? totalRevenues,
    dynamic avarageProfit,
  }) {
    return CampaignHistoriesModel(
      id: id ?? this.id,
      campaignId: campaignId ?? this.campaignId,
      startDate: startDate ?? this.startDate,
      totalOrders: totalOrders ?? this.totalOrders,
      totalRevenues: totalRevenues ?? this.totalRevenues,
      avarageProfit: avarageProfit ?? this.avarageProfit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'campaignId': campaignId,
      'startDate': startDate,
      'totalOrders': totalOrders,
      'totalRevenues': totalRevenues,
      'avarageProfit': avarageProfit,
    };
  }

  factory CampaignHistoriesModel.fromMap(Map<String, dynamic> map) {
    return CampaignHistoriesModel(
      id: map['id'] != null ? map['id'] as int : null,
      campaignId: map['campaignId'] != null ? map['campaignId'] as int : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      totalOrders:
          map['totalOrders'] != null ? map['totalOrders'] as int : null,
      totalRevenues:
          map['totalRevenues'] != null ? map['totalRevenues'] as int : null,
      avarageProfit:
          map['avarageProfit'] != null ? map['avarageProfit'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CampaignHistoriesModel.fromJson(String source) =>
      CampaignHistoriesModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CampaignHistoriesModel(id: $id, campaignId: $campaignId, startDate: $startDate, totalOrders: $totalOrders, totalRevenues: $totalRevenues, avarageProfit: $avarageProfit)';
  }

  @override
  bool operator ==(covariant CampaignHistoriesModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.campaignId == campaignId &&
        other.startDate == startDate &&
        other.totalOrders == totalOrders &&
        other.totalRevenues == totalRevenues &&
        other.avarageProfit == avarageProfit;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        campaignId.hashCode ^
        startDate.hashCode ^
        totalOrders.hashCode ^
        totalRevenues.hashCode ^
        avarageProfit.hashCode;
  }
}
