import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable()
class Wallet {
  String walletName;
  int typeIndex;
  int iconDataIndex;

  Wallet({this.walletName, this.typeIndex, this.iconDataIndex});

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);
  Map<String, dynamic> toJson() => _$WalletToJson(this);
}