// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SettingModel {
  final String? privacyPolicyUrl;
  final String? tosUrl;
  final String? serviceFees;
  final dynamic currentCurrency;
  final String? contactMobileNumber;
  final String? contactEmail;
  final String? contactAddress;
  final String? contactLat;
  final String? contactLong;
  SettingModel({
    this.privacyPolicyUrl,
    this.tosUrl,
    this.serviceFees,
    this.currentCurrency,
    this.contactMobileNumber,
    this.contactEmail,
    this.contactAddress,
    this.contactLat,
    this.contactLong,
  });

  SettingModel copyWith({
    String? privacyPolicyUrl,
    String? tosUrl,
    String? serviceFees,
    dynamic currentCurrency,
    String? contactMobileNumber,
    String? contactEmail,
    String? contactAddress,
    String? contactLat,
    String? contactLong,
  }) {
    return SettingModel(
      privacyPolicyUrl: privacyPolicyUrl ?? this.privacyPolicyUrl,
      tosUrl: tosUrl ?? this.tosUrl,
      serviceFees: serviceFees ?? this.serviceFees,
      currentCurrency: currentCurrency ?? this.currentCurrency,
      contactMobileNumber: contactMobileNumber ?? this.contactMobileNumber,
      contactEmail: contactEmail ?? this.contactEmail,
      contactAddress: contactAddress ?? this.contactAddress,
      contactLat: contactLat ?? this.contactLat,
      contactLong: contactLong ?? this.contactLong,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'privacyPolicyUrl': privacyPolicyUrl,
      'tosUrl': tosUrl,
      'serviceFees': serviceFees,
      'currentCurrency': currentCurrency,
      'contactMobileNumber': contactMobileNumber,
      'contactEmail': contactEmail,
      'contactAddress': contactAddress,
      'contactLat': contactLat,
      'contactLong': contactLong,
    };
  }

  factory SettingModel.fromMap(Map<String, dynamic> map) {
    return SettingModel(
      privacyPolicyUrl: map['privacyPolicyUrl'] != null
          ? map['privacyPolicyUrl'] as String
          : null,
      tosUrl: map['tosUrl'] != null ? map['tosUrl'] as String : null,
      serviceFees:
          map['serviceFees'] != null ? map['serviceFees'] as String : null,
      currentCurrency: map['currentCurrency'] != null
          ? map['currentCurrency'] as dynamic
          : null,
      contactMobileNumber: map['contactMobileNumber'] != null
          ? map['contactMobileNumber'] as String
          : null,
      contactEmail:
          map['contactEmail'] != null ? map['contactEmail'] as String : null,
      contactAddress: map['contactAddress'] != null
          ? map['contactAddress'] as String
          : null,
      contactLat:
          map['contactLat'] != null ? map['contactLat'] as String : null,
      contactLong:
          map['contactLong'] != null ? map['contactLong'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingModel.fromJson(String source) =>
      SettingModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SettingModel(privacyPolicyUrl: $privacyPolicyUrl, tosUrl: $tosUrl, serviceFees: $serviceFees, currentCurrency: $currentCurrency, contactMobileNumber: $contactMobileNumber, contactEmail: $contactEmail, contactAddress: $contactAddress, contactLat: $contactLat, contactLong: $contactLong)';
  }

  @override
  bool operator ==(covariant SettingModel other) {
    if (identical(this, other)) return true;

    return other.privacyPolicyUrl == privacyPolicyUrl &&
        other.tosUrl == tosUrl &&
        other.serviceFees == serviceFees &&
        other.currentCurrency == currentCurrency &&
        other.contactMobileNumber == contactMobileNumber &&
        other.contactEmail == contactEmail &&
        other.contactAddress == contactAddress &&
        other.contactLat == contactLat &&
        other.contactLong == contactLong;
  }

  @override
  int get hashCode {
    return privacyPolicyUrl.hashCode ^
        tosUrl.hashCode ^
        serviceFees.hashCode ^
        currentCurrency.hashCode ^
        contactMobileNumber.hashCode ^
        contactEmail.hashCode ^
        contactAddress.hashCode ^
        contactLat.hashCode ^
        contactLong.hashCode;
  }
}
