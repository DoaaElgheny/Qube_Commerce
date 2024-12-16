// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BaseResponse {
  final bool? succeeded;
  final String? message;
  final List<dynamic>? errors;
  final dynamic data;
  BaseResponse({
    this.succeeded,
    this.message,
    this.errors,
    this.data,
  });

  BaseResponse copyWith({
    bool? succeeded,
    String? message,
    List<dynamic>? errors,
    dynamic data,
  }) {
    return BaseResponse(
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
      'data': data,
    };
  }

  factory BaseResponse.fromMap(Map<String, dynamic> map) {
    return BaseResponse(
      succeeded: map['succeeded'] != null ? map['succeeded'] as bool : null,
      message: map['message'] != null ? map['message'] as String : null,
      errors: map['errors'] != null ? List<dynamic>.from((map['errors'] as List<dynamic>)) : null,
      data: map['data'] != null ? map['data'] as dynamic : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseResponse.fromJson(String source) => BaseResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BaseResponse(succeeded: $succeeded, message: $message, errors: $errors, data: $data)';
  }

  @override
  bool operator ==(covariant BaseResponse other) {
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
