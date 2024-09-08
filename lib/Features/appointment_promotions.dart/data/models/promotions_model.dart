import 'package:carwash/Features/appointment_promotions.dart/domin/entities/promotions_entity.dart';

class PromotionsModel extends PromotionsEntity {
  PromotionsModel(
      {required super.id,
      required super.name,
      required super.newPrice,
      required super.number,
      required super.image,
      required super.oldPrice});

  factory PromotionsModel.fromFirestore(
      Map<String, dynamic> map, String docId) {
    return PromotionsModel(
      id: docId,
      name: map['name'],
      oldPrice: map['oldPrice'].toDouble(),
      newPrice: map['newPrice'].toDouble(),
      image: map['image'],
      number: map['number'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'oldPrice': oldPrice,
      'newPrice': newPrice,
      'image': image,
      'number': number,
    };
  }
}
