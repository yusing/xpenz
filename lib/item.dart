import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  String eventName;
  String description;
  String category;
  String dateTime;
  double amount;

  Item(
      {this.amount,
      this.dateTime,
      this.description,
      this.eventName,
      this.category});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

List<Item> eventItems;
