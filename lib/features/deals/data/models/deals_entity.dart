// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/

import 'deal_model.dart';
import 'picture_model.dart';

class Data {
  final List<DealModel?>? data;
  final int? pageNumber;
  final int? totalPages;
  final int? totalCount;
  final int? pageSize;
  final bool? hasPreviousPage;
  final bool? hasNextPage;
  Data({
    this.data,
    this.pageNumber,
    this.totalPages,
    this.totalCount,
    this.pageSize,
    this.hasPreviousPage,
    this.hasNextPage,
  });

  Data copyWith({
    List<DealModel?>? data,
    int? pageNumber,
    int? totalPages,
    int? totalCount,
    int? pageSize,
    bool? hasPreviousPage,
    bool? hasNextPage,
  }) {
    return Data(
      data: data ?? this.data,
      pageNumber: pageNumber ?? this.pageNumber,
      totalPages: totalPages ?? this.totalPages,
      totalCount: totalCount ?? this.totalCount,
      pageSize: pageSize ?? this.pageSize,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': data?.map((x) => x?.toMap()).toList(),
      'pageNumber': pageNumber,
      'totalPages': totalPages,
      'totalCount': totalCount,
      'pageSize': pageSize,
      'hasPreviousPage': hasPreviousPage,
      'hasNextPage': hasNextPage,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      data: map['data'] != null ? List<DealModel?>.from((map['data']).map<DealModel>((x) => DealModel?.fromMap(x as Map<String,dynamic>),),) : null,
      pageNumber: map['pageNumber'] != null ? map['pageNumber'] as int : null,
      totalPages: map['totalPages'] != null ? map['totalPages'] as int : null,
      totalCount: map['totalCount'] != null ? map['totalCount'] as int : null,
      pageSize: map['pageSize'] != null ? map['pageSize'] as int : null,
      hasPreviousPage: map['hasPreviousPage'] != null ? map['hasPreviousPage'] as bool : null,
      hasNextPage: map['hasNextPage'] != null ? map['hasNextPage'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Data(data: $data, pageNumber: $pageNumber, totalPages: $totalPages, totalCount: $totalCount, pageSize: $pageSize, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
  }

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.data, data) &&
      other.pageNumber == pageNumber &&
      other.totalPages == totalPages &&
      other.totalCount == totalCount &&
      other.pageSize == pageSize &&
      other.hasPreviousPage == hasPreviousPage &&
      other.hasNextPage == hasNextPage;
  }

  @override
  int get hashCode {
    return data.hashCode ^
      pageNumber.hashCode ^
      totalPages.hashCode ^
      totalCount.hashCode ^
      pageSize.hashCode ^
      hasPreviousPage.hashCode ^
      hasNextPage.hashCode;
  }
}

class DealsEntity {
  final bool? succeeded;
  final String? message;
  final List<dynamic>? errors;
  final Data? data;
  DealsEntity({
    this.succeeded,
    this.message,
    this.errors,
    this.data,
  });

  DealsEntity copyWith({
    bool? succeeded,
    String? message,
    List<dynamic>? errors,
    Data? data,
  }) {
    return DealsEntity(
      succeeded: succeeded ?? this.succeeded,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'succeeded': succeeded,
      'message': message,
      'errors': errors,
      'data': data?.toMap(),
    };
  }

  factory DealsEntity.fromMap(Map<String, dynamic> map) {
    return DealsEntity(
      succeeded: map['succeeded'] != null ? map['succeeded'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      errors: map['errors'] != null ? List<dynamic>.from((map['errors'] as List<dynamic>)) : null,
      data: map['data'] != null ? Data.fromMap(map['data'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DealsEntity.fromJson(String source) => DealsEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DealsEntity(succeeded: $succeeded, message: $message, errors: $errors, data: $data)';
  }

  @override
  bool operator ==(covariant DealsEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.succeeded == succeeded &&
      other.message == message &&
      listEquals(other.errors, errors) &&
      other.data == data;
  }

  @override
  int get hashCode {
    return succeeded.hashCode ^
      message.hashCode ^
      errors.hashCode ^
      data.hashCode;
  }
}
