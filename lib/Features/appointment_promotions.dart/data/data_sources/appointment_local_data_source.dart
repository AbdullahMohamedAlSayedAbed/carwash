import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:carwash/constants.dart';
import 'package:hive/hive.dart';

abstract class AppointmentLocalDataSource {
  List<AppointmentEntity> fetchAppointment();
}

class AppointmentLocalDataSourceImpl extends AppointmentLocalDataSource {
  @override
  List<AppointmentEntity> fetchAppointment() {
    var box = Hive.box<AppointmentEntity>(kAppointmentBox);
    return box.values.toList();
  }
}
