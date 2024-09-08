
import 'package:hive/hive.dart';
part 'appointment_entity.g.dart';
@HiveType(typeId: 0)
class AppointmentEntity {
   @HiveField(0)
  final String? id;
   @HiveField(1)
  final String? name;
   @HiveField(2)
  final double? price;
   @HiveField(3)
  final String? number;
   @HiveField(4)
  final String? image;

  AppointmentEntity(
      { this.id,
       this.name,
       this.price,
       this.number,
       this.image});
}
