// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProfitabilityTypeModel {
  final int? id;
  final String? name;
  ProfitabilityTypeModel({
    this.id,
    this.name,
  });

  ProfitabilityTypeModel copyWith({
    int? id,
    String? name,
  }) {
    return ProfitabilityTypeModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory ProfitabilityTypeModel.fromMap(Map<String, dynamic> map) {
    return ProfitabilityTypeModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfitabilityTypeModel.fromJson(String source) =>
      ProfitabilityTypeModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfitabilityTypeModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant ProfitabilityTypeModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
