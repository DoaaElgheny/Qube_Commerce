import 'dart:convert';



class PaymentMethodModel {
  final int id;
  final String name;
  final String logoUrl;
  final double fees;
  final String note;
  final int countryId;
  final bool useInPayment;
  final bool useInWithdraw;
  final List<RequiredFieldModel> requiredFieldsForWithdraw;
  final List<RequiredFieldModel> requiredFieldsForDeposit;
  final List<String> payoutNotes;

  PaymentMethodModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.fees,
    required this.note,
    required this.countryId,
    required this.useInPayment,
    required this.useInWithdraw,
    required this.requiredFieldsForWithdraw,
    required this.requiredFieldsForDeposit,
    required this.payoutNotes,
  });

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    return PaymentMethodModel(
      id: map['id'] as int,
      name: map['name'] as String,
      logoUrl: map['logoUrl'] as String,
      fees: (map['fees'] as num).toDouble(),
      note: map['note'] as String,
      countryId: map['countryId'] as int,
      useInPayment: map['useInPayment'] as bool,
      useInWithdraw: map['useInWithdraw'] as bool,
      requiredFieldsForWithdraw: List<RequiredFieldModel>.from(
        (map['requiredFieldsForWithdraw'] as List<dynamic>)
            .map((e) => RequiredFieldModel.fromMap(e as Map<String, dynamic>)),
      ),
      requiredFieldsForDeposit: List<RequiredFieldModel>.from(
        (map['requiredFieldsForDeposit'] as List<dynamic>)
            .map((e) => RequiredFieldModel.fromMap(e as Map<String, dynamic>)),
      ),
      payoutNotes: List<String>.from(map['payoutNotes'] as List<dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'fees': fees,
      'note': note,
      'countryId': countryId,
      'useInPayment': useInPayment,
      'useInWithdraw': useInWithdraw,
      'requiredFieldsForWithdraw':
      requiredFieldsForWithdraw.map((e) => e.toMap()).toList(),
      'requiredFieldsForDeposit':
      requiredFieldsForDeposit.map((e) => e.toMap()).toList(),
      'payoutNotes': payoutNotes,
    };
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromJson(String source) =>
      PaymentMethodModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
class RequiredFieldModel {
  final String key;
  final String fieldNameAr;
  final String fieldNameEn;

  RequiredFieldModel({
    required this.key,
    required this.fieldNameAr,
    required this.fieldNameEn,
  });

  factory RequiredFieldModel.fromMap(Map<String, dynamic> map) {
    return RequiredFieldModel(
      key: map['key'] as String,
      fieldNameAr: map['fieldNameAr'] as String,
      fieldNameEn: map['fieldNameEn'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'fieldNameAr': fieldNameAr,
      'fieldNameEn': fieldNameEn,
    };
  }

  String toJson() => json.encode(toMap());

  factory RequiredFieldModel.fromJson(String source) =>
      RequiredFieldModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
