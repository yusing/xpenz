import 'package:json_annotation/json_annotation.dart';
import 'wallet.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  Wallet walletType;
  String eventName;
  String description;
  String dateTime;
  double amount;

  Item({this.amount, this.dateTime, this.description, this.eventName, this.walletType});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

List<Item> eventItems;