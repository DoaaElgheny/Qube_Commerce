// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetAvailableDealsModel {
  final int? pageNumber;
  final int? pageSize;
  final String? from;
  final String? to;
  final String? searchValue;
  final int? profitability;
  GetAvailableDealsModel({
    this.pageNumber,
    this.pageSize,
    this.from,
    this.to,
    this.searchValue,
    this.profitability,
  });

  GetAvailableDealsModel copyWith({
    int? pageNumber,
    int? pageSize,
    String? from,
    String? to,
    String? searchValue,
    int? profitability,
  }) {
    return GetAvailableDealsModel(
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      from: from ?? this.from,
      to: to ?? this.to,
      searchValue: searchValue ?? this.searchValue,
      profitability: profitability ?? this.profitability,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'from': from,
      'to': to,
      'searchValue': searchValue,
      'profitability': profitability,
    };
  }

  factory GetAvailableDealsModel.fromMap(Map<String, dynamic> map) {
    return GetAvailableDealsModel(
      pageNumber: map['pageNumber'] != null ? map['pageNumber'] as int : null,
      pageSize: map['pageSize'] != null ? map['pageSize'] as int : null,
      from: map['from'] != null ? map['from'] as String : null,
      to: map['to'] != null ? map['to'] as String : null,
      searchValue: map['searchValue'] != null ? map['searchValue'] as String : null,
      profitability: map['profitability'] != null ? map['profitability'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAvailableDealsModel.fromJson(String source) => GetAvailableDealsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GetAvailableDealsModel(pageNumber: $pageNumber, pageSize: $pageSize, from: $from, to: $to, searchValue: $searchValue, profitability: $profitability)';
  }

  @override
  bool operator ==(covariant GetAvailableDealsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.pageNumber == pageNumber &&
      other.pageSize == pageSize &&
      other.from == from &&
      other.to == to &&
      other.searchValue == searchValue &&
      other.profitability == profitability;
  }

  @override
  int get hashCode {
    return pageNumber.hashCode ^
      pageSize.hashCode ^
      from.hashCode ^
      to.hashCode ^
      searchValue.hashCode ^
      profitability.hashCode;
  }
}
