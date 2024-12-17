// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MetaDataModel {
  final String? key;
  final String? value;
  MetaDataModel({
    this.key,
    this.value,
  });

  MetaDataModel copyWith({
    String? key,
    String? value,
  }) {
    return MetaDataModel(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'value': value,
    };
  }

  factory MetaDataModel.fromMap(Map<String, dynamic> map) {
    return MetaDataModel(
      key: map['key'] != null ? map['key'] as String : null,
      value: map['value'] != null ? map['value'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MetaDataModel.fromJson(String source) =>
      MetaDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MetaDataModel(key: $key, value: $value)';

  @override
  bool operator ==(covariant MetaDataModel other) {
    if (identical(this, other)) return true;

    return other.key == key && other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
