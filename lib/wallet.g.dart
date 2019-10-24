// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) {
  return Wallet(
      walletName: json['walletName'] as String,
      typeIndex: json['typeIndex'] as int,
      iconDataIndex: json['iconDataIndex'] as int);
}

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'walletName': instance.walletName,
      'typeIndex': instance.typeIndex,
      'iconDataIndex': instance.iconDataIndex
    };
