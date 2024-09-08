import 'package:hive/hive.dart';
part 'promotions_entity.g.dart';

@HiveType(typeId: 1)
class PromotionsEntity {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final double? newPrice;
  @HiveField(3)
  final String? number;
  @HiveField(4)
  final String? image;
  @HiveField(5)
  final double? oldPrice;

  PromotionsEntity({required this.id, required this.name, required this.newPrice, required this.number, required this.image, required this.oldPrice});
}
