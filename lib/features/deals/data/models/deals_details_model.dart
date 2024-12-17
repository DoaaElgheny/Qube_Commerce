// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../deals_export.dart';

class DealsDetailsModel {
  final int? id;
  final String? name;
  final String? startDate;
  final String? endDate;
  final dynamic profitPercentage;
  final int? expectedProfit;
  final int? expectedRequestsCount;
  final int? status;
  final String? campaignCode;
  final String? statusTitle;
  final int? categoryId;
  final String? categoryTitle;
  final List<Picture>? pictures;
  final List<CampaignHistoriesModel>? campaignHistories;
  final int? joiners;
  DealsDetailsModel({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.profitPercentage,
    this.expectedProfit,
    this.expectedRequestsCount,
    this.status,
    this.campaignCode,
    this.statusTitle,
    this.categoryId,
    this.categoryTitle,
    this.pictures,
    this.campaignHistories,
    this.joiners,
  });

  DealsDetailsModel copyWith({
    int? id,
    String? name,
    String? startDate,
    String? endDate,
    dynamic profitPercentage,
    int? expectedProfit,
    int? expectedRequestsCount,
    int? status,
    String? campaignCode,
    String? statusTitle,
    int? categoryId,
    String? categoryTitle,
    List<Picture>? pictures,
    List<CampaignHistoriesModel>? campaignHistories,
    int? joiners,
  }) {
    return DealsDetailsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      profitPercentage: profitPercentage ?? this.profitPercentage,
      expectedProfit: expectedProfit ?? this.expectedProfit,
      expectedRequestsCount:
          expectedRequestsCount ?? this.expectedRequestsCount,
      status: status ?? this.status,
      campaignCode: campaignCode ?? this.campaignCode,
      statusTitle: statusTitle ?? this.statusTitle,
      categoryId: categoryId ?? this.categoryId,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      pictures: pictures ?? this.pictures,
      campaignHistories: campaignHistories ?? this.campaignHistories,
      joiners: joiners ?? this.joiners,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'profitPercentage': profitPercentage,
      'expectedProfit': expectedProfit,
      'expectedRequestsCount': expectedRequestsCount,
      'status': status,
      'campaignCode': campaignCode,
      'statusTitle': statusTitle,
      'categoryId': categoryId,
      'categoryTitle': categoryTitle,
      'pictures': pictures?.map((x) => x.toMap()).toList(),
      'campaignHistories': campaignHistories?.map((x) => x.toMap()).toList(),
      'joiners': joiners,
    };
  }

  factory DealsDetailsModel.fromMap(Map<String, dynamic> map) {
    return DealsDetailsModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      endDate: map['endDate'] != null ? map['endDate'] as String : null,
      profitPercentage: map['profitPercentage'] as dynamic,
      expectedProfit:
          map['expectedProfit'] != null ? map['expectedProfit'] as int : null,
      expectedRequestsCount: map['expectedRequestsCount'] != null
          ? map['expectedRequestsCount'] as int
          : null,
      status: map['status'] != null ? map['status'] as int : null,
      campaignCode:
          map['campaignCode'] != null ? map['campaignCode'] as String : null,
      statusTitle:
          map['statusTitle'] != null ? map['statusTitle'] as String : null,
      categoryId: map['categoryId'] != null ? map['categoryId'] as int : null,
      categoryTitle:
          map['categoryTitle'] != null ? map['categoryTitle'] as String : null,
      pictures: map['pictures'] != null
          ? List<Picture>.from(
              (map['pictures'] ).map<Picture?>(
                (x) => Picture.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      campaignHistories: map['campaignHistories'] != null
          ? List<CampaignHistoriesModel>.from(
              (map['campaignHistories'] )
                  .map<CampaignHistoriesModel?>(
                (x) =>
                    CampaignHistoriesModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      joiners: map['joiners'] != null ? map['joiners'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealsDetailsModel.fromJson(String source) =>
      DealsDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealsDetailsModel(id: $id, name: $name, startDate: $startDate, endDate: $endDate, profitPercentage: $profitPercentage, expectedProfit: $expectedProfit, expectedRequestsCount: $expectedRequestsCount, status: $status, campaignCode: $campaignCode, statusTitle: $statusTitle, categoryId: $categoryId, categoryTitle: $categoryTitle, pictures: $pictures, campaignHistories: $campaignHistories, joiners: $joiners)';
  }

  @override
  bool operator ==(covariant DealsDetailsModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.profitPercentage == profitPercentage &&
        other.expectedProfit == expectedProfit &&
        other.expectedRequestsCount == expectedRequestsCount &&
        other.status == status &&
        other.campaignCode == campaignCode &&
        other.statusTitle == statusTitle &&
        other.categoryId == categoryId &&
        other.categoryTitle == categoryTitle &&
        listEquals(other.pictures, pictures) &&
        listEquals(other.campaignHistories, campaignHistories) &&
        other.joiners == joiners;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        profitPercentage.hashCode ^
        expectedProfit.hashCode ^
        expectedRequestsCount.hashCode ^
        status.hashCode ^
        campaignCode.hashCode ^
        statusTitle.hashCode ^
        categoryId.hashCode ^
        categoryTitle.hashCode ^
        pictures.hashCode ^
        campaignHistories.hashCode ^
        joiners.hashCode;
  }
}
