import 'package:carwash/Features/appointment_promotions.dart/domin/entities/appointment_entity.dart';
import 'package:carwash/Features/appointment_promotions.dart/domin/entities/promotions_entity.dart';
import 'package:carwash/constants.dart';
import 'package:hive/hive.dart';

abstract class AppointmentLocalDataSource {
  List<AppointmentEntity> fetchAppointment();
  List<PromotionsEntity> fetchPromotions();
}

class AppointmentLocalDataSourceImpl extends AppointmentLocalDataSource {
  @override
  List<AppointmentEntity> fetchAppointment() {
    var box = Hive.box<AppointmentEntity>(kAppointmentBox);
    return box.values.toList();
  }
  
  @override
  List<PromotionsEntity> fetchPromotions() {
    var box = Hive.box<PromotionsEntity>(kPromotionBox);
    return box.values.toList();
  }
}
