// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WalletModel {
final String? id;
final String? name;
final String? code;
final dynamic availableBalance;
final dynamic profitBalance;
final int? ownerId;
  WalletModel({
    this.id,
    this.name,
    this.code,
    this.availableBalance,
    this.profitBalance,
    this.ownerId,
  });

  WalletModel copyWith({
    String? id,
    String? name,
    String? code,
    dynamic availableBalance,
    dynamic profitBalance,
    int? ownerId,
  }) {
    return WalletModel(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      availableBalance: availableBalance ?? this.availableBalance,
      profitBalance: profitBalance ?? this.profitBalance,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'availableBalance': availableBalance,
      'profitBalance': profitBalance,
      'ownerId': ownerId,
    };
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null ? map['code'] as String : null,
      availableBalance: map['availableBalance'] != null ? map['availableBalance'] as dynamic : null,
      profitBalance: map['profitBalance'] != null ? map['profitBalance'] as dynamic : null,
      ownerId: map['ownerId'] != null ? map['ownerId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromJson(String source) => WalletModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WalletModel(id: $id, name: $name, code: $code, availableBalance: $availableBalance, profitBalance: $profitBalance, ownerId: $ownerId)';
  }

  @override
  bool operator ==(covariant WalletModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.code == code &&
      other.availableBalance == availableBalance &&
      other.profitBalance == profitBalance &&
      other.ownerId == ownerId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      code.hashCode ^
      availableBalance.hashCode ^
      profitBalance.hashCode ^
      ownerId.hashCode;
  }
}
