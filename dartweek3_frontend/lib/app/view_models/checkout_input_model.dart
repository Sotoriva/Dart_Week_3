import 'dart:convert';

class CheckoutInputModel {
  int userId;
  String address;
  String paymentType;
  List<int> itemsId;

  CheckoutInputModel({
    this.userId,
    this.address,
    this.paymentType,
    this.itemsId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'address': address,
      'paymentType': paymentType,
      'itemsId': itemsId?.map((x) => x?.toInt())?.toList(),
    };
  }

  factory CheckoutInputModel.fromMap(Map<String, dynamic> json) {
    if (json == null) return null;

    return CheckoutInputModel(
      userId: json['userId'] ?? 0,
      address: json['address'] ?? '',
      paymentType: json['paymentType'] ?? '',
      itemsId: List<int>.from(json['itemsId']?.map((x) => int.fromEnvironment(x))) ?? const [], //TODO: validar!
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckoutInputModel.fromJson(String source) =>
      CheckoutInputModel.fromMap(json.decode(source));
}
