// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'picture_model.dart';

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class DealModel {
  final int? id;
  final String? name;
  final String? startDate;
  final int? participantsCount;
  final String? categoryTitle;
  final dynamic? profitPercentage;
  final dynamic? minimumOrderValue;
  final Picture? picture;
  DealModel({
    this.id,
    this.name,
    this.startDate,
    this.participantsCount,
    this.categoryTitle,
    this.profitPercentage,
    this.minimumOrderValue,
    this.picture,
  });

  DealModel copyWith({
    int? id,
    String? name,
    String? startDate,
    int? participantsCount,
    String? categoryTitle,
    dynamic? profitPercentage,
    dynamic? minimumOrderValue,
    Picture? picture,
  }) {
    return DealModel(
      id: id ?? this.id,
      name: name ?? this.name,
      startDate: startDate ?? this.startDate,
      participantsCount: participantsCount ?? this.participantsCount,
      categoryTitle: categoryTitle ?? this.categoryTitle,
      profitPercentage: profitPercentage ?? this.profitPercentage,
      minimumOrderValue: minimumOrderValue ?? this.minimumOrderValue,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'startDate': startDate,
      'participantsCount': participantsCount,
      'categoryTitle': categoryTitle,
      'profitPercentage': profitPercentage,
      'minimumOrderValue': minimumOrderValue,
      'picture': picture?.toMap(),
    };
  }

  factory DealModel.fromMap(Map<String, dynamic> map) {
    return DealModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      startDate: map['startDate'] != null ? map['startDate'] as String : null,
      participantsCount: map['participantsCount'] != null
          ? map['participantsCount'] as int
          : null,
      categoryTitle:
          map['categoryTitle'] != null ? map['categoryTitle'] as String : null,
      profitPercentage: map['profitPercentage'] != null
          ? map['profitPercentage'] as dynamic
          : null,
      minimumOrderValue: map['minimumOrderValue'] != null
          ? map['minimumOrderValue'] as dynamic
          : null,
      picture: map['picture'] != null
          ? Picture.fromMap(map['picture'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealModel.fromJson(String source) =>
      DealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealModel(id: $id, name: $name, startDate: $startDate, participantsCount: $participantsCount, categoryTitle: $categoryTitle, profitPercentage: $profitPercentage, minimumOrderValue: $minimumOrderValue, picture: $picture)';
  }

  @override
  bool operator ==(covariant DealModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.startDate == startDate &&
        other.participantsCount == participantsCount &&
        other.categoryTitle == categoryTitle &&
        other.profitPercentage == profitPercentage &&
        other.minimumOrderValue == minimumOrderValue &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        startDate.hashCode ^
        participantsCount.hashCode ^
        categoryTitle.hashCode ^
        profitPercentage.hashCode ^
        minimumOrderValue.hashCode ^
        picture.hashCode;
  }
}
