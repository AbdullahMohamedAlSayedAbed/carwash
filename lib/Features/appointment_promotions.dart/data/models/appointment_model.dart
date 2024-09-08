import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';

class AppointmentModel extends AppointmentEntity {
  AppointmentModel(
      { super.id,
       super.name,
       super.price,
       super.number,
       super.image});

  factory AppointmentModel.fromFirestore(Map<String, dynamic> map , String docId) {
    return AppointmentModel(
      id: docId,
      name: map['name'],
      price: map['price'].toDouble(),
      image: map['image'],
      number: map['number'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'number': number,
    };
  }
}
