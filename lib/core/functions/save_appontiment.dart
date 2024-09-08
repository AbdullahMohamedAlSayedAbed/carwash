import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:hive/hive.dart';

void saveAppointmentData(List<AppointmentEntity> appointments, String boxName) {
  var box = Hive.box<AppointmentEntity>(boxName);
  if (!box.isOpen) {
    throw Exception("Hive box is not opened");
  }
  box.addAll(appointments);
}

