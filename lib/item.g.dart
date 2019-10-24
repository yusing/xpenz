// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      amount: (json['amount'] as num)?.toDouble(),
      dateTime: json['dateTime'] as String,
      description: json['description'] as String,
      eventName: json['eventName'] as String,
      walletType: json['walletType'] == null
          ? null
          : Wallet.fromJson(json['walletType'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'walletType': instance.walletType,
      'eventName': instance.eventName,
      'description': instance.description,
      'dateTime': instance.dateTime,
      'amount': instance.amount
    };
