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
      category: json['category'] as String);
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'eventName': instance.eventName,
      'description': instance.description,
      'category': instance.category,
      'dateTime': instance.dateTime,
      'amount': instance.amount
    };
